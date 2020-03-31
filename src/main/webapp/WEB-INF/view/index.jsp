<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body  style="background:#F8F8F8;">

<jsp:include page="/WEB-INF/view/header.jsp" />

<div id="container" style="margin-top:60px; width: 80%; margin-left:10%; margin-right:10%;">
    <div id="contentMain">
        <br>
        <div class="row">

            <div class="col-md-7" >
                <div class="panel panel-default">
                    <div class="panel-heading" style="height:45px;">
                        <p style="font-size:18px;">
                            <span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
                            <b>&nbsp;&nbsp;About Ontogene v2.0</b></p>
                    </div>
                    <div class="panel-body">
                        <b>
                            <p style="line-height: 24px; font-size: 18px; text-align: justify;">
                                Ontogene v2.0: a resource for annotating human genes at transcriptional level with ontologies
                            </p></b>
                        <p style="line-height: 20px; text-align: justify;">
                            In recent years, diverse products of genes in transcriptional level were well
                            investigated, such as protein-coding gene (PCG), miRNA, lncRNA, circRNA, and
                            so on. Their roles that vary from molecule to phenotype in human body attracted much attention these
                            years. <b>Now the annotation of genes’ roles using normalized terminologies is urgent for quantitative
                            analyses.</b> To this end, multiple manually curated databases were established about the annotation of an
                            individual type of roles for an individual type of gene, such as miRNA-disease annotation (HMDD),
                            lncRNA-disease annotation (LncRNADisease), circRNA-disease annotation (CircRNA2Disease), GOA, and so on.
                            Although GeneRIF documented multiple roles of genes in the ‘functional description’ section, these
                            roles were not normalized to ontologies. In summary, <b>there is no online repository for annotating
                            biological roles of genes comprehensively using ontogoies except for Ontogene.</b>



                        </p>

                        <b>Current functions:</b>
                        <ul style="list-style-type: circle;">

                            <li style="margin-left: 25px; list-style-type: circle;"><a href="./Search.jsp"> Asearch</a>: for querying functional annotations of genes by inputting functional terms or genes (miRNAs, lncRNAs, and so on.).</li>
                            <li style="margin-left: 25px; list-style-type: circle;"><a href="./genelink.jsp"> Glink</a>: for querying gene-term-term-gene path based on gene functional annotation resource and term associations of PubMed.</li>
                            <li style="margin-left: 25px; list-style-type: circle;"><a href="./termlink.jsp"> Tlink</a>: for querying term-gene-gene-term path based on gene functional annotation resource and gene interaction.</li>
                            <li style="margin-left: 25px; list-style-type: circle;"><a href="./Service.jsp"> Web service</a>: for querying the prioritization scores of disease-miRNA associations.</li>
                            <li style="margin-left: 25px; list-style-type: circle;"><a href="./submit.jsp"> Submit</a>: for submitting novel functional associations of human genes.</li>
                        </ul>

                        <b>Potential applications:</b>
                        <ul style="list-style-type: circle;">
                            <li style="margin-left: 25px; list-style-type: circle;">Establishing functional association network of genes and their roles.</li>
                            <li style="margin-left: 25px; list-style-type: circle;">Calculating relative score between roles of genes.
                            </li>
                            <li style="margin-left: 25px; list-style-type: circle;">Calculating relative score between genes.
                            </li>

                            <li style="margin-left: 25px; list-style-type: circle;">Predicting novel roles of genes before experimental validation.</li>

                        </ul>

                        <a href="<%=request.getContextPath()%>/images/first.png" target="_blank"><img src="<%=request.getContextPath()%>/images/first.png" width="100%"/></a>
                    </div>
                </div>
            </div>

            <div class="col-md-5">
                <div class="panel panel-default">
                    <div class="panel-heading"  style="height:45px;">

                        <p style="font-size:18px;">

                            <!-- <span class="glyphicon glyphicon-folder-open" aria-hidden="true"></span> -->

                            <i class="fa fa-bar-chart" aria-hidden="true"></i>
                            <b>&nbsp;&nbsp;Statistics</b>
                        </p>
                    </div>
                    <div class="panel-body"  >





                        <table class="dataintable" style="line-height:15px; width: 80%; margin-left: 10%;  margin-top: 10px; margin-bottom: 10px; align: left;">
                            <tbody style="border: 0.1em; border-color: #E0E0E0;	border-style: solid;">

                            <tr>
                                <td style="font-size: 14px;" colspan="2">Entries</td>
                                <td style="font-size: 14px;">1,548,917</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;" rowspan="6">Genes</td>
                                <!-- <td style="font-size: 14px;">21,868</td> -->
                                <td style="font-size: 14px;" >protein-coding gene</td>
                                <td style="font-size: 14px;">18,699</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;" >ncRNA (miRNA, lncRNA)</td>
                                <td style="font-size: 14px;">1,660</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;" >pseudogene</td>
                                <td style="font-size: 14px;">452</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;" >snoRNA</td>
                                <td style="font-size: 14px;">435</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;" >others</td>
                                <td style="font-size: 14px;">589</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;" >total</td>
                                <td style="font-size: 14px;">21,835</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px; background:#D6D6D6;" rowspan="7" >Terms</td>
                                <td style="font-size: 14px;">biological process</td>
                                <td style="font-size: 14px;">12,853</td>
                            </tr>

                            <tr>
                                <td style="font-size: 14px;">molecular function</td>
                                <td style="font-size: 14px;">4,321</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;">cell component</td>
                                <td style="font-size: 14px;">1,900</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;">disease</td>
                                <td style="font-size: 14px;">4,907</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;">phenotype</td>
                                <td style="font-size: 14px;">7,778</td>
                            </tr>
                            <tr>
                                <td style="font-size: 14px;" >total</td>
                                <td style="font-size: 14px;">31,759</td>
                            </tr>
                            </tbody>
                        </table>

                        <div style="width: 80%; margin-left: 10%;">
                            <a href="https://www.revolvermaps.com/?target=enlarge&amp;i=0wor1qgm4jt"><img src="//ra.revolvermaps.com/h/m/a/0/ff0000/128/0/0wor1qgm4jt.png" width="100%" alt="Map" style="border:0;"></a>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default" style="">
                    <div class="panel-heading" style=" background: #E0E0E0; height:45px;">


                        <p style="font-size:18px;">
                            <i class="fa fa-sitemap" aria-hidden="true"></i>

                            <b>&nbsp;&nbsp;Release & Version</b>
                        </p>
                    </div>
                    <div class="panel-body" style="line-height:25px; text-align: justify;">

                        June 20, 2019, the Ontogene v2.0 was released.
                    </div>
                </div>




                <div class="panel panel-default" style="">
                    <div class="panel-heading" style=" background: #E0E0E0; font-size:20px; height:45px;">

                        <p style="font-size:18px;">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <b>&nbsp;&nbsp;Contact</b>
                        </p>
                    </div>
                    <div class="panel-body" style="line-height:25px; text-align: justify;">

                        Liang Cheng, Ph. D. <br>
                        Associated Professor <br>
                        School of Life Science and Technology <br>
                        Harbin Medical University, Harbin 150081, China <br>
                        Mail: <a href="mailto: liangcheng@hrbmu.edu.cn">liangcheng@hrbmu.edu.cn</a>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<p>&nbsp;</p>

<jsp:include page="/WEB-INF/view/footer.jsp" />

<div style="clear: both;">&nbsp;</div>
</body>
</html>