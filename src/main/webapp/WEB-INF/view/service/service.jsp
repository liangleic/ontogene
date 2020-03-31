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
                        <p style="font-size:18px;">
                            <span class="glyphicon glyphicon-road" aria-hidden="true"></span>
                            <b>&nbsp;&nbsp;Web services to access the data</b></p>
                    </div>
                    <div class="panel-body">

                        Ontogene v2.0 provides a web service to search all terms, all genes, all term associations based
                        on
                        PubMed,
                        annotations of term, annotations of gene,
                        and associated terms of a specified term based on PubMed.The following is the example to access
                        our web services:


                        <div style="margin-top:20px; width:80%; margin-left:10%;margin-right:10%;">
					
                        <pre style="background-color:#cccccc;">
					
package query;

import javax.ws.rs.core.MediaType;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;


public class TestQuery {

	/**
	 * @param args
	 */
	public static final String BASE_URI = "http://123.59.132.21:8080/Ontogene";
	public static final String PATH_NAME_Query_Gene = "/query/getAllGenes";
	public static final String PATH_NAME_Query_Term = "/query/getAllTerms";
	public static final String PATH_NAME_Query_Term_Annotation = "/query/getTermAnnnotations/";
	public static final String PATH_NAME_Query_Gene_Annotation = "/query/getGeneAnnnotations/";
	public static final String PATH_NAME_Query_Associations = "/query/getAllAssociations/";
	public static final String PATH_NAME_Query_Term_Associations = "/query/getTermAssociations/";
	
	 
	public static void main(String[] args) {
	  
		ClientConfig config = new DefaultClientConfig();
		Client client = Client.create(config);
		WebResource resource = client.resource(BASE_URI);	
		
		WebResource nameResource = resource.path("rest").path(PATH_NAME_Query_Gene);		
		 
		
		//Response all genes, For examle: <Gene><Symbol>A1BG</Symbol><Type>mRNA</Type><HGNC_ID>HGNC:5</HGNC_ID></Gene>
		System.out.println(getResponse(nameResource));	
		
		
		//Response all terms, For examle: <Term><Term_ID>GO:0005488</Term_ID><Term_Name>binding</Term_Name>
		nameResource = resource.path("rest").path(PATH_NAME_Query_Term);		
		System.out.println(getResponse(nameResource));	
		
		
		//Response all Associations, For examle: 
		nameResource = resource.path("rest").path(PATH_NAME_Query_Associations);		
		System.out.println(getResponse(nameResource));	
		
		
		//Response all the annotations of the term. The following is one of the annotation results of DOID:0050671: <Annotation><Term_ID>DOID:0050671</Term_ID><Term_Name>female breast cancer</Term_Name><Symbol>BRCA1</Symbol><Type>mRNA</Type><HGNC_ID>HGNC:1100</HGNC_ID><Description>The four most frequent BRCA1 mutations found in female breast cancer cases in Guangxi are all located in exon 10. BRCA1-associated breast cancer cases have earlier onset age, higher nuclear grade and </Description><PMID>25337278</PMID></Annotation>
		nameResource = resource.path("rest").path(PATH_NAME_Query_Term_Annotation + "DOID:0050671");		
		System.out.println(getResponse(nameResource));	
		
		
		//Response all the annotations of the gene. The following is one of the annotation results of HGNC:11998: <Annotation><Term_ID>GO:0016310</Term_ID><Term_Name>phosphorylation</Term_Name><Symbol>TP53</Symbol><Type>mRNA</Type><HGNC_ID>HGNC:11998</HGNC_ID><Description>phosphorylation of p53 was rapidly induced in human fibroblasts upon exposure of cells to hydrogen peroxide (H(2)O(2))</Description><PMID>11447225</PMID></Annotation><Annotation><Term_ID>GO:0002039</Term_ID><Term_Name>p53 binding</Term_Name><Symbol>TP53</Symbol><Type>mRNA</Type><HGNC_ID>HGNC:11998</HGNC_ID><Description>Binding to the p53 binding sites of the Mdm2 promoter alleviates the requirement for p53 C-terminal activation.</Description><PMID>11328884</PMID></Annotation>
		nameResource = resource.path("rest").path(PATH_NAME_Query_Gene_Annotation + "HGNC:11998");		
		System.out.println(getResponse(nameResource));	
				
		//Response all the associated terms of a specified term. The following is one of the annotation results of HP:0010554: <Term_Association><Term1_id>HP:0010554</Term1_id><Term1_name>Cutaneous finger syndactyly</Term1_name><Term2_id>HP:0010561</Term2_id><Term2_name>Undulate ribs</Term2_name><zscore>0.0333333333333333</zscore><pvalue>0.00688434362344392</pvalue></Term_Association>
		nameResource = resource.path("rest").path(PATH_NAME_Query_Term_Associations + "HP:0010554");		
		System.out.println(getResponse(nameResource));	
	}
	 
	 
	/**
	* Response all results.
	* 
	* 
	* @param service
	* @return
	*/
	private static String getResponse(WebResource resource) {
		
		return resource.accept(new String [] {MediaType.TEXT_PLAIN}).get(String.class).toString();
		
	}	

}					
					</pre>
                        </div>

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