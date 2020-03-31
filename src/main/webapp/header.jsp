<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="post.jsp"%>
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

                    <li class="mainlevel" id="navli1"> <a href="Home.jsp">Home</a></li>
                    <li class="mainlevel" id="navli2"><a href="Search.jsp">Asearch</a></li>
                    <li class="mainlevel" id="navli3"><a href="genelink.jsp">Glink</a></li>
                    <li class="mainlevel" id="navli4"><a href="termlink.jsp">Tlink</a></li>
                    <li class="mainlevel" id="navli5"><a href="Service.jsp">Service</a></li>
                    <li class="mainlevel" id="navli6"><a href="Download.jsp">Resource</a></li>
                    <li class="mainlevel" id="navli7"><a href="submit.jsp">Submit</a></li>
                    <li class="mainlevel" id="navli8"> <a href="<%= request.getContextPath() %>/tutorial">Tutorial</a></li><!--
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