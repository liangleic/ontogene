<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body  style="background:#F8F8F8;">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ontogene v2.0</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="./css/main.css">
    <link href="./libs/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
    <link href="./libs/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="./libs/icheck/skins/all.css" rel="stylesheet">

    <link type="text/css" rel="stylesheet" href="./js/jquery-ui.min.css">
    <link type="text/css" rel="stylesheet" href="./js/my.css">
    <link type="text/css" rel="stylesheet" href="./js/zTreeStyle.css">
    <link type="text/css" rel="stylesheet" href="./js/jquery.dataTables.min.css">
    <link type="text/css" rel="stylesheet" href="./js/buttons.dataTables.min.css">

    <script type="text/javascript" src="./js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./js/jquery.ztree.all.js"></script>
    <script type="text/javascript" src="./js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="./js/cytoscapeweb/AC_OETags.min.js"></script>
    <script type="text/javascript" src="./js/cytoscapeweb/cytoscapeweb.min.js"></script>
    <script type="text/javascript" src="./js/cytoscapeweb/json2.min.js"></script>
    <script type="text/javascript" src="./js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="./js/jszip.min.js"></script>
    <script type="text/javascript" src="./js/pdfmake.min.js"></script>
    <script type="text/javascript" src="./js/vfs_fonts.js"></script>
    <script type="text/javascript" src="./js/buttons.html5.min.js"></script>



</head>

<div style="position: fixed; z-index:9999; margin-top:-60px; background-color: #336699; width:100%;">

    <table style="width:100%;">
        <tr>
            <td width="15%" align="center" valign="middle">

                <img alt="" src="<%=request.getContextPath()%>/images/head.jpg" height="60" width="300">

            </td>
            <td width="10%"></td>
            <td width="50%" valign="bottom">
                <ul id="nav">

                    <li class="mainlevel" id="navli1"> <a href="<%= request.getContextPath() %>/">Home</a></li>
                    <li class="mainlevel" id="navli2"><a href="<%= request.getContextPath() %>/search">Asearch</a></li>
                    <li class="mainlevel" id="navli3"><a href="<%= request.getContextPath() %>/genelink">Glink</a></li>
                    <li class="mainlevel" id="navli4"><a href="<%= request.getContextPath() %>/termlink">Tlink</a></li>
                    <li class="mainlevel" id="navli5"><a href="<%= request.getContextPath() %>/service">Service</a></li>
                    <li class="mainlevel" id="navli6"><a href="<%= request.getContextPath() %>/resource">Resource</a></li>
                    <li class="mainlevel" id="navli7"><a href="<%= request.getContextPath() %>/submit">Submit</a></li>
                    <li class="mainlevel" id="navli8"><a href="<%= request.getContextPath() %>/tutorial">Tutorial</a></li><!--
	<li class="mainlevel" id="navli9"><a href="Contact us.jsp">Contact</a>	</li> -->

                </ul>
            </td>

            <td width="10%"></td>
            <td width="15%" align="center" valign="middle">
                <img alt="" src="<%=request.getContextPath()%>/images/logo.png" height="60" width="300" align="right" title="Ontogene v2.0">
            </td></tr>
    </table>

</div>
</body>
</html>