function example1click() {
    //alert(123);
    document.getElementById("search1_gene").value = "TP53BP2";
    document.getElementById("search2_gene").value = "ABCA1";
}

function btndown() {

    if (!(nodesid2.length == 0)) {

        document.getElementById("gene1").value = nodesid2[0];
        document.getElementById("gene2").value = nodesid2[1];
        $("#form1").submit();
    }
}


$(function () {

    $("#layrow").hide();
    var nodesid2 = [];
    var term_id1;
    var term_id2;
    var pathName = window.document.location.pathname;
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);



    $("#search1_gene").autocomplete({


        source: function (request, response) {
            $.ajax({
                url: "Returndata2.jsp",
                //method : "get",
                dataType: "json",
                data: {qq: request.term},
                success: function (data) {

                    var data1 = eval(data);
                    var list_map = new Array();
                    for (var i in data1) {
                        list_map.push({
                                lable: data1[i].id, value: data1[i].name,
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
            $("#search1_gene").val(ui.item.value);
            return false;
        },
        select: function (event, ui) {
            //alert(ui.item.value);
            $("#search1_gene").val(ui.item.value);
            term_id1 = ui.item.lable;

            return false;
        }
    });


    $("#search2_gene").autocomplete({

        source: function (request, response) {
            $.ajax({
                url: "Returndata2.jsp",
                //method : "get",
                dataType: "json",
                data: {qq: request.term},
                success: function (data) {

                    var data1 = eval(data);
                    var list_map = new Array();
                    for (var i in data1) {
                        list_map.push({
                                lable: data1[i].id, value: data1[i].name,
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

            //alert(ui.item.value);
            $("#search2_gene").val(ui.item.value);
            return false;
        },
        select: function (event, ui) {
            //alert(ui.item.value);
            $("#search2_gene").val(ui.item.value);
            term_id2 = ui.item.lable;

            return false;
        }
    });


    $("#btn_gene").click(function () {


        if (term_id1 == null || term_id1 == "") {
            term_id1 = document.getElementById("search1_gene").value; //

            $("#search1_gene").val(term_id1);

            term_id1 = (function () {

                var id;
                $.ajax({
                    url: projectName + "/getRNANameID",
                    method: "get",
                    async: false,
                    traditional: true,
                    dataType: "text",
                    data: {rna_symbol: term_id1},
                    success: function (datas) {
                        id = datas;
                    }
                });
                return id;
            })();
            term_id1 = term_id1.trim();
        }


        if (term_id2 == null || term_id2 == "") {
            term_id2 = document.getElementById("search2_gene").value; //
            $("#search2_gene").val(term_id2);

            term_id2 = (function () {

                var id;
                $.ajax({
                    url: projectName + "/getRNANameID",
                    method: "get",
                    async: false,
                    traditional: true,
                    dataType: "text",
                    data: {rna_symbol: term_id2},
                    success: function (datas) {
                        id = datas;
                    }
                });

                return id;
            })();

            term_id2 = term_id2.trim();
        }


        if (term_id1 == "") {
            alert("input gene!");
            document.getElementById("search1_gene").focus()

            return false;
        }
        if (term_id2 == "") {
            alert("input gene!");
            document.getElementById("search2_gene").focus()

            return false;
        }


        //alert("term_id1: " + term_id1);
        //alert("term_id2: " + term_id2);
        nodesid2[0] = term_id1;
        nodesid2[1] = term_id2;

        //alert(nodesid2[0] + ", " + nodesid2[1]);
        ////////////////////////////////////////////////////////////////////////////
        if (!(nodesid2.length == 0)) {


            $.ajax({
                url: "Cytoscape_gene.jsp",
                method: "get",
                async: false,
                traditional: true,
                dataType: "json",
                data: {"qc": nodesid2},
                success: function (datas) {
                    datas = eval(datas);

                    draw_options.network = datas;
                    vis.draw(draw_options);
                }
            });


            $(".ssss").hide();
            $("#layrow").show();

            term_id1 = "";
            term_id2 = "";
        }


        ////////////////////////////////////////////////////////////////////////////

    });


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
            {attrValue: "gene", value: "#D74E7C"},
            {attrValue: "mf", value: "#9B9B9B"},
            {attrValue: "do", value: "#9B9B9B"},
            {attrValue: "cc", value: "#9B9B9B"},
            {attrValue: "bp", value: "#9B9B9B"},
            {attrValue: "hpo", value: "#9B9B9B"}
        ]
    };
    var nodesizemapper = {
        attrName: "nodesize",
        entries: [{attrValue: "parent", value: 25}, {attrValue: "child", value: 25}]
    };
    var edgecolormapper = {
        attrName: "edgecolor",
        entries: [
            {attrValue: "mf", value: "#D6D6D6"},
            {attrValue: "do", value: "#D6D6D6"},
            {attrValue: "cc", value: "#D6D6D6"},
            {attrValue: "bp", value: "#D6D6D6"},
            {attrValue: "hpo", value: "#D6D6D6"},
            {attrValue: "inter", value: "#D74E7C"},
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

                shape: {
                    discreteMapper: {
                        attrName: "nodesize",
                        entries: [
                            {attrValue: "parent", value: "RECTANGLE"},
                            {attrValue: "child", value: "circle"},
                        ]
                    }
                },


                //label : { passthroughMapper: { attrName: "label" } },
                labelVerticalAnchor: "bottom",
                labelFontSize: 12,
                labelFontWeight: "bold",
                borderWidth: 3,
                borderColor: {discreteMapper: nodecolormapper},
                //borderColor : "#030303",
                size: {discreteMapper: nodesizemapper},

            },
            edges: {
                width: 3,
                color: {discreteMapper: edgecolormapper},
            }
        },
        layout: $("#select2").val(),//"CompoundSpringEmbedder"
        nodeLabelsVisible: true,

    };
    var layoutname = ["ForceDirected", "Circle", "Radial", "Tree"];
    document.getElementById("layoutSelect").onchange = function () {
        var layoutS = document.getElementById("layoutSelect");
        idlayoutname = parseInt(layoutS.options[layoutS.selectedIndex].value);

        //alert(layoutname[(idlayoutname)]);
        vis.layout(layoutname[(idlayoutname)]);

    };


});