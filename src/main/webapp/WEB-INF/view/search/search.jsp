<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="net.sf.json.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <jsp:include page="/WEB-INF/view/header.jsp"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ontogene v2.0 - Asearch</title>
    <script type="text/javascript" src="./js/search/js/search.js"></script>
    <style>
        .ui-autocomplete {
            max-height: 200px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
        }

        /* IE 6 doesn't support max-height
         * we use height instead, but this forces the menu to always be this tall
         */
        * html .ui-autocomplete {
            height: 200px;
        }

    </style>



</head>

<body style="background:#F8F8F8;">


<div id="pageMain" style="margin-top:60px; width: 80%; margin-left:10%; margin-right:10%;">
    <div class="col-lg-6">
        <div class="input-group">

            <input type="text" id="search1" class="form-control" placeholder="search terms of ontology ...">
            <span class="input-group-btn">
				<button class="btn btn-default" id="btn3" onclick="example1click()">Example</button>
			</span>
            <span class="input-group-btn">
				<button class="btn btn-primary" id="btn1" type="button">GO!</button>
			</span>
        </div>
        <div style="margin-top:10px;">
            <img src="images/search1.jpg" class="ssss" style="margin-bottom: 10px; width:100%;">
        </div>
    </div>
    <div class="col-lg-6">
        <div class="input-group">
            <input type="text" id="search2" class="form-control" placeholder="search genes ...">
            <span class="input-group-btn">
				<button class="btn btn-default" id="btn4" onclick="example2click()">Example</button>
			</span>
            <span class="input-group-btn">
				<button class="btn btn-primary" id="btn2" type="button">GO!</button>
			</span>
        </div>
        <div style="margin-top:10px;">
            <img src="images/search2.jpg" class="ssss" style="margin-bottom: 10px; width:100%;">
        </div>


    </div>
</div>


<div id="page" style="width: 80%; margin-left:10%; margin-right:10%;">
    <table width="100%">

        <tr>
            <td>

                <div class="container-fluid" id="tree" style="margin-top:10px; ">
                    <div class="row-fluid">
                        <div class="col-xs-3" id="left" style="height:600px;">   <!-- tree_path -->
                            <ul class="ztree" id="treedisplay"></ul>
                        </div>
                        <div class="col-xs-9" id="right" style="height:600px;">
                            <div class="f" id="tabs-293283">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#panel-796807" data-toggle="tab" id="no1">Table View</a>
                                    </li>
                                    <!-- <li>
                                        <a href="#panel-361352" data-toggle="tab" id="no2">Network View</a>
                                    </li> -->
                                    <li>
                                        <a href="#panel-361353" data-toggle="tab" id="no3">Term View</a>
                                    </li>
                                    <li>
                                        <a href="#panel-361354" data-toggle="tab" id="no4">Gene View</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="panel-796807">
                                        <div>
                                            <table class="display" id="example" width="100%">
                                            </table>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="panel-361352">
                                        <div class="tools">


                                        </div>

                                    </div>
                                    <div class="tab-pane" id="panel-361353">
                                        <div id="accordion">
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="panel-361354">
                                        <div id="accordiongene">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </td>
        </tr>

        <tr>
            <td>
                <div class="container-fluid" id="tree2" style="margin-top:10px;">
                    <div class="row-fluid">
                        <div class="col-xs-3" id="left2" style="height:600px;">   <!-- tree_path -->
                            <ul class="ztree" id="treedisplay2"></ul>
                        </div>
                        <div class="col-xs-9" id="right2" style="height:600px;">
                            <div class="tabbable" id="tabs-293283">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#panel-7968071" data-toggle="tab" id="no12">Table View</a>
                                    </li>
                                    <li>
                                        <a href="#panel-3613531" data-toggle="tab" id="no32">Term View</a>
                                    </li>
                                    <li>
                                        <a href="#panel-361357" data-toggle="tab" id="no42">Gene View</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="panel-7968071">
                                        <div>
                                            <table class="display" id="example2" width="100%">
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="panel-3613531">
                                        <div id="accordion2">

                                        </div>
                                    </div>

                                    <div class="tab-pane" id="panel-361357">
                                        <div id="accordiongene2"></div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </td>
        </tr>
    </table>
</div>

<div style="clear: both;">&nbsp;</div>

<div id="rMenu">
    <ul>
        <li id="madd" onclick="rclik();" style="color: red; font-size: 12px;">Select the nodes</li>
    </ul>
</div>
<div id="rMenu2">
    <ul>
        <li id="madd2" onclick="rclik();" style="color: red; font-size: 10px;">Select the nodes</li>
    </ul>
</div>

<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>