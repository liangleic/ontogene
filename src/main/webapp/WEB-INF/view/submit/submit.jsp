<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Ontogene v2.0 - Submit</title>
    <%
        String flag = (String) request.getAttribute("flag");
        if (flag != null) {
            if (!flag.equals("0")) {
    %>

    <script type="text/javascript">

        alert("Many thanks for your submission. We will check it soon.");
    </script>

    <%
    } else {
    %>
    <script type="text/javascript">

        alert("Your submission failed, please fill in again!");
    </script>
    <%
            }


        }
        //防止域中的数据一直存在，访问一次后再次访问的时候还会出现弹出框
        session.removeAttribute("flag");

    %>

    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
        }

        .iw_poi_title {
            color: #CC5522;
            font-size: 14px;
            font-weight: bold;
            overflow: hidden;
            padding-right: 13px;
            white-space: nowrap
        }

        .iw_poi_content {
            font: 12px arial, sans-serif;
            overflow: visible;
            padding-top: 4px;
            white-space: -moz-pre-wrap;
            word-wrap: break-word
        }
    </style>

</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp"/>
<div id="container" style="margin-top:60px; width: 80%; margin-left:10%; margin-right:10%;">
    <div id="contentMain">
        <br>
        <div class="row">

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="height:45px;">
                        <p style="font-size:18px;">
                            <span class="glyphicon glyphicon-check" aria-hidden="true"></span>
                            <b>&nbsp;&nbsp;Submit Novel Functions of Genes</b></p>
                    </div>
                    <div class="panel-body">

                        <table style="width:80%; margin-left:10%; margin-right:10%;" bgcolor="#FFFFFF">

                            <tr>
                                <td>
                                    <p>Ontogene v2.0 allows users to submit novel functions of genes.
                                        You do not have to be an author on the original study to submit a record.
                                        Once approved by the submission review committee, the submitted records will be
                                        made available to
                                        the public in the coming release.</p>
                                    <br/>
                                </td>
                            </tr>

                            <tr>


                                <td width="100%">


                                    <form role="form" action="<%= request.getContextPath() %>/novelSubmit" method="post"
                                          style="margin-top: 5px;">

                                        <table style="border-collapse: separate; border-spacing: 5px; width:100%;">

                                            <tr>
                                                <td style="text-align: right" width="20%">
                                                </td>

                                                <td width="30%">
                                                </td>

                                                <td width="50%">

                                                    <b> Details </b></td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: right">
                                                    <label for="geneSymbol">Gene symbol <font
                                                            color="red">*</font></label>
                                                </td>

                                                <td>
                                                    <div class="input-group">
                                                        <input name="geneSymbol" type="text" class="form-control"
                                                               required autofocus size="30">
                                                    </div>
                                                </td>

                                                <td rowspan="6">
                                                    <div class="input-group">
                                                        <textarea name="detail" style="height: 300px; width: 400px"
                                                                  class="form-control"></textarea>
                                                    </div>
                                                </td>
                                            </tr>


                                            <tr>
                                                <td style="text-align: right">
                                                    <label for="geneID">Gene ID <font color="red">*</font></label>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <input name="geneID" type="text" required size="30"
                                                               class="form-control">
                                                    </div>
                                                </td>
                                            </tr>


                                            <tr>
                                                <td style="text-align: right">
                                                    <label for="termName">Term name <font color="red">*</font></label>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <input name="termName" type="text" required size="30"
                                                               class="form-control">
                                                    </div>
                                                </td>
                                            </tr>


                                            <tr>
                                                <td style="text-align: right">
                                                    <label for="termID">Term ID <font color="red">*</font></label>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <input name="termID" type="text" required size="30"
                                                               class="form-control">
                                                    </div>
                                                </td>

                                            </tr>


                                            <tr>
                                                <td style="text-align: right">
                                                    <label for="PMID">PMID &nbsp;&nbsp;<font color="red"></font></label>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <input name="PMID" type="text" size="30" class="form-control">
                                                    </div>
                                                </td>

                                            </tr>


                                            <tr>
                                                <td style="text-align: right">
                                                    <label for="email">Email Address <font color="red">*</font></label>
                                                </td>
                                                <td>
                                                    <div class="input-group">
                                                        <input name="email" type="email" required size="30"
                                                               class="form-control">
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="input-group">
											<span class="input-group-btn">
												<button class="btn btn-primary" type="submit"
                                                        style="background: rgb(50,122,182)">Submit</button>
												<button type="reset" class="btn btn-default" style="margin-left:20px;">Reset</button>
										
											</span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </form>


                                </td>
                            </tr>


                        </table>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/view/footer.jsp"/>
<div style="clear: both;">&nbsp;</div>

</body>
</html>