package cn.edu.hrbmu.ontogene.controller;

import cn.edu.hrbmu.ontogene.domain.Annotation;
import cn.edu.hrbmu.ontogene.domain.Term;
import cn.edu.hrbmu.ontogene.service.AnnotationService;
import cn.edu.hrbmu.ontogene.service.TermService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-10-11 10:38
 */
@Controller
public class TermController {

    @Autowired
    TermService termService;

    @Autowired
    AnnotationService annotationService;

    @ResponseBody
    @RequestMapping("/getTerm")
    public String getOneTerm(Term term) {
        System.out.println("term = " + term);
        Term term1 = termService.getTerm(term);
        return term1.getTerm_id();
    }

    @ResponseBody
    @RequestMapping("/getTermList")
    public String getTermList(Term term) {
        List<Term> termList = termService.getTermList(term);
        List<Map<String, String>> listmap = new LinkedList<Map<String, String>>();

        for (Term t : termList) {
            Map<String, String> map = new HashMap<>();
            map.put("id", t.getTerm_id());
            map.put("name", t.getTerm_name());
            map.put("description", t.getTerm_description());
            listmap.add(map);
        }

        JSONArray jsonList = JSONArray.fromObject(listmap);
        return jsonList.toString();
    }

    @ResponseBody
    @GetMapping("/getDescriptionGene")
    public String getDescriptionGene(Annotation annotation) {
        System.out.println("annotation = " + annotation);
        List<Annotation> annList = annotationService.getAnnByRna_hgnc_id(annotation);
        List<String> termidd = new LinkedList<>();
        for (Annotation tempAnn : annList) {
            termidd.add(tempAnn.getTerm_id());
            System.out.println("tempAnn.getTerm_id = " + tempAnn.getTerm_id());
        }

        List<String> listdes = new LinkedList<>();
        if (termidd.size() > 0) {
            List<Term> termList = termService.getTermByInId(termidd);
            for (Term tempTerm : termList) {
                listdes.add(tempTerm.getTerm_description());
            }
        }

        Map mapmax = new HashMap<>();
        mapmax.put("description", listdes);

        JSONObject ja = JSONObject.fromObject(mapmax);
        String jaa = ja.toString();
        System.out.println("gene2term2: " + jaa);
        return jaa;
    }


}
