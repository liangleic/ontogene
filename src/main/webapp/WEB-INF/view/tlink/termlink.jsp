<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ontogene v2.0 - Tlink</title>
    <script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>

    <script type="text/javascript" src="./js/tlink/tlink.js"></script>

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

    <style type="text/css">
        div#rMenu {
            position: absolute;
            visibility: hidden;
            top: 0;
            text-align: left;
            padding: 1px;
        }

        div#rMenu ul li {
            margin: 1px 0;
            padding: 0 3px;
            cursor: pointer;
            list-style: none outside none;
            background-color: #DFDFDF;
        }

        div#rMenu2 {
            position: absolute;
            visibility: hidden;
            top: 0;
            text-align: left;
            padding: 1px;
        }

        div#rMenu2 ul li {
            margin: 1px 0;
            padding: 0 3px;
            cursor: pointer;
            list-style: none outside none;
            background-color: #DFDFDF;
        }
    </style>


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

<jsp:include page="/WEB-INF/view/header.jsp"/>

<div id="pageMain" style="width: 100%; margin-top: 60px; ">
    <div class="col-lg-12" style="width: 80%; margin-left:10%; margin-right:10%;">
        <!--
        <table width="100%">
            <tr>
                <td width="46%">
                    <div class="input-group" style="width:100%;">
                        <input style="width:100%;" type="text" id="search1_gene" name="search1_gene"
                               class="form-control" placeholder="search terms of ontology ..." style="width: 500px;"
                               required>
                    </div>
                </td>
                <td width="4%">
                    <p align="center">&nbsp;&nbsp;AND&nbsp;&nbsp;</p>
                </td>

                <td width="50%">

                    <div class="input-group" style="width:100%;">
                        <input style="width:100%;" type="text" id="search2_gene" class="form-control"
                               placeholder="search terms of ontology ..." style="width: 500px;" required>
                        <span class="input-group-btn">
				<button class="btn btn-default" id="btn4" onclick="example1click()">Example</button>
			</span>
                        <span class="input-group-btn">
				<button class="btn btn-primary" id="btn_gene" type="button">GO!</button>
			</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <img src="./images/tlink.jpg" class="ssss" width="100%" style="margin-top: 10px">
                </td>
            </tr>
        </table>
        -->

        <div id="term_div_parent">
            <div id="term_div" class="input-group" style="width:100%;margin: 5px 0px;">
                <input style="width:500px;" type="text" id="search1_gene" name="search1_gene"
                       class="form-control" placeholder="search terms of ontology ..." style="width: 500px;"
                       required>
                <span style="width: 25%;" align="center">&nbsp;&nbsp;AND&nbsp;&nbsp;</span>

                <img id="add_term" onclick="add_term()" src="./images/add_term.jpg" alt=""/>
                <img id="sub_term" onclick="sub_term(this)" src="./images/sub_term.jpg" alt=""/>

            </div>

            <div  class="input-group" style="width:100%;">
                <input style="width:500px;margin: 5px 0px" type="text" id="search2_gene" class="form-control"
                       placeholder="search terms of ontology ..." style="width: 500px;" required>
                <span class="input-group-btn">
				    <button class="btn btn-default" id="btn4" onclick="example1click()">Example</button>
			    </span>
                <span class="input-group-btn">
				    <button class="btn btn-primary" id="btn_gene" type="button">GO!</button>
			    </span>
            </div>

        </div>
        <img src="./images/tlink.jpg" class="ssss" width="100%" style="margin-top: 10px">

        <!-- <div class="modal fade" id="myModal">
          <div class="modal-dialog modal-sm">
              <img alt="" src="data:image/gif;base64,R0lGODlhGQAZAJECAK7PTQBjpv///wAAACH/C05FVFNDQVBFMi4wAwEAAAAh/wtYTVAgRGF0YVhNUDw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNS1jMDE0IDc5LjE1MTQ4MSwgMjAxMy8wMy8xMy0xMjowOToxNSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo5OTYyNTQ4Ni02ZGVkLTI2NDUtODEwMy1kN2M4ODE4OWMxMTQiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RUNGNUFGRUFGREFCMTFFM0FCNzVDRjQ1QzI4QjFBNjgiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RUNGNUFGRTlGREFCMTFFM0FCNzVDRjQ1QzI4QjFBNjgiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIChXaW5kb3dzKSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjk5NjI1NDg2LTZkZWQtMjY0NS04MTAzLWQ3Yzg4MTg5YzExNCIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo5OTYyNTQ4Ni02ZGVkLTI2NDUtODEwMy1kN2M4ODE4OWMxMTQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz4B//79/Pv6+fj39vX08/Lx8O/u7ezr6uno5+bl5OPi4eDf3t3c29rZ2NfW1dTT0tHQz87NzMvKycjHxsXEw8LBwL++vby7urm4t7a1tLOysbCvrq2sq6qpqKempaSjoqGgn56dnJuamZiXlpWUk5KRkI+OjYyLiomIh4aFhIOCgYB/fn18e3p5eHd2dXRzcnFwb25tbGtqaWhnZmVkY2JhYF9eXVxbWllYV1ZVVFNSUVBPTk1MS0pJSEdGRURDQkFAPz49PDs6OTg3NjU0MzIxMC8uLSwrKikoJyYlJCMiISAfHh0cGxoZGBcWFRQTEhEQDw4NDAsKCQgHBgUEAwIBAAAh+QQFCgACACwAAAAAGQAZAAACTpSPqcu9AKMUodqLpAb0+rxFnWeBIUdixwmNqRm6JLzJ38raqsGiaUXT6EqO4uIHRAYQyiHw0GxCkc7l9FdlUqWGKPX64mbFXqzxjDYWAAAh+QQFCgACACwCAAIAFQAKAAACHYyPAsuNH1SbME1ajbwra854Edh5GyeeV0oCLFkAACH5BAUKAAIALA0AAgAKABUAAAIUjI+py+0PYxO0WoCz3rz7D4bi+BUAIfkEBQoAAgAsAgANABUACgAAAh2EjxLLjQ9UmzBNWo28K2vOeBHYeRsnnldKBixZAAA7" />
          </div>
        </div> -->


        <table style="border:4px solid #CCCCCC; margin-top:15px;" id="layrow" width="100%">
            <tr border="0">
                <td colspan="3"><br>
                    <div class="tools">
                        <label>Layout:</label>
                        <select id="layoutSelect" name="layoutSelect" single size="1">
                            <option value="0" selected>ForceDirected</option>
                            <option value="1">Circle</option>
                            <option value="2">Radial</option>
                            <option value="3">Tree</option>
                        </select>

                        <select single size=1 id="download" name="download" style="margin-left:15px; width: 80px;">
                            <option value="0" selected> xls</option>
                        </select>

                        <button class="btn btn-default" id="btndown" onclick="btndown()">Download</button>

                        <form id="form1" name="form1" method="post" action="Tlink">
                            <input type="hidden" name="term1" id="term1" value=""/>
                            <input type="hidden" name="term2" id="term2" value=""/></form>


                        <div style="float: right; width:50%; text-align: justify; margin-right:10px;">
                            <font color="red">Note</font>: Each red node is a term of ontology, and each black node
                            is a gene. A link between a gene and a term represents an association between
                            them. A link between two genes represents an interaction between the genes.
                        </div>

                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="3" height="600px">

                    <div id="cytoscape" style="width:100%; height: 90%; ">
                    </div>
                </td>
            </tr>

        </table>


    </div>

    <p>&nbsp;</p>
    <jsp:include page="/WEB-INF/view/footer.jsp"/>

    <div style="clear: both;">&nbsp;</div>
</div>
</body>
</html>