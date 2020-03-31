<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Ontogene v2.0 - Resource</title>
</head>

<jsp:include page="/WEB-INF/view/header.jsp" />
<body style="background:#F8F8F8;">

<div id="container" style="margin-top:60px; width: 80%; margin-left:10%; margin-right:10%;">
    <div id="contentMain">
        <br>
        <div class="row">

            <div class="col-md-12">


                <div class="panel panel-default">
                    <div class="panel-heading" style="height:45px;">
                        <p style="font-size:18px;">
                            <span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>
                            <b>&nbsp;&nbsp;Downloads</b></p>
                    </div>
                    <div class="panel-body">
                        <table class="dataintable" style="width:80%; margin-left:10%; margin-right:10%;" align="center">
                            <tr style="background:#D6D6D6">
                                <th width="40%">Description</th>
                                <th>URL for download</th>
                            </tr>
                            <tr>
                                <td>Functional annotation for genes</td>
                                <td><a href="http://bio-annotation.cn/Ontogene/downloads/annotation.rar">
                                    http://bio-annotation.cn/Ontogene/downloads/annotation.rar</a></td>
                            </tr>
                            <tr style="background:#D6D6D6">
                                <td>Term associations based on PubMed</td>
                                <td><a href="http://bio-annotation.cn/Ontogene/downloads/pubmed.rar">
                                    http://bio-annotation.cn/Ontogene/downloads/pubmed.rar</a></td>
                            </tr>
                        </table>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading" style="height:45px;">
                        <p style="font-size:18px;">
                            <span class="glyphicon glyphicon-link" aria-hidden="true"></span>
                            <b>&nbsp;&nbsp;Integrated Resources</b></p>

                    </div>
                    <div class="panel-body">
                        <table class="dataintable"
                               style="width:80%; margin-left:10%; margin-right:10%;" align="center">
                            <tr style="background:#D6D6D6">
                                <td width="20%">Type</td>
                                <td width="25%">Database Name [Reference]</td>
                                <td>URL for download</td>
                            </tr>
                            <tr>
                                <td rowspan=3 style="vertical-align: middle;">Ontology</td>
                                <td>GO [1]</td>
                                <td><a href="http://geneontology.org/page/download-ontology">
                                    http://geneontology.org/page/download-ontology</a></td>
                            </tr>
                            <tr style="background:#D6D6D6">
                                <td>DO [2]</td>
                                <td><a href="http://disease-ontology.org/downloads/">
                                    http://disease-ontology.org/downloads/</a></td>
                            </tr>
                            <tr>
                                <td>HPO [3]</td>
                                <td><a href="http://purl.obolibrary.org/obo/hp.obo">
                                    http://purl.obolibrary.org/obo/hp.obo</a></td>
                            </tr>


                            <tr>
                                <td style="vertical-align: middle;">Gene description</td>
                                <td>Entrez Gene [4]</td>
                                <td><a href="ftp://ftp.ncbi.nih.gov/gene/GeneRIF/Homo_sapiens.gene_info.gz">
                                    ftp://ftp.ncbi.nih.gov/gene/GeneRIF/Homo_sapiens.gene_info.gz</a></td>
                            </tr>

                            <tr>
                                <td style="vertical-align: middle; background:#ffffff;">Gene interaction</td>
                                <td>RNID v2.0 [5]</td>
                                <td><a href="http://www.rna-society.org/raid/download.html">
                                    http://www.rna-society.org/raid/download.html</a></td>
                            </tr>


                            <tr>
                                <td rowspan=9 style="vertical-align: middle;">Functional annotation of genes</td>
                                <td>GOA for ncRNA [6]</td>
                                <td><a href="http://geneontology.org/gene-associations/goa_human_rna.gaf.gz">
                                    http://geneontology.org/gene-associations/goa_human_rna.gaf.gz</a></td>
                            </tr>
                            <tr>
                                <td>GOA for mRNA [7]</td>
                                <td><a href="http://geneontology.org/gene-associations/goa_human.gaf.gz">
                                    http://geneontology.org/gene-associations/goa_human.gaf.gz</a></td>
                            </tr>
                            <tr>
                                <td>HMDD v3.0 [8]</td>
                                <td><a href="http://www.cuilab.cn/hmdd">
                                    http://www.cuilab.cn/hmdd</a></td>
                            </tr>
                            <tr>
                                <td>LncRNADisease [9]</td>
                                <td><a href="http://www.cuilab.cn/lncrnadisease">
                                    http://www.cuilab.cn/lncrnadisease</a></td>
                            </tr>
                            <tr>
                                <td>CircR2Disease [10]</td>
                                <td><a href="http://bioinfo.snnu.edu.cn/CircR2Disease/article/DownLoad.aspx">
                                    http://bioinfo.snnu.edu.cn/CircR2Disease/article/DownLoad.aspx</a></td>
                            </tr>
                            <tr>
                                <td>DiseaseEnhancer [11]</td>
                                <td><a href="http://biocc.hrbmu.edu.cn/DiseaseEnhancer/">
                                    http://biocc.hrbmu.edu.cn/DiseaseEnhancer/</a></td>
                            </tr>
                            <tr style="background:#D6D6D6">
                                <td>OMIM [12]</td>
                                <td><a href="https://omim.org/downloads/">
                                    https://omim.org/downloads/</a></td>
                            </tr>
                            <tr>
                                <td>HPOA [13]</td>
                                <td><a href="http://human-phenotype-ontology.github.io/downloads.html">
                                    http://human-phenotype-ontology.github.io/downloads.html</a></td>
                            </tr>
                            <tr style="background:#D6D6D6">
                                <td>GeneRIF [14]</td>
                                <td><a href="ftp://ftp.ncbi.nlm.nih.gov/gene/GeneRIF/">
                                    ftp://ftp.ncbi.nlm.nih.gov/gene/GeneRIF/</a></td>
                            </tr>

                            <tr>
                                <td style="vertical-align: middle;">Association between terms</td>
                                <td>MEDLINE [15]</td>
                                <td><a href="ftp://ftp.ncbi.nlm.nih.gov/pubmed/baseline/">
                                    ftp://ftp.ncbi.nlm.nih.gov/pubmed/baseline/</a></td>
                            </tr>
                        </table>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading" style="height:45px;">
                        <p style="font-size:18px;">
                            <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
                            <b>&nbsp;&nbsp;Our Sister Projects</b></p>
                    </div>
                    <div class="panel-body">
                        <table class="dataintable" style="width:80%; margin-left:10%; margin-right:10%;" align="center">
                            <tr style="background:#D6D6D6">
                                <th width="40%">Resource Name [Reference]</th>
                                <th>URL for access</th>
                            </tr>
                            <tr>
                                <td>DincRNA [15]</td>
                                <td><a href="http://bio-annotation.cn:18080/DincRNAClient/">
                                    http://bio-annotation.cn:18080/DincRNAClient/</a></td>
                            </tr>
                            <tr style="background:#D6D6D6">
                                <td>MetSigDis [16]</td>
                                <td><a href="http://bio-annotation.cn/MetSigDis/">
                                    http://bio-annotation.cn/MetSigDis/</a></td>
                            </tr>
                            <tr>
                                <td>LncRNA2Target v2.0 [17]</td>
                                <td><a target="_blank" href="http://bio-annotation.cn/lncrna2target/">http://bio-annotation.cn/lncrna2target/</a>
                                </td>
                            </tr>
                            <!--  <tr>
                                 <td>MRBase</td>
                                 <td><a target="_blank" href="http://bio-annotation.cn:8080/MRBase/">http://bio-annotation.cn:8080/MRBase/</a></td>
                             </tr> -->
                        </table>
                    </div>
                </div>


                <div class="panel panel-default">
                    <div class="panel-heading" style="height:45px;">
                        <p style="font-size:18px;">
                            <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                            <b>&nbsp;&nbsp;References</b></p>
                    </div>
                    <div class="panel-body">
                        <table style="width:80%; margin-left:10%; margin-right:10%;" align="center">
                            <tr>
                                <td>
                                    <p style="text-align:justify; line-height: 240%;">
                                        (1) Ashburner, M., et al. (2000) Gene ontology: tool for the unification of
                                        biology. The Gene Ontology Consortium, Nature genetics, 25, 25-29. <br>
                                        (2) Schriml, L.M., et al. (2012) Disease Ontology: a backbone for disease
                                        semantic integration, Nucleic acids research, 40, D940-946. <br>
                                        (3) Robinson, P.N. and Mundlos, S. (2010) The human phenotype ontology, Clinical
                                        genetics, 77, 525-534. <br>
                                        (4) Maglott D , et al. (2011) Entrez gene: Gene-centered information at NCBI,
                                        Nucleic Acids Research, 39(Database issue):D52-57. <br>
                                        (5) Yi, Y. et al. (2016) RAID v2.0: an updated resource of RNA-associated
                                        interactions across organisms[J]. Nucleic Acids Research, 2017, 45,
                                        D115-D118.<br>
                                        (6) TR Consortium. (2016) RNAcentral: a comprehensive database of non-coding RNA
                                        sequences, Nucleic Acids Research 45, D128.<br>
                                        (7) Camon, E., et al. (2004) The gene ontology annotation (goa) database:
                                        sharing knowledge in uniprot with gene ontology, Nucleic acids research, 32,
                                        D262-D266. <br>
                                        (8) Huang, Z., et al. (2019) HMDD v3.0: a database for experimentally supported
                                        human microRNA-disease associations, Nucleic acids research, 47, D1013-1017.
                                        <br>
                                        (9) Chen, G., et al. (2013) LncRNADisease: a database for long-non-coding
                                        RNA-associated diseases, Nucleic acids research, 41, D983-986. <br>
                                        (10) Fan, C., et al. (2018) CircR2Disease: a manually curated database for
                                        experimentally supported circular RNAs associated with various diseases,
                                        Database : the Journal of Biological Databases and Curation. (DOI:
                                        10.1093/database/bay044)<br>
                                        (11) Zhang G, et al. (2018) DiseaseEnhancer: a resource of human
                                        disease-associated enhancer catalog. Nucleic Acids Research, 46(D1):D78-D84.
                                        <br>
                                        (12) Amberger, J. et al. (2009) McKusick's Online Mendelian Inheritance in Man
                                        (OMIM).[J]. Nucleic Acids Research, 37, 793-6.<br>
                                        (13) Kohler, S., et al. (2014) The Human Phenotype Ontology project: linking
                                        molecular biology and disease through phenotype data, Nucleic acids research,
                                        42, D966-974. <br>
                                        (14) Lu, Z., et al. (2006), GeneRIF QUALITY ASSURANCE AS SUMMARY REVISION.
                                        Pacific Symposium on Biocomputing Pacific Symposium on Biocomputing 2007,
                                        269.<br>
                                        (15) Shashikiran, N.D. (2016), MEDLINE, pubmed, and pubmed central (®):
                                        Analogous or dissimilar. Journal of the Indian Society of Pedodontics and
                                        Preventive Dentistry, 34, 197-198. <br>
                                        (16) Fenton, S and Williams, M. (2005) Getting to know PubMed: an overview, J
                                        AHIMA. 76(3), 60A-60D.<br>
                                        (17) Cheng, L., et al. (2018) DincRNA: a comprehensive web-based bioinformatics
                                        toolkit for exploring disease associations and ncRNA function[J].
                                        Bioinformatics, 2018.<br>
                                        (18) Cheng, L., et al. (2017) MetSigDis: a manually curated resource for the
                                        metabolic signatures of diseases[J]. Briefings in Bioinformatics, 2017.<br>

                                    </p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>


        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/view/footer.jsp" />

<div style="clear: both;">&nbsp;</div>
</body>
</html>