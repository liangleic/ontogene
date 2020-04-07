package cn.edu.hrbmu.ontogene.controller;

import cn.edu.hrbmu.ontogene.domain.Annotation;
import cn.edu.hrbmu.ontogene.domain.Rna_Interaction;
import cn.edu.hrbmu.ontogene.domain.Term;
import cn.edu.hrbmu.ontogene.service.AnnotationService;
import cn.edu.hrbmu.ontogene.service.RnaInteractionService;
import cn.edu.hrbmu.ontogene.service.TermService;
import cn.edu.hrbmu.ontogene.utils.CytoscapeInit;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:41
 */
@Controller
public class AnnotationController {

    @Autowired
    AnnotationService annotationService;

    @Autowired
    TermService termService;

    @Autowired
    RnaInteractionService rnaInteractionService;

    @ResponseBody
    @GetMapping("/getAnnotation")
    public String getAnnotation(Annotation annotation) {
        List<List<String>> lists = new LinkedList<>();
        List<Annotation> annList = annotationService.getAnn(annotation);
        for (Annotation tempAnn : annList) {
            List<String> li = new LinkedList<>();

            li.add(tempAnn.getTerm_id());
            li.add(tempAnn.getTerm_name());

            if (tempAnn.getRna_hgnc_id() != null && !tempAnn.getRna_hgnc_id().equals(""))
                li.add("<a target='_blank' href='https://www.ncbi.nlm.nih.gov/gene/" + tempAnn.getRna_hgnc_id() + "'>"
                        + tempAnn.getRna_hgnc_id() + "</a>");
            else
                li.add("");

            li.add(tempAnn.getTerm_name());
            li.add(tempAnn.getRna_type());


            String sources = tempAnn.getSource();
            String[] source = sources.split("\\|");

            String term_id = tempAnn.getTerm_id().trim();
            String rna_id = tempAnn.getRna_hgnc_id().trim();

            String result = "";
            for (int j = 0; j < source.length; j++) {
                if (j > 0)
                    result += " | ";
                result += "<a target='_blank' href=\"./QueryDetail?params=" + term_id + "," + rna_id + ","
                        + source[j].trim() + "\">" + source[j] + "</a>";
            }
            li.add(result);
            // System.out.println("result: " + result);

            lists.add(li);
        }
        JSONArray js = JSONArray.fromObject(lists);
        return (js.toString());
    }

    @ResponseBody
    @GetMapping("/getAnnotationGene")
    public String getAnnotationGene(Annotation annotation) {
        System.out.println("getAnnotationGene" + annotation);
        List<List<String>> lists = new LinkedList<>();

        Map<String, Map<String, List>> mapdata = new HashMap<>();

        Map<String, List> mapsc = new HashMap<>();
        List<Map<String, String>> noschema = new ArrayList<>();
        List<Map<String, String>> edschema = new ArrayList<>();
        Map<String, String> map1 = new HashMap<>();
        Map<String, String> map2 = new HashMap<>();
        Map<String, String> map3 = new HashMap<>();

        map1.put("name", "label");
        map1.put("type", "string");

        map3.put("name", "nodesize");
        map3.put("type", "string");

        map2.put("name", "edgecolor");
        map2.put("type", "string");

        noschema.add(map1);
        noschema.add(map3);

        edschema.add(map1);
        edschema.add(map2);

        mapsc.put("nodes", noschema);
        mapsc.put("edges", edschema);

        mapdata.put("dataSchema", mapsc);

        List<Annotation> annList = annotationService.getAnnByRna_hgnc_id(annotation);
        List<String> termidd = new LinkedList<>();

        HashSet<String> termSet = new HashSet<String>();
        for (Annotation tempAnn : annList) {
            List<String> li = new LinkedList<>();

            li.add(tempAnn.getTerm_id());
            li.add(tempAnn.getTerm_name());

            if (tempAnn.getRna_hgnc_id() != null && !tempAnn.getRna_hgnc_id().equals(""))
                li.add("<a target='_blank' href='http://www.genenames.org/cgi-bin/gene_symbol_report?hgnc_id=" + tempAnn.getRna_hgnc_id() + "'>" + tempAnn.getRna_hgnc_id() + "</a>");
            else
                li.add("");

            li.add(tempAnn.getRna_symbol());
            li.add(tempAnn.getRna_type());

			/*if(rs.getString(6)!=null && !rs.getString(6).equals(""))
				li.add("<a href='http://www.ncbi.nlm.nih.gov/pubmed/" + rs.getString(6) + "'>" + rs.getString(6) + "</a>");
			else
				li.add("");*/

            String sources = tempAnn.getSource();
            String[] source = sources.split("\\|");

            String term_id = tempAnn.getTerm_id().trim();
            String rna_id = tempAnn.getRna_hgnc_id().trim();

            String result = "";
            for (int i = 0; i < source.length; i++) {
                if (i > 0)
                    result += " | ";
                result += "<a target='_blank' href=\"./QueryDetail?params=" + term_id + "," +
                        rna_id + "," + source[i].trim() + "\">" + source[i] + "</a>";
            }

            //System.out.println("result: " + result);

            li.add(result);

            lists.add(li);
        }

        //查询根节点
        List<Map<String, String>> pa_path = new LinkedList<Map<String, String>>();
        List<Term> termIsRootList = termService.getTermIsRoot();
        for (Term tempTerm : termIsRootList) {
            Map<String, String> maproot = new HashMap<String, String>();
            maproot.put("id", this.getuid());
            maproot.put("pId", this.getuid());
            maproot.put("name", tempTerm.getTerm_name());
            maproot.put("open", "false");
            maproot.put("isParent", "true");
            maproot.put("termid", tempTerm.getTerm_id());

            pa_path.add(maproot);
        }

        Map mapmax = new HashMap<>();
        mapmax.put("path", pa_path);
        mapmax.put("table", lists);
        JSONObject ja = JSONObject.fromObject(mapmax);
        String jaa = ja.toString();
        System.out.println("jaa: " + jaa);
        return jaa;
    }


    public static String getuid() {
        UUID uuid = UUID.randomUUID();
        String uuid_str = uuid.toString();
        return uuid_str;
    }

    public class MapComparator implements Comparator<Map<String, String>> {

        @Override
        public int compare(Map<String, String> o1, Map<String, String> o2) {
            // TODO Auto-generated method stub
            String b2 = o2.get("name");
            if (b2 != null) {
                return o1.get("name").compareTo(b2);
            }
            return 0;

        }

    }

    @ResponseBody
    @GetMapping("/getAnnotationLimit")
    public String getAnnByLimit(HttpServletRequest request) {
        Map<String, Map<String, List>> mapdata = CytoscapeInit.initCytoscape();

        String[] noid = request.getParameterValues("qc");
        ArrayList<String> node1List1 = new ArrayList<String>();
        ArrayList<String> node1List2 = new ArrayList<String>();

        Map<String, List> mapda = new HashMap<>();
        List<Map<String, String>> listnode = new ArrayList<>();
        HashMap<String, Map<String, String>> Mapnode = new HashMap<>();
        HashSet<String> mapset = new HashSet<String>();

        List<Map<String, String>> listedge = new ArrayList<>();
        HashMap<String, Map<String, String>> Mapedge = new HashMap<String, Map<String, String>>();
        Map<String, String> mapparent = new HashMap<>();


        /************ first gene **************/
        String pd = noid[0];
        System.out.println("pd:" + pd);

        Annotation annotation = new Annotation();
        annotation.setTerm_id(pd);
        List<Annotation> annotationList = annotationService.getAnnById(annotation);

        mapparent.put("id", pd);
        mapparent.put("label", pd);
        mapparent.put("nodecolor", "gene");
        mapparent.put("nodesize", "parent");

        listnode.add(mapparent);

        for (Annotation a : annotationList) {
            node1List1.add(a.getRna_hgnc_id());
        }
        /************ first gene **************/


        /************ second gene **************/
        if (!noid[1].equals(noid[0])) {
            pd = noid[1];
            System.out.println("aaaaaaa:" + pd);
            annotation.setTerm_id(pd);
            List<Annotation> annotationList2 = annotationService.getAnnById(annotation);

            Map<String, String> mapparent2 = new HashMap<>();
            mapparent2.put("id", pd);
            mapparent2.put("label", pd);
            mapparent2.put("nodecolor", "gene");
            mapparent2.put("nodesize", "parent");

            for (Annotation a : annotationList2) {
                if (!node1List1.contains(a.getRna_hgnc_id())) {
                    node1List2.add(a.getRna_hgnc_id());
                } else {
                    System.out.println("common id: " + a.getRna_hgnc_id());
                    node1List1.remove(a.getRna_hgnc_id());

                    Map<String, String> mapchild = new HashMap<>();
                    mapchild.put("id", a.getRna_hgnc_id());
                    mapchild.put("label", a.getRna_symbol());
                    mapchild.put("nodecolor", "gene_pre");
                    mapchild.put("nodesize", "child");

                    listnode.add(mapchild);

                    Map<String, String> mapedge = new HashMap<>();
                    mapedge.put("id", a.getRna_hgnc_id() + pd);
                    mapedge.put("label", a.getRna_hgnc_id() + pd);
                    mapedge.put("target", a.getRna_hgnc_id());
                    mapedge.put("source", pd);
                    mapedge.put("edgecolor", a.getTerm_type());

                    listedge.add(mapedge);

                    Map<String, String> mapedge2 = new HashMap<>();
                    mapedge2.put("id", a.getRna_hgnc_id() + noid[0]);
                    mapedge2.put("label", a.getRna_hgnc_id() + noid[0]);
                    mapedge2.put("target", a.getRna_hgnc_id());
                    mapedge2.put("source", noid[0]);
                    mapedge2.put("edgecolor", a.getTerm_type());

                    listedge.add(mapedge2);
                }
            }
            listnode.add(mapparent2);

            List<String> lists = new ArrayList<>();
            lists.addAll(node1List1);
            lists.addAll(node1List2);
            List<Rna_Interaction> rna_interactionList = rnaInteractionService.getRnaInteraction(node1List1, node1List2);


            if (node1List1.size() > 0 && node1List2.size() > 0) {

                for (Rna_Interaction rna : rna_interactionList) {

                    Map<String, String> mapedge = new HashMap<>();
                    mapedge.put("id", rna.getRna1_hgnc_id() + rna.getRna2_hgnc_id());
                    mapedge.put("label", rna.getRna1_hgnc_id() + rna.getRna2_hgnc_id());
                    mapedge.put("target", rna.getRna1_hgnc_id());
                    mapedge.put("source", rna.getRna2_hgnc_id());
                    mapedge.put("edgecolor", "inter");

                    if (!mapset.contains(rna.getRna1_hgnc_id())) {
                        Map<String, String> mapchild = new HashMap<>();
                        mapchild.put("id", rna.getRna1_hgnc_id());
                        mapchild.put("label", rna.getRna1_symbol());
                        mapchild.put("nodecolor", "gene_pre");
                        mapchild.put("nodesize", "child");

                        listnode.add(mapchild);
                        mapset.add(rna.getRna1_hgnc_id());
                    }
                    if (!mapset.contains(rna.getRna2_hgnc_id())) {
                        Map<String, String> mapchild = new HashMap<>();
                        mapchild.put("id", rna.getRna2_hgnc_id());
                        mapchild.put("label", rna.getRna2_symbol());
                        mapchild.put("nodecolor", "gene_pre");
                        mapchild.put("nodesize", "child");

                        listnode.add(mapchild);
                        mapset.add(rna.getRna2_hgnc_id());
                    }

                    if (!listedge.contains(mapedge))
                        listedge.add(mapedge);
                    else {
                        System.out.println(rna.getRna1_hgnc_id() + ", " + rna.getRna2_hgnc_id());
                    }

                    Map<String, String> mapedge1 = new HashMap<>();
                    mapedge1.put("id", rna.getRna1_hgnc_id() + noid[0]);
                    mapedge1.put("label", rna.getRna1_hgnc_id() + noid[0]);
                    mapedge1.put("target", rna.getRna1_hgnc_id());
                    mapedge1.put("source", noid[0]);
                    mapedge1.put("edgecolor", rna.getRna1_type());

                    if (!listedge.contains(mapedge1))
                        listedge.add(mapedge1);

                    Map<String, String> mapedge2 = new HashMap<>();
                    mapedge2.put("id", rna.getRna2_hgnc_id() + noid[1]);
                    mapedge2.put("label", rna.getRna2_hgnc_id() + noid[1]);
                    mapedge2.put("target", rna.getRna2_hgnc_id());
                    mapedge2.put("source", noid[1]);
                    mapedge2.put("edgecolor", rna.getRna2_type());

                    if (!listedge.contains(mapedge2))
                        listedge.add(mapedge2);
                }
            }
        }
        /************ second gene **************/
        mapda.put("nodes", listnode);
        mapda.put("edges", listedge);
        mapdata.put("data", mapda);
        JSONObject js = JSONObject.fromObject(mapdata);

        System.out.println("js.toString(): " + js.toString());
        // return "{\"dataSchema\":{\"nodes\":[{\"name\":\"label\",\"type\":\"string\"},{\"name\":\"nodecolor\",\"type\":\"string\"},{\"name\":\"nodesize\",\"type\":\"string\"}],\"edges\":[{\"name\":\"label\",\"type\":\"string\"},{\"name\":\"edgecolor\",\"type\":\"string\"}]},\"data\":{\"nodes\":[{\"nodecolor\":\"gene\",\"id\":\"GO:1903001\",\"label\":\"GO:1903001\",\"nodesize\":\"parent\"},{\"nodecolor\":\"gene\",\"id\":\"GO:1903002\",\"label\":\"GO:1903002\",\"nodesize\":\"parent\"},{\"nodecolor\":\"gene\",\"id\":\"GO:1903003\",\"label\":\"GO:1903003\",\"nodesize\":\"parent\"},{\"nodecolor\":\"gene_pre\",\"id\":\"407018\",\"label\":\"MIR27A\",\"nodesize\":\"child\"},{\"nodecolor\":\"gene_pre\",\"id\":\"89780\",\"label\":\"WNT3A\",\"nodesize\":\"child\"}],\"edges\":[{\"edgecolor\":\"do\",\"id\":\"3767DOID:9352\",\"label\":\"3767DOID:9352\",\"source\":\"GO:1903003\",\"target\":\"407018\"},{\"edgecolor\":\"do\",\"id\":\"3767DOID:9352\",\"label\":\"3767DOID:9342\",\"source\":\"GO:1903001\",\"target\":\"GO:1903002\"},{\"edgecolor\":\"do\",\"id\":\"3767DOID:9352\",\"label\":\"3767DOID:9351\",\"source\":\"GO:1903002\",\"target\":\"GO:1903003\"},{\"edgecolor\":\"do\",\"id\":\"3767DOID:9352\",\"label\":\"3767DOID:9352\",\"source\":\"GO:1903001\",\"target\":\"GO:1903003\"}]}}";

        return (js.toString());
    }
}