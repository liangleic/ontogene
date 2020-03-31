var nodesid2 = [];
var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

function example1click() {
    document.getElementById("search1_gene").value = "positive regulation of protein localization to plasma membrane";
    document.getElementById("search2_gene").value = "type 2 diabetes mellitus";
}

//存放所有输入窗口的term
var term_names = new Array();
var search_genes = new Array();
var term_ids = new Array();
var oId = 3;

//点击增加输入框
function add_term() {
    var term_div_temp = $("#term_div").clone(true);
    term_div_temp.children(0).attr('id', 'search' + oId + '_gene');
    oId += 1;
    $("#term_div").before(term_div_temp);

    var i = 0;
    var div_items = $("#term_div_parent").children().each(function () {
        // console.log($(this).children().attr("id"));
        term_names[i] = $($(this).children("input").get(0)).val();
        search_genes[i] = $(this).children("input").attr("id");
        console.log("111:" + term_names[i]);

        i++;
    });
    console.log(JSON.stringify("term_namessssss:" + term_names));
    console.log(JSON.stringify("search_genessss:" + search_genes));
    // 插件根据用户输入值进行搜索和过滤，让用户快速找到并从预设值列表中选择。
    // 此方法会在input框中输入字符执行
    // for (var i = 0; i < search_genes.length; i++) {
    //     console.log("autocomplete执行了-----" + i);
    //     $("#" + search_genes[i]).autocomplete({
    //         source: function (request, response) {
    //             console.log("request.term:" + request);
    //             $.ajax({
    //                 url: projectName + "/getTermList",
    //                 //method : "get",
    //                 dataType: "json",
    //                 data: {term_name: request.term},
    //                 success: function (data) {
    //                     var data1 = eval(data);
    //                     var list_map = new Array();
    //                     for (var i in data1) {
    //                         list_map.push({
    //                                 lable: data1[i].id, value: data1[i].name,
    //                                 description: data1[i].description
    //                             }
    //                         );
    //                     }
    //                     response(list_map);
    //                 }
    //             });
    //         },
    //
    //         // autoFocus: true,
    //         minLength: 3,
    //         delay: 500,
    //         focus: function (event, ui) {
    //             $("#" + search_genes[i]).val(ui.item.value);
    //             return false;
    //         },
    //         select: function (event, ui) {
    //             //alert(ui.item.value);
    //             $("#" + search_genes[i]).val(ui.item.value);
    //             term_id1 = ui.item.lable;
    //
    //             return false;
    //         }
    //     });
    // }


}


//点击增加输入框
function sub_term(obj) {
    // 获取点击节点的父节点的父节点的个数，为了控制页面的文本框总大于4个
    console.log($(obj).parent().parent().children());
    var length = $(obj).parent().parent().children().length;
    if (length > 2) {
        $(obj).parent().remove();
    } else {
        alert("term个数不少于2个！");
    }

}

function btndown() {

    if (!(nodesid2.length == 0)) {

        document.getElementById("term1").value = nodesid2[0];
        document.getElementById("term2").value = nodesid2[1];
        //alert(document.getElementById("gene1").value);

        // alert(nodesid2[0] + ", " + nodesid2[1]);
        $("#form1").submit();
    }
}


$(function () {

    $("#layrow").hide();
    var term_id1;
    var term_id2;
    var pathName = window.document.location.pathname;
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);

    // 插件根据用户输入值进行搜索和过滤，让用户快速找到并从预设值列表中选择。
    // 此方法会在input框中输入字符执行

    // $("#search1_gene").autocomplete({
    //     source: function (request, response) {
    //         console.log("request.term:" + request);
    //         $.ajax({
    //             url: projectName + "/getTermList",
    //             //method : "get",
    //             dataType: "json",
    //             data: {term_name: request.term},
    //             success: function (data) {
    //                 var data1 = eval(data);
    //                 var list_map = new Array();
    //                 for (var i in data1) {
    //                     list_map.push({
    //                             lable: data1[i].id, value: data1[i].name,
    //                             description: data1[i].description
    //                         }
    //                     );
    //                 }
    //                 response(list_map);
    //             }
    //         });
    //     },
    //
    //     // autoFocus: true,
    //     minLength: 3,
    //     delay: 500,
    //     focus: function (event, ui) {
    //         $("#search1_gene").val(ui.item.value);
    //         return false;
    //     },
    //     select: function (event, ui) {
    //         //alert(ui.item.value);
    //         $("#search1_gene").val(ui.item.value);
    //         term_id1 = ui.item.lable;
    //
    //         return false;
    //     }
    // });


    console.log("term_names:" + term_names);
    // var i = 0;
    // for (i = 0;i<term_names.length;i++){
    //     $("#"+term_names[i]).autocomplete({
    //         source: function (request, response) {
    //             console.log("request.term:"+request);
    //             $.ajax({
    //                 url: projectName + "/getTermList",
    //                 //method : "get",
    //                 dataType: "json",
    //                 data: {term_name: request.term},
    //                 success: function (data) {
    //                     var data1 = eval(data);
    //                     var list_map = new Array();
    //                     for (var i in data1) {
    //                         list_map.push({
    //                                 lable: data1[i].id, value: data1[i].name,
    //                                 description: data1[i].description
    //                             }
    //                         );
    //                     }
    //                     response(list_map);
    //                 }
    //             });
    //         },
    //
    //         //autoFocus : true,
    //         minLength: 3,
    //         delay: 500,
    //         focus: function (event, ui) {
    //             $(term_names[i]).val(ui.item.value);
    //             return false;
    //         },
    //         select: function (event, ui) {
    //             //alert(ui.item.value);
    //             $(term_names[i]).val(ui.item.value);
    //             term_id1 = ui.item.lable;
    //
    //             return false;
    //         }
    //     });
    //
    // }
    //
    //
    // $("#search2_gene").autocomplete({
    //
    //     source: function (request, response) {
    //         $.ajax({
    //             url: projectName + "/getTermList",
    //             //method : "get",
    //             dataType: "json",
    //             data: {term_name: request.term},
    //             success: function (data) {
    //
    //                 var data1 = eval(data);
    //                 var list_map = new Array();
    //                 for (var i in data1) {
    //                     list_map.push({
    //                             lable: data1[i].id, value: data1[i].name,
    //                             description: data1[i].description
    //                         }
    //                     );
    //                 }
    //                 response(list_map);
    //             }
    //         });
    //     },
    //     //autoFocus : true,
    //     minLength: 3,
    //     delay: 500,
    //     focus: function (event, ui) {
    //
    //         //alert(ui.item.value);
    //         $("#search2_gene").val(ui.item.value);
    //         return false;
    //     },
    //     select: function (event, ui) {
    //         //alert(ui.item.value);
    //         $("#search2_gene").val(ui.item.value);
    //         term_id2 = ui.item.lable;
    //
    //         return false;
    //     }
    // });

    $("#search2_gene").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: projectName + "/getTermList",
                //method : "get",
                dataType: "json",
                data: {term_name: request.term},
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

        //showModal();
        console.log("开始了…………333");
        var i = 0;
        var div_items = $("#term_div_parent").children().each(function () {
            // console.log($(this).children().attr("id"));
            term_names[i++] = $($(this).children("input").get(0)).val()
            console.log(term_names);
        });
        for (i = 0; i < term_names.length; i++) {
            if (term_names[i] == '') {
                alert("不能包含空Terms！");
                // return;
            }
        }


        for (var i = 0; i < term_names.length; i++) {
                $.ajax({
                    url: projectName + "/getTerm",
                    method: "get",
                    async: false,
                    traditional: true,
                    dataType: "text",
                    data: {term_name: term_names[i]},
                    success: function (datas) {
                        term_ids[i] = datas;
                    }
                });
        }
        console.log(JSON.stringify("term_ids:" + term_ids));

        // nodesid2[0] = term_id1;
        // nodesid2[1] = term_id2;
        nodesid2 = term_ids;

        //alert(nodesid2[0] + ", " + nodesid2[1]);
        ////////////////////////////////////////////////////////////////////////////
        if (!(nodesid2.length == 0)) {
            $.ajax({
                url: projectName + "/getAnnotationLimit",
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


        //hideModal();
        ////////////////////////////////////////////////////////////////////////////

    });


    var div_id = "cytoscape";
    //initilization options
    var options = {
        swfPath: "./js/cytoscapeweb/CytoscapeWeb",
        flashInstallerPath: "./js/cytoscapeweb/playerProductInstall",
    };
    var vis = new org.cytoscapeweb.Visualization(div_id, options);
    //draw options
    var nodecolormapper = {
        attrName: "nodecolor",
        entries: [
            {attrValue: "gene", value: "#D74E7C"},
            {attrValue: "gene_pre", value: "#9B9B9B"},
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
        vis.layout(layoutname[(idlayoutname)]);

    };


});