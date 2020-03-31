<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ontogene v2.0 - Glink</title>
    <script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>

    <script type="text/javascript" src="./js/glink/glink.js"></script>

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

    <style type="text/css">
        <!--
        ul, li {
            list-style-type: none;
        }

        .clear {
            clear: both;
            *display: inline; /*IE only*/
        }

        /*menu*/
        #nav {
            margin: 0 auto;
            margin-bottom: 5px;
            height: 30px;
            list-style: none;
            position: relative;
            padding: 0px;
            font-size: 16px;
        }

        #nav .jquery_inner {
            margin-left: 16px;
        }

        #nav .jquery {
            margin-right: 1px;
            padding: 0 2em;
        }

        #nav .mainlevel {
            float: left;
            width: 12%;
            cursor: pointer;
        }

        #nav .mainlevel a {
            color: #FFF;
            text-decoration: none;
            line-height: 30px;
            display: block;
            text-align: center;
            width: 100%;
        }

        #nav .mainlevel a:hover {
            text-decoration: none;
            background: rgb(76, 150, 223);
        }

        #navli3 {
            text-decoration: none;
            background: rgb(76, 150, 223);
        }

        #nav .mainlevel ul {
            display: none;
            position: absolute;
        }

        #nav .mainlevel ul a {
            color: #FFF;
            text-decoration: none;
            line-height: 30px;
            display: block;
            text-align: center;
            width: 100%;
        }

        #nav .mainlevel ul a:hover {
            text-decoration: none;
        }

        #nav .mainlevel li {
            border-top: 1px solid;
            width: 174px; /*IE6 only*/
        }

        .log {
            text-align: center;
            line-height: 24px;
            text-transform: capitalize;
            margin: 50px auto;
        }

        table.tabbable {
            margin-top: 15px;
            border-collapse: collapse;
            border: 1px solid #aaa;
            width: 60%;
            align: left;
            margin: 0 auto;
        }

        table.tabbable th {
            vertical-align: baseline;
            padding: 6px 15px 6px 6px;
            border: 1px solid #E0E0E0;
            text-align: left;
        }

        table.tabbable td {
            vertical-align: text-top;
            padding: 6px 15px 6px 6px;
            border: 1px solid #E0E0E0;
        }

        table.tabbable tr:nth-child(odd) {
            background-color: #E0E0E0;
        }

        table.tabbable tr:nth-child(even) {
            background-color: #fff;
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
        <table width="100%">
            <tr>

                <td width="46%">

                    <div class="input-group" style="width:100%;">

                        <input style="width:100%;" type="text" id="search1_gene" name="search1_gene"
                               class="form-control" placeholder="search genes ..." style="width: 500px;" required>


                    </div>
                </td>
                <td width="4%">
                    <p align="center">&nbsp;&nbsp;AND&nbsp;&nbsp;</p>
                </td>

                <td width="50%">
                    <div class="input-group" style="width:100%;">
                        <input style="width:100%;" type="text" id="search2_gene" class="form-control"
                               placeholder="search genes ..." style="width: 500px;" required>
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
                    <img src="images/glink.jpg" class="ssss" width="100%" style="margin-top: 10px">
                </td>
            </tr>

        </table>

        <table style="margin-top: 15px; border:4px solid #CCCCCC;" id="layrow" width="100%">
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

                        <form id="form1" name="form1" method="post" action="Glink">
                            <input type="hidden" name="gene1" id="gene1" value=""/>
                            <input type="hidden" name="gene2" id="gene2" value=""/></form>

                        <div style="float: right; width:50%; text-align: justify; margin-right:10px;">
                            <font color="red">Note</font>: Each red node is a gene, and each black node
                            is a term of ontology. A link between a gene and a term represents an association between
                            them. A link between two terms represents an association between the terms.
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