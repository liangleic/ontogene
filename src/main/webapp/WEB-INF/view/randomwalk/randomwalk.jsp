<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
				<button class="btn btn-primary" id="btn1" type="button">GO!</button>
			</span>
        </div>
        <div style="margin-top:10px;background-color: #00b3ee;width: 445px;height: 390px;" id="div_result">
            <img src="images/search1.jpg" class="ssss" style="margin-bottom: 10px; width:100%;">
        </div>
    </div>
    <div class="col-lg-6">
        <table style="border:4px solid #CCCCCC; margin-top:15px;height: 40px;" id="layrow" width="100%">
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
                <td colspan="3" height="220px">

                    <div id="cytoscape" style="width:100%; height: 90%; ">
                    </div>
                </td>
            </tr>

        </table>


    </div>
</div>



<div style="clear: both;">&nbsp;</div>



<jsp:include page="/WEB-INF/view/footer.jsp"/>
</body>
</html>