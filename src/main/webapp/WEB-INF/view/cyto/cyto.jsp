<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>

<head>
    <title>Cytoscape Web example</title>

    <!-- JSON support for IE (needed to use JS API) -->
    <script type="text/javascript" src="./js/cytoscapeweb/json2.min.js"></script>

    <!-- Flash embedding utility (needed to embed Cytoscape Web) -->
    <script type="text/javascript" src="./js/cytoscapeweb/AC_OETags.min.js"></script>

    <!-- Cytoscape Web JS API (needed to reference org.cytoscapeweb.Visualization) -->
    <script type="text/javascript" src="./js/cytoscapeweb/cytoscapeweb.min.js"></script>

    <script type="text/javascript">
        window.onload = function () {
            // id of Cytoscape Web  container div
            var div_id = "cytoscapeweb";

            // create a network model object
            var network_json = {
                // you need to specify a data schema for custom attributes!
                dataSchema: {
                    nodes: [{name: "label", type: "string"},
                        {name: "foo", type: "string"}
                    ],
                    edges: [{name: "label", type: "string"},
                        {name: "bar", type: "string"}
                    ]
                },
                // NOTE the custom attributes on nodes and edges
                data: {
                    nodes: [{id: "1", label: "1", foo: "Is this the real life?"},
                        {id: "2", label: "2", foo: "Is this just fantasy?"}, {id: "3", label: "3", foo: "Is this just fantasy?"}
                    ],
                    edges: [{id: "2to1", target: "1", source: "2", label: "2 to 1", bar: "Caught in a landslide..."},{id: "2to1", target: "1", source: "2", label: "2 to 1", bar: "Caught in a landslide..."}
                    ]
                }
            };

            // initialization options
            var options = {
                // where you have the Cytoscape Web SWF
                swfPath: "./js/cytoscapeweb/CytoscapeWeb",
                // where you have the Flash installer SWF
                flashInstallerPath: "./js/cytoscapeweb/playerProductInstall"
            };


            var vis = new org.cytoscapeweb.Visualization(div_id, options);

            // callback when Cytoscape Web has finished drawing
            vis.ready(function () {

                // add a listener for when nodes and edges are clicked
                vis.addListener("click", "nodes", function (event) {
                    handle_click(event);
                })
                    .addListener("click", "edges", function (event) {
                        handle_click(event);
                    });

                function handle_click(event) {
                    var target = event.target;

                    clear();
                    print("event.group = " + event.group);
                    for (var i in target.data) {
                        var variable_name = i;
                        var variable_value = target.data[i];
                        print("event.target.data." + variable_name + " = " + variable_value);
                    }
                }


                function clear() {
                    document.getElementById("note").innerHTML = "";
                }

                function print(msg) {
                    document.getElementById("note").innerHTML += "<p>" + msg + "</p>";
                }
            });

            // draw options
            var draw_options = {
                // your data goes here
                network: network_json,
                // hide pan zoom
                panZoomControlVisible: false
            };

            vis.draw(draw_options);
        };
    </script>

    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: Helvetica, Arial, Verdana, sans-serif;
        }

        html, body {
            height: 100%;
            width: 100%;
            padding: 0;
            margin: 0;
        }

        body {
            line-height: 1.5;
            color: #000000;
            font-size: 14px;
        }

        /* The Cytoscape Web container must have its dimensions set. */
        #cytoscapeweb {
            width: 100%;
            height: 50%;
        }

        #note {
            width: 100%;
            height: 50%;
            background-color: #f0f0f0;
            overflow: auto;
        }

        p {
            padding: 0 0.5em;
            margin: 0;
        }

        p:first-child {
            padding-top: 0.5em;
        }
    </style>
</head>

<body>
<div id="cytoscapeweb">
    Cytoscape Web will replace the contents of this div with your graph.
</div>
<div id="note">
    <p>Click nodes or edges.</p>
</div>
</body>

</html>