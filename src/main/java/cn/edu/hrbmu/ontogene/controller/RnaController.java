package cn.edu.hrbmu.ontogene.controller;

import cn.edu.hrbmu.ontogene.domain.Annotation;
import cn.edu.hrbmu.ontogene.domain.Rna;
import cn.edu.hrbmu.ontogene.domain.Term;
import cn.edu.hrbmu.ontogene.service.AnnotationService;
import cn.edu.hrbmu.ontogene.service.RnaService;
import cn.edu.hrbmu.ontogene.service.TermService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-10-11 10:38
 */
@Controller
public class RnaController {

    @Autowired
    TermService termService;

    @Autowired
    AnnotationService annotationService;

    @Autowired
    RnaService rnaService;


    @ResponseBody
    @RequestMapping("/getDescript")
    public String getDescript(String[] qns) {
        List<Map<String, String>> list = new LinkedList<Map<String, String>>();

        for (String tempId : qns) {
            Term term = new Term();
            term.setTerm_id(tempId);
            List<Term> termListID = termService.getTermListID(term);
            for (Term tempTerm : termListID) {
                Map<String, String> map = new HashMap<String, String>();
                map.put("description", tempTerm.getTerm_description());
                list.add(map);
            }

        }
        JSONArray js = JSONArray.fromObject(list);
        return (js.toString());
    }


    @ResponseBody
    @RequestMapping("/getGeneDescript")
    public String getGeneDescript(String[] qns) {
        List<Map<String, String>> list = new LinkedList<Map<String, String>>();
        List<String> geneids = new ArrayList<String>();
        for (String tempId : qns) {
            Annotation annotation = new Annotation();
            annotation.setTerm_id(tempId);
            List<Annotation> annList = annotationService.getAnn(annotation);
            for (Annotation ann : annList) {
                geneids.add(ann.getRna_hgnc_id());
            }
        }

        if (geneids.size() > 0) {
            List<Rna> rnaList = rnaService.getRnaList(geneids);
            System.out.println("rnaaaaaaaaaaaaaaaaa");
            for (Rna tempRna : rnaList) {
                Map<String, String> map = new HashMap<String, String>();
                map.put("description", tempRna.getDescription());
                list.add(map);
            }


        }
        JSONArray js = JSONArray.fromObject(list);
        return (js.toString());
    }


    @ResponseBody
    @RequestMapping("/getRnaList")
    public String getGeneDescript(Rna rna) {
        List<Map<String, String>> listmap = new LinkedList<Map<String, String>>();
        List<Rna> rnaList = rnaService.getRnaByRna_symbol(rna);
        for (Rna tempRna : rnaList) {
            Map<String, String> map = new HashMap<>();
            map.put("id", tempRna.getHgnc_id());
            map.put("name", tempRna.getRna_symbol());
            listmap.add(map);
        }
        JSONArray jaaa = JSONArray.fromObject(listmap);
        String ja = jaaa.toString();
        return ja;
    }

    @ResponseBody
    @RequestMapping("/getRNANameID")
    public String getRNANameID(Rna rna) {
        return rnaService.getOneRnaByRan_symbol(rna).getHgnc_id();
    }

    @ResponseBody
    @RequestMapping("/getGeneDescriptGene")
    public String getGeneDescriptGene(Rna rna) {
        List<Map<String, String>> list = new LinkedList<Map<String,String>>();
        List<Rna> rnaList = rnaService.getRnaByHgnc_id(rna);
        for (Rna tempRna:rnaList){
            Map<String, String> map = new HashMap<String, String>();
            map.put("description", tempRna.getDescription());
            list.add(map);
        }
        JSONArray js = JSONArray.fromObject(list);
        return (js.toString());
    }


}
