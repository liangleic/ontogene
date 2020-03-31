function example1click() {
    //alert(123);
    document.getElementById("search1").value = "type 2 diabetes mellitus";
}

function example2click() {
    //alert(123);
    document.getElementById("search2").value = "TP53BP1";
}


$(function () {
    var znodes;
    var nodesid = [];
    var term_id;
    var gene_id;
    var pathName = window.document.location.pathname;
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    var setting = {
        data: {
            simpleData: {
                enable: true,
            }
        },
        async: {
            enable: true,
            url: projectName + "/getAsyncTree",
            autoParam: ["id", "termid"],
            //dataFilter : filter,
        },
        callback: {
            onClick: click,
            onRightClick: rightclick,
        },
    };
    $("#search1").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: projectName + "/getTermList",
                //method : "get",
                dataType: "json",
                data: {
                    term_name: request.term
                },
                success: function (data) {

                    var data1 = eval(data);
                    var list_map = new Array();
                    for (var i in data1) {
                        list_map.push({
                                lable: data1[i].id,
                                value: data1[i].name,
                                description: data1[i].description
                            }
                        );
                    }
                    response(list_map);
                }
            });
        },
        //autoFocus : true,
        minLength: 3,
        delay: 500,
        focus: function (event, ui) {
            $("#search1").val(ui.item.value);
            return false;
        },
        select: function (event, ui) {
            //alert(ui.item.value);
            $("#search1").val(ui.item.value);
            term_id = ui.item.lable;


            //alert(term_id);
            var ssss = ui.item.description.split("\\n");
            var string = "";
            for (var i = 0; i < ssss.length; i++) {
                string += ssss[i] + "<br>";
            }
            $("#test").html(string);
            //$("#tree").show();
            return false;
        }
    });


    $("#btn1").click(function () {
        //alert($("#search1").val()  );
        //get node()

        if (term_id == "" || term_id == null) {
            term_id = document.getElementById("search1").value; //

            $("#search1").val(term_id);


            term_id = (function () {

                var id;
                $.ajax({
                    url: projectName + "/getTerm",
                    method: "get",
                    async: false,
                    traditional: true,
                    dataType: "text",
                    data: {
                        term_name: term_id
                    },
                    success: function (datas) {
                        id = datas;
                    }
                });

                return id;
            })();

            /*  var sss = (function(){

                    var id;
                    $.ajax({
                    url : "description.jsp",
                    method : "get",
                    async : false,
                    traditional : true,
                    dataType : "text",
                    data : {termName : term_id},
                    success : function(datas){
                        id  = datas;
                    }
                });

                 return id;
             })(); */

            term_id = term_id.trim();
        }

        //alert("btn1");
        $("#test").hide();
        $("#tree").show();
        $("#tree2").hide();
        $(".ssss").hide();

        //alert(document.getElementById("search1").value);
        //alert("term id: " + term_id);

        $.ajax({
            url: projectName + "/getTree",
            method: "get",
            async: false,
            dataType: "json",
            data: {
                term_id: term_id
            },
            success: function (datap) {
                var data1 = eval(datap);
                znodes = data1;
                $.fn.zTree.init($("#treedisplay"), setting, znodes);


                var ztree = $.fn.zTree.getZTreeObj("treedisplay");
                var rednode = ztree.getNodeByParam("termid", term_id, null);
                ztree.selectNode(rednode); // rednode.selected = true;
                //ztree.setting.view.fontCss["background-color"] = "#FF3333";
                //ztree.updateNode(rednode, false);
            },
            error: function (er) {
                console.log(er)
            }
        });


        $.ajax({
            url: projectName + "/getAnnotation",
            method: "get",
            async: false,
            dataType: "json",
            traditional: true,
            data: {
                "term_id": term_id
            },
            success: function (datap) {
                datap = eval(datap);

                //print table
                $("#example").DataTable({
                    destroy: true,
                    data: datap,
                    columns: [
                        {
                            title: "Term ID"
                        },
                        {
                            title: "Term name"
                        },
                        {
                            title: "Gene ID"
                        },
                        {
                            title: "Gene symbol"
                        },
                        {
                            title: "RNA type"
                        },
                        {
                            title: "Sources"
                        }
                    ],

                    dom: 'Bfrtip',
                    buttons: [
                        // 'copyHtml5',
                        'excelHtml5',
                        // 'csvHtml5',
                        // 'pdfHtml5'
                    ]
                });
            }
        });

        $('#no1').each(function () {
            this.click();
        });

        $("#accordiongene").empty();
        $("#accordion").empty();

        nodesid[0] = term_id;
        term_id = null;

    });

    //async node
    function filter(treeid, parentnode, responsedata) {
        return (responsedata);
    }

    function click(event, treeid, treenode, clickFlag) {
        //remove css
    }

    function rightclick(event, treeid, treenode) {
        showRMenu("root", event.clientX, event.clientY);
    }

    rMenu = $("#rMenu");

    function showRMenu(type, x, y) {
        $("#rMenu ul").show();
        $("#rMenu").css({
            "top": y + "px",
            "left": x + "px",
            "visibility": "visible"
        });
        $("body").bind("mousedown", onBodyMouseDown);
    }

    function hideRMenu() {
        if (rMenu) rMenu.css({
            "visibility": "hidden"
        });
        $("body").unbind("mousedown", onBodyMouseDown);
    }

    function onBodyMouseDown(event) {
        if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length > 0)) {
            $("#rMenu").css({
                "visibility": "hidden"
            });
        }
    }


    $("#madd").click(function () { // sql-return value


        $("#accordion").empty();
        $("#accordiongene").empty();


        hideRMenu();

        //alert("nodes");
        nodesid = [];
        //alert("hello");
        var zTree = $.fn.zTree.getZTreeObj("treedisplay");
        var nodes = zTree.getSelectedNodes();
        //zTree.cancelSelectedNode();
        for (var i = 0; i < nodes.length; i++) {
            nodesid[i] = nodes[i].termid;
        }

        //var ztree = $.fn.zTree.getZTreeObj("treedisplay");
        //var rednode = ztree.getNodeByParam("termid", term_id, null);
        //ztree.setting.view.fontCss["background-color"] = "#FF3333";
        //ztree.updateNode(rednode, false);

        $.ajax({
            url: projectName + "/getTermList",
            method: "get",
            async: false,
            dataType: "json",
            traditional: true,
            data: {
                "qqq": nodesid
            },
            success: function (datap) {
                datap = eval(datap);

                //print table
                $("#example").DataTable({
                    destroy: true,
                    data: datap,
                    columns: [
                        {
                            title: "Term ID"
                        },
                        {
                            title: "Term name"
                        },
                        {
                            title: "Gene ID"
                        },
                        {
                            title: "Gene symbol"
                        },
                        {
                            title: "RNA type"
                        },
                        {
                            title: "Sources"
                        }
                    ],
                    /*
                              aoColumnDefs: [
                                               {"sWidth":"4em", "aTargets": ['2']},
                                               {"sWidth":"4em", "aTargets": ['3']},
                                               {"sWidth":"4em", "aTargets": ['4']},
                                               {"sWidth":"4em", "aTargets": ['5']},
                                           ], */

                    dom: 'Bfrtip',
                    buttons: [
                        // 'copyHtml5',
                        'excelHtml5',
                        // 'csvHtml5',
                        // 'pdfHtml5'
                    ]
                });
            }
        });

        //alert("something");
        $('#no1').each(function () {
            this.click();
        });

    });

    $("#no3").click(function () {
        //alert(nodesid[0]); no problem

        var noContent = $("#accordion").html();

        if (!(nodesid.length == 0) && (noContent == null || noContent.length == 0)) {

            //$("#accordion").empty();
            //$("#accordiongene").empty();


            $.ajax({
                url: projectName + "/getDescript",
                method: "get",
                async: false,
                traditional: true,
                dataType: "json",
                data: {
                    "qns": nodesid
                },
                success: function (dataq) {
                    dataq = eval(dataq);

                    for (var i = 0; i < nodesid.length; i++) {
                        var detail = dataq[i].description.split("\\n");
                        var str = "<h3>" + detail[0] + "</h3> <div><p>";
                        for (var j = 1; j < detail.length; j++) {
                            str += detail[j] + "<br>";
                        }
                        str += "</p> </div>";
                        $("#accordion").append(str);

                    }
                    $("#accordion").accordion({
                        collapsible: true,
                        heightStyle: "content",
                    });
                    $("#accordion").accordion("refresh");
                }
            });
        }
    });


    $("#no4").click(function () {
        //alert(nodesid[0]);
        var noContent = $("#accordiongene").html();

        if (!(nodesid.length == 0) && (noContent == null || noContent.length == 0))

            if (!(nodesid.length == 0)) {

                $("#accordiongene").empty();
                $.ajax({
                    url: projectName + "/getGeneDescript",
                    method: "get",
                    async: false,
                    traditional: true,
                    dataType: "json",
                    data: {
                        "qns": nodesid
                    },
                    success: function (dataq) {
                        dataq = eval(dataq);

                        //alert(dataq[0].description);

                        for (var i = 0; i < dataq.length; i++) {
                            var detail = dataq[i].description.split("\\n");
                            var str = "<h3>" + detail[0] + "</h3> <div><p>";
                            for (var j = 1; j < detail.length; j++) {
                                str += detail[j] + "<br>";
                            }
                            str += "</p> </div>";
                            $("#accordiongene").append(str);

                        }
                        $("#accordiongene").accordion({
                            collapsible: true,
                            heightStyle: "content",
                        });
                        $("#accordiongene").accordion("refresh");
                    }
                });
            }
    });


    //cytoscape web

    $("#no2").click(function () {

        if (!(nodesid.length == 0)) {
            //alert("select" + $("#select").val());
            var div_id = "cytoscape";
            //initilization options
            var options = {
                swfPath: "jss/cytoscapeweb/CytoscapeWeb",
                flashInstallerPath: "jss/cytoscapeweb/playerProductInstall",
            };
            var vis = new org.cytoscapeweb.Visualization(div_id, options);
            //draw options
            var nodecolormapper = {
                attrName: "nodecolor",
                entries: [
                    {
                        attrValue: "mRNA",
                        value: "#8E388E"
                    },
                    {
                        attrValue: "miRNA",
                        value: "#FF1493"
                    },
                    {
                        attrValue: "lncRNA",
                        value: "#FF0000"
                    }
                ]
            };
            var nodesizemapper = {
                attrName: "nodesize",
                entries: [
                    {
                        attrValue: "parent",
                        value: "80"
                    },
                    {
                        attrValue: "child",
                        value: "55"
                    }
                ]
            };
            var edgecolormapper = {
                attrName: "edgecolor",
                entries: [
                    {
                        attrValue: "mRNA",
                        value: "#1C86EE"
                    }, //black
                    {
                        attrValue: "miRNA",
                        value: "#FF3030"
                    },
                    {
                        attrValue: "lncRNA",
                        value: "#FF3E93"
                    },
                    {
                        attrValue: "mRNA-mRNA",
                        value: "#6A5ACD"
                    },
                    {
                        attrValue: "mRNA-miRNA",
                        value: "#FF7F00"
                    },
                    {
                        attrValue: "miRNA-mRNA",
                        value: "#FF7F00"
                    },
                    {
                        attrValue: "mRNA-lncRNA",
                        value: "#9400D3"
                    },
                    {
                        attrValue: "lncRNA-mRNA",
                        value: "#9400D3"
                    },
                    {
                        attrValue: "miRNA-lncRNA",
                        value: "#8B0000"
                    },
                    {
                        attrValue: "lncRNA-miRNA",
                        value: "#8B0000"
                    },
                ]
            };
            vis["nodesizemapper"] = function (data) {
                var sizenumber = parseInt(data["edgewidth"]);
                return (Math.log(sizenumber) + 2);
            };

            //alert($("#select").val());

            var draw_options = {
                //network : datass,

                visualStyle: {
                    global: {
                        //backgroundColor: "#CCCCCC"
                    },
                    nodes: {
                        //label : { passthroughMapper: { attrName: "label" } },
                        labelVerticalAnchor: "bottom",
                        labelFontSize: 24,
                        labelFontWeight: "bold",
                        borderWidth: 3,
                        borderColor: {
                            discreteMapper: nodecolormapper
                        },
                        //borderColor : "#030303",
                        size: {
                            discreteMapper: nodesizemapper
                        },
                        color: {
                            discreteMapper: {
                                attrName: "nodesize",
                                entries: [{
                                    attrValue: "parent",
                                    value: "#8B7765"
                                }]
                            }
                        }
                    },
                    edges: {
                        width: {
                            defaultValue: 4,
                            customMapper: {
                                functionName: "nodesizemapper"
                            }
                        }, //5,
                        color: {
                            discreteMapper: edgecolormapper
                        },
                    }
                },
                layout: $("#select").val(),
                nodeLabelsVisible: true,
                //nodeTooltipsEnabled : true,
            };


            $.ajax({
                url: "Cytoscape.jsp",
                method: "get",
                async: false,
                traditional: true,
                dataType: "json",
                data: {
                    "qc": nodesid
                },
                success: function (datas) {
                    datas = eval(datas);

                    draw_options.network = datas;

                    //alert("draw_options: " + datas);
                    vis.draw(draw_options);
                }
            });
        }


        $("#select").change(function () {


            var layoutS = document.getElementById("select");

            //vis.layout(layoutS.value);

            $('#no2').each(function () {
                this.click();
            });


        });


    });
    //search2
    var znodes2;
    var nodesid2 = [];
    var term_id2;
    var setting2 = {
        data: {
            simpleData: {
                enable: true,
            }
        },
        async: {
            enable: true,
            url: projectName + "/getAsyncTree",
            autoParam: ["id", "termid"],
            //dataFilter : filter,
        },
        callback: {
            onClick: click,
            onRightClick: rightclick2,
        },
    };
    $("#search2").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: projectName + "/getRnaList",
                method: "get",
                dataType: "json",
                data: {
                    rna_symbol: request.term
                },
                success: function (data) {

                    var data1 = eval(data);
                    var list_map = new Array();
                    for (var i in data1) {
                        list_map.push({
                                lable: data1[i].id,
                                value: data1[i].name
                            }
                        );
                    }
                    response(list_map);
                }
            });
        },
        //autoFocus : true,
        minLength: 3,
        delay: 500,
        focus: function (event, ui) {
            $("#search2").val(ui.item.value);
            return false;
        },
        select: function (event, ui) {
            $("#search2").val(ui.item.value);
            term_id2 = ui.item.lable;
            //alert(term_id2);
            //$("#test").html(ui.item.description);
            //$("#tree").show();
            return false;
        }
    });

    $("#btn2").click(function () {
        //alert($("#search1").val()  );
        //get node()

        nodesid2 = [];

        if (term_id2 == null || term_id2 == "") {
            term_id2 = document.getElementById("search2").value; //


            $("#search2").val(term_id2);

            term_id2 = (function () {

                var id;
                $.ajax({
                    url: projectName + "/getRNANameID",
                    method: "get",
                    async: false,
                    traditional: true,
                    dataType: "text",
                    data: {
                        rna_symbol: term_id2
                    },
                    success: function (datas) {
                        id = datas;
                    }
                });

                return id;
            })();

            term_id2 = term_id2.trim();
        }


        gene_id = term_id2;


        $("#test").hide();
        $("#tree").hide();
        $("#tree2").show();
        $(".ssss").hide();
        //$("#tree").show();
        //$("#tree2").hide();

        var div_id = "cytoscape2";
        //initilization options
        var options = {
            swfPath: "jss/cytoscapeweb/CytoscapeWeb",
            flashInstallerPath: "jss/cytoscapeweb/playerProductInstall",
        };
        var vis = new org.cytoscapeweb.Visualization(div_id, options);
        var nosizemapper = {
            attrName: "nodesize",
            entries: [{
                attrValue: "parent",
                value: 80
            }, {
                attrValue: "child",
                value: 55
            }]
        };
        var edmapp = {
            attrName: "edgecolor",
            entries: [
                {
                    attrValue: "mf",
                    value: "#1C86E"
                },
                {
                    attrValue: "do",
                    value: "#FF3030"
                },
                {
                    attrValue: "cc",
                    value: "#FF3E93"
                },
                {
                    attrValue: "bp",
                    value: "#6A5ACD"
                },
                {
                    attrValue: "hpo",
                    value: "#FF7F00"
                }
            ]
        }
        var draw_options = {
            //network : datass,

            visualStyle: {
                global: {
                    //backgroundColor: "#CCCCCC"
                },
                nodes: {
                    labelVerticalAnchor: "bottom",
                    labelFontSize: 24,
                    labelFontWeight: "bold",
                    borderWidth: 3,
                    size: {
                        discreteMapper: nosizemapper
                    }
                },
                edges: {
                    width: 5,
                    color: {
                        discreteMapper: edmapp
                    }
                }
            },
            layout: $("#select2").val(), //"CompoundSpringEmbedder"
            nodeLabelsVisible: true,
            //nodeTooltipsEnabled : true,
        };
        $("#accordion2").empty();

        //alert("21");

        $("#select2").change(function () {
            //alert("hello");
            //var layoutname=["ForceDirected", "Circle","Radial", "Tree"];

            var layoutS = document.getElementById("select2");
            //alert("RNA layout: " + layoutS.value);
            //idlayoutname = parseInt(layoutS.options[layoutS.selectedIndex].value);

            //alert("idlayoutname: " + layoutS.value);

            //vis.layout(layoutS.value);


            $('#no22').each(function () {
                //alert("nothing");
                this.click();
            });
        });


        $.ajax({
            url: projectName + "/getAnnotationGene",
            method: "get",
            async: false,
            dataType: "json",
            data: {
                rna_hgnc_id: term_id2
            },
            success: function (datap) {

                datap = eval(datap);
                //tree
                znodes2 = datap.path;
                $.fn.zTree.init($("#treedisplay2"), setting2, znodes2);

                //table
                $("#example2").DataTable({
                    destroy: true,
                    data: datap.table,
                    columns: [
                        {
                            title: "Term ID"
                        },
                        {
                            title: "Term name"
                        },
                        {
                            title: "Gene ID"
                        },
                        {
                            title: "Gene symbol"
                        },
                        {
                            title: "RNA type"
                        },
                        {
                            title: "Sources"
                        }
                    ],


                    /* aoColumnDefs: [
                                     {"sWidth":"4em", "aTargets": ['Term name']},
                                     {"sWidth":"4em", "aTargets": ['Gene symbol']},
                                     {"sWidth":"4em", "aTargets": ['RNA type']},
                                     {"sWidth":"4em", "aTargets": ['HGNC ID']},
                                 ], */

                    dom: 'Bfrtip',
                    buttons: [
                        // 'copyHtml5',
                        'excelHtml5',
                    ]
                });
                //cytoscape
                //draw_options.network = datap.Cysto;
                //alert
                //vis.draw(draw_options);
                //accordion

            }
        });

        //alert("nothing");
        $('#no12').each(function () {
            this.click();
        });


        term_id2 = null;

    });

    function rightclick2(event, treeid, treenode) {
        showRMenu2("root", event.clientX, event.clientY);
    }

    rMenu2 = $("#rMenu2");

    function showRMenu2(type, x, y) {
        $("#rMenu2 ul").show();
        $("#rMenu2").css({
            "top": y + "px",
            "left": x + "px",
            "visibility": "visible"
        });
        $("body").bind("mousedown", onBodyMouseDown2);
    }

    function hideRMenu2() {
        if (rMenu2) rMenu2.css({
            "visibility": "hidden"
        });
        $("body").unbind("mousedown", onBodyMouseDown2);
    }

    function onBodyMouseDown2(event) {
        if (!(event.target.id == "rMenu2" || $(event.target).parents("#rMenu2").length > 0)) {
            $("#rMenu2").css({
                "visibility": "hidden"
            });
        }
    }

    function test() {
        alert(12321);
    }

    function detailtwo(params) {
        alert(12);
        $("#sourcedetail2").empty();
        $("#52").display = "block";

        $.ajax({
            url: "detail2.jsp",
            method: "get",
            async: false,
            traditional: true,
            dataType: "json",
            data: {
                "params": params
            },
            success: function (dataq) {
                dataq = eval(dataq);

                for (var i = 0; i < dataq.length; i++) {
                    var detail = dataq[i].description.split("\\n");
                    var str = "<h3>" + detail[0] + "</h3> <div><p>";
                    for (var j = 1; j < detail.length; j++) {
                        str += detail[j] + "<br>";
                    }
                    str += "</p> </div>";
                    $("#accordiongene").append(str);

                }
                $("#accordiongene").accordion({
                    collapsible: true,
                    heightStyle: "content",
                });
                $("#accordiongene").accordion("refresh");
            }
        });
    }


    $("#madd2").click(function () { // sql-return value
        hideRMenu2();
        nodesid2 = [];
        gene_id = "";
        $("#accordion2").empty();
        $("#accordiongene2").empty();
        //alert("hello");
        var zTree = $.fn.zTree.getZTreeObj("treedisplay2");
        var nodes = zTree.getSelectedNodes();
        //zTree.cancelSelectedNode();
        for (var i = 0; i < nodes.length; i++) {
            nodesid2[i] = nodes[i].termid; // don't forget change
        }

        //alert("something");
        $.ajax({
            url: "rightshow.jsp",
            method: "get",
            async: false,
            dataType: "json",
            traditional: true,
            data: {
                "qqq": nodesid2
            },
            success: function (datap) {
                datap = eval(datap);
                //print table
                $("#example2").DataTable({
                    destroy: true,
                    data: datap,
                    columns: [
                        {
                            title: "Term ID"
                        },
                        {
                            title: "Term name"
                        },
                        {
                            title: "Gene ID"
                        },
                        {
                            title: "Gene symbol"
                        },
                        {
                            title: "RNA type"
                        },
                        {
                            title: "Sources"
                        }
                    ],

                    /*  aoColumnDefs: [
                                      {"sWidth":"4em", "aTargets": ['Term name']},
                                      {"sWidth":"4em", "aTargets": ['Gene symbol']},
                                      {"sWidth":"4em", "aTargets": ['RNA type']},
                                      {"sWidth":"4em", "aTargets": ['HGNC ID']},
                                  ], */

                    dom: 'Bfrtip',
                    buttons: [
                        // 'copyHtml5',
                        'excelHtml5',
                    ]
                });
            }
        });
        $("#accordion2").empty();

        // alert("nothing");
        $('#no12').each(function () {
            this.click();
        });

    });

    $("#no32").click(function () {

        var noContent = $("#accordion2").html();


        if (!(gene_id.length == 0) && (noContent == null || noContent.length == 0)) {

            $("#accordion2").empty();
            nodesid2 = [];

            $.ajax({
                url: projectName + "/getDescriptionGene",
                method: "get",
                async: false,
                traditional: true,
                dataType: "json",
                data: {
                    rna_hgnc_id: gene_id
                },
                success: function (dataq) {
                    dataq = eval(dataq);

                    var accda = dataq.description;

                    for (var i = 0; i < accda.length; i++) {
                        var detail = accda[i].split("\\n");
                        var str = "<h3>" + detail[0] + "</h3> <div><p>";
                        for (var j = 1; j < detail.length; j++) {
                            str += detail[j] + "<br>";
                        }
                        str += "</p> </div>";
                        $("#accordion2").append(str);
                    } //alert(accda[0]);
                    $("#accordion2").accordion({
                        collapsible: true,
                        heightStyle: "content",
                    });
                    $("#accordion2").accordion("refresh");

                    /* for(var i=0; i<nodesid2.length; i++){
                        var detail = dataq[i].description.split("\\n");
                        var str = "<h3>"+detail[0]+"</h3> <div><p>";
                        for(var j=1; j<detail.length; j++){
                            str += detail[j]+"<br>";
                        }
                        str += "</p> </div>";
                        $("#accordion2").append(str);
                        //alert(str);

                    }
                    $("#accordion2").accordion({
                        collapsible: true,
                        heightStyle: "content",
                    });
                    $("#accordion2").accordion("refresh"); */
                }
            });

        } else if ((!(nodesid2.length == 0) && (noContent == null || noContent.length == 0))) {
            gene_id = "";
            $.ajax({
                url: "descript.jsp",
                method: "get",
                async: false,
                traditional: true,
                dataType: "json",
                data: {
                    "qns": nodesid2
                },
                success: function (dataq) {
                    dataq = eval(dataq);

                    for (var i = 0; i < nodesid2.length; i++) {
                        var detail = dataq[i].description.split("\\n");
                        var str = "<h3>" + detail[0] + "</h3> <div><p>";
                        for (var j = 1; j < detail.length; j++) {
                            str += detail[j] + "<br>";
                        }
                        str += "</p> </div>";
                        $("#accordion2").append(str);
                        //alert(str);

                    }
                    $("#accordion2").accordion({
                        collapsible: true,
                        heightStyle: "content",
                    });
                    $("#accordion2").accordion("refresh");

                }
            });
        }
    });


    $("#no42").click(function () {
        //alert(nodesid[0]);
        var noContent = $("#accordiongene2").html();

        //alert(gene_id);

        if (!(gene_id.length == 0)) {
            //alert("456");
            //alert(noContent);

            if (noContent == null || noContent.length == 0) {


                //alert("123231");
                nodesid2 = [];

                $("#accordiongene2").empty();
                $.ajax({
                    url: projectName + "/getGeneDescriptGene",
                    method: "get",
                    async: false,
                    traditional: true,
                    dataType: "json",
                    data: {
                        "hgnc_id": gene_id
                    },
                    success: function (dataq) {
                        dataq = eval(dataq);

                        //alert(dataq[0].description);

                        for (var i = 0; i < dataq.length; i++) {
                            var detail = dataq[i].description.split("\\n");
                            var str = "<h3>" + detail[0] + "</h3> <div><p>";
                            for (var j = 1; j < detail.length; j++) {
                                str += detail[j] + "<br>";
                            }
                            str += "</p> </div>";
                            $("#accordiongene2").append(str);

                        }
                        $("#accordiongene2").accordion({
                            collapsible: true,
                            heightStyle: "content",
                        });
                        $("#accordiongene2").accordion("refresh");
                    }
                });

            }
        } else if (!(nodesid2.length == 0) && (noContent == null || noContent.length == 0)) {
            gene_id = "";

            $("#accordiongene2").empty();
            $.ajax({
                url: "genedescript.jsp",
                method: "get",
                async: false,
                traditional: true,
                dataType: "json",
                data: {
                    "qns": nodesid2
                },
                success: function (dataq) {
                    dataq = eval(dataq);

                    //alert(dataq[0].description);

                    for (var i = 0; i < dataq.length; i++) {
                        var detail = dataq[i].description.split("\\n");
                        var str = "<h3>" + detail[0] + "</h3> <div><p>";
                        for (var j = 1; j < detail.length; j++) {
                            str += detail[j] + "<br>";
                        }
                        str += "</p> </div>";
                        $("#accordiongene2").append(str);

                    }
                    $("#accordiongene2").accordion({
                        collapsible: true,
                        heightStyle: "content",
                    });
                    $("#accordiongene2").accordion("refresh");
                }
            });
        }
    });


    //cytoscape web
    $("#no22").click(function () {
        //alert("12323!");


        if ((nodesid2.length == 0)) {
            $('#btn2').each(function () {
                //alert("nothing");
                this.click();
            });
        }

        if (!(nodesid2.length == 0)) {
            //alert($("#select").val());
            //alert("12312!");
            var div_id = "cytoscape2";
            //initilization options
            var options = {
                swfPath: "jss/cytoscapeweb/CytoscapeWeb",
                flashInstallerPath: "jss/cytoscapeweb/playerProductInstall",
            };
            var vis = new org.cytoscapeweb.Visualization(div_id, options);
            //draw options
            var nodecolormapper = {
                attrName: "nodecolor",
                entries: [
                    {
                        attrValue: "mRNA",
                        value: "#8E388E"
                    },
                    {
                        attrValue: "miRNA",
                        value: "#FF1493"
                    },
                    {
                        attrValue: "lncRNA",
                        value: "#FF0000"
                    }
                ]
            };
            var nodesizemapper = {
                attrName: "nodesize",
                entries: [
                    {
                        attrValue: "parent",
                        value: "80"
                    },
                    {
                        attrValue: "child",
                        value: "55"
                    }
                ]
            };
            var edgecolormapper = {
                attrName: "edgecolor",
                entries: [
                    {
                        attrValue: "mRNA",
                        value: "#1C86EE"
                    }, //black
                    {
                        attrValue: "miRNA",
                        value: "#FF3030"
                    },
                    {
                        attrValue: "lncRNA",
                        value: "#FF3E93"
                    },
                    {
                        attrValue: "mRNA-mRNA",
                        value: "#6A5ACD"
                    },
                    {
                        attrValue: "mRNA-miRNA",
                        value: "#FF7F00"
                    },
                    {
                        attrValue: "miRNA-mRNA",
                        value: "#FF7F00"
                    },
                    {
                        attrValue: "mRNA-lncRNA",
                        value: "#9400D3"
                    },
                    {
                        attrValue: "lncRNA-mRNA",
                        value: "#9400D3"
                    },
                    {
                        attrValue: "miRNA-lncRNA",
                        value: "#8B0000"
                    },
                    {
                        attrValue: "lncRNA-miRNA",
                        value: "#8B0000"
                    },
                ]
            };
            vis["nodesizemapper"] = function (data) {
                var sizenumber = parseInt(data["edgewidth"]);
                return (Math.log(sizenumber) + 2);
            };

            //alert("select 2: " + $("#select2").value);
            var draw_options = {
                //network : datass,

                visualStyle: {
                    global: {
                        //backgroundColor: "#CCCCCC"
                    },
                    nodes: {
                        //label : { passthroughMapper: { attrName: "label" } },
                        labelVerticalAnchor: "bottom",
                        labelFontSize: 24,
                        labelFontWeight: "bold",
                        borderWidth: 3,
                        borderColor: {
                            discreteMapper: nodecolormapper
                        },
                        //borderColor : "#030303",
                        size: {
                            discreteMapper: nodesizemapper
                        },
                        color: {
                            discreteMapper: {
                                attrName: "nodesize",
                                entries: [{
                                    attrValue: "parent",
                                    value: "#8B7765"
                                }]
                            }
                        }
                    },
                    edges: {
                        width: {
                            defaultValue: 4,
                            customMapper: {
                                functionName: "nodesizemapper"
                            }
                        }, //5,
                        color: {
                            discreteMapper: edgecolormapper
                        },
                    }
                },
                layout: $("#select2").val(), //"CompoundSpringEmbedder"
                nodeLabelsVisible: true,
                //nodeTooltipsEnabled : true,
            };


            $.ajax({
                url: "Cytoscape.jsp",
                method: "get",
                async: false,
                traditional: true,
                dataType: "json",
                data: {
                    "qc": nodesid2
                },
                success: function (datas) {
                    datas = eval(datas);

                    draw_options.network = datas;
                    vis.draw(draw_options);
                }
            });
        }
    });
});
