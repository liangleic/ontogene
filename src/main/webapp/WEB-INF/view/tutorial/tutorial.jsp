<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="/WEB-INF/view/header.jsp" />
<body style="background:#F8F8F8;">
<div id="container" style="margin-top:60px; width: 80%; margin-left:10%; margin-right:10%;">

    <div id="contentMain">

        <br>
        <div class="row">

            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading" style="height:45px;">
                        <p class="flaticon-information9 color-primary-bold">
                            <span class="glyphicon glyphicon-tags" aria-hidden="true"></span>
                            <b>&nbsp;&nbsp;Overview</b></p>
                    </div>
                    <div class="panel-body" style="margin-left:5%; margin-right:5%; width:90%;">

                        <p style="line-height: 200%; text-align: justify;">

                            Here, we provided the tutorial of Ontogene v2.0. It includes the following aspects. <br>

                            1. <a href="#1">Tutorial for search page</a> <br>
                            2. <a href="#2">Tutorial for annotation table</a> <br>
                            3. <a href="#3">Tutorial for gene-term-term-gene path visualization</a> <br>
                            4. <a href="#4">Tutorial for term-gene-gene-term path visualization</a> <br>
                            5. <a href="#5">Introduction for our sister projects</a> <br>
                            6. <a href="#6">Question and answer</a> <br>
                        </p>


                        <div id="1" style="position: relative;top: -60px;"></div>
                        <h4 class="flaticon-information9 color-primary-bold">1. Tutorial for search page</h4>
                        <p style="line-height: 200%; text-align: justify;">

                            The <a href="./Search.jsp">search page</a> allows users to input a term of ontology or a
                            gene
                            for querying annotations of genes as following.

                        </p>

                        <div align="center">
                            <img src="./images/tutorial/search.jpg" width="70%"/>
                        </div>


                        <div id="2" style="position: relative;top: -60px;"></div>
                        <h4 class="flaticon-information9 color-primary-bold">2. Tutorial for annotation table</h4>
                        <p style="line-height: 200%; text-align: justify;">

                            After searching a term of ontology, the tree structure of this term is shown in the left,
                            and
                            its genes are shown in the right in a 'Table View'. Each line in the table contains an
                            association between a gene and a term, which involves
                            term ID, term name, gene symbol, gene ID, the type of gene, and sources.
                            The details of the description could be shown by clicking
                            the data source link.

                            In addition, 'Term View' and 'Gene View' show the details of the terms and genes in the
                            'Table View'.
                        </p>


                        <div align="center">
                            <img src="./images/tutorial/table.jpg" width="90%"/>
                        </div>


                        <div id="3" style="position: relative;top: -60px;"></div>
                        <h4 class="flaticon-information9 color-primary-bold">3. Tutorial for gene-term-term-gene path
                            visualization</h4>
                        <p style="line-height: 200%; text-align: justify;">
                            Two genes can be linked by their common functions, or by the associations between their
                            terms in Ontogene v2.0 as following.
                        </p>


                        <div align="center">
                            <img src="./images/tutorial/glink.jpg" width="70%"/>
                        </div>


                        <div id="4" style="position: relative;top: -60px;"></div>
                        <h4 class="flaticon-information9 color-primary-bold">4. Tutorial for term-gene-gene-term path
                            visualization</h4>
                        <p style="line-height: 200%; text-align: justify;">
                            Two terms can be linked by their common genes, or by the interactions between their genes in
                            Ontogene v2.0 as following.

                        </p>


                        <div align="center">
                            <img src="./images/tutorial/tlink.jpg" width="70%"/>
                        </div>


                        <div id="5" style="position: relative;top: -60px;"></div>
                        <h4 class="flaticon-information9 color-primary-bold">5. Introduction for our sister
                            projects</h4>
                        <p style="line-height: 200%; text-align: justify;">

                            All of our previous researches focused on the human disease system biology, such as
                            exploring the casual,
                            biomarker of human disease in molecular and phenotype level. Three sister projects have been
                            conducted
                            by us.
                        </p>

                        <ul style="line-height: 200%; text-align: justify;">
                            <li><a href="http://bio-annotation.cn/MetSigDis/">MetSigDis</a>, a manually curated
                                resource, aims to provide a comprehensive resource of metabolite alterations in various
                                diseases.
                            </li>
                            <li><a href="http://bio-annotation.cn:18080/DincRNAClient/">DincRNA</a>, a comprehensive
                                bioinformatics resource for disease similarity calculation and non-coding RNA functional
                                analysis.
                            </li>
                            <li><a href="http://bio-annotation.cn/lncrna2target/">LncRNA2Target v2.0</a>,
                                a manually curated resource of lncRNA-target relationships inferred from low-throughput
                                experiments or lncRNA knockdown or overexpression experiments followed by
                                microarray/RNA-seq.
                            </li>
                            <!-- <li><a href="http://bio-annotation.cn:8080/MRBase/">MRBase</a>, an manually curated database, aims to provide causal effect of phenotypes and diseases based on Mendelian Randomization.</li>
                         --></ul>


                        <div id="6" style="position: relative;top: -60px;"></div>
                        <h4 class="flaticon-information9 color-primary-bold">6. Question and answer</h4>
                        <p style="line-height: 200%; text-align: justify;">

                            6.1 How to download the database? <br>
                            Here, we provide the <a href="./Download.jsp#download">page to download</a> all the data
                            from the web.
                            We also provide <a href="./Service.jsp">web services</a> for users to access our data.

                        </p>
                        <p style="line-height: 200%; text-align: justify;">

                            6.2 How to show users' feedback? <br>

                        </p>

                        <ul style="line-height: 200%; text-align: justify;">

                            <li>If the novel functions of genes, please <a href="./submit.jsp">submit</a> it to our
                                system.

                            </li>
                            <li>If you have any other question, please do not hesitate to contact Liang Cheng by email:
                                <a href="mailto:liangcheng@hrbmu.edu.cn">liangcheng@hrbmu.edu.cn</a></li>
                        </ul>

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