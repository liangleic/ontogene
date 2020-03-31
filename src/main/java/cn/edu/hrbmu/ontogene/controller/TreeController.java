package cn.edu.hrbmu.ontogene.controller;

import cn.edu.hrbmu.ontogene.domain.Path;
import cn.edu.hrbmu.ontogene.domain.Term;
import cn.edu.hrbmu.ontogene.domain.Tree;
import cn.edu.hrbmu.ontogene.service.AnnotationService;
import cn.edu.hrbmu.ontogene.service.PathService;
import cn.edu.hrbmu.ontogene.service.TermService;
import cn.edu.hrbmu.ontogene.service.TreeService;
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
public class TreeController {

    @Autowired
    TreeService treeService;

    @Autowired
    PathService pathService;

    @Autowired
    TermService termService;

    @Autowired
    AnnotationService annotationService;

    //首次打开tree
    @ResponseBody
    @RequestMapping("/getTree")
    public String getTree(Path path) {
        // 用来存放path_names和path_id的值
        List<Map<String, String>> pa_path = new LinkedList<Map<String, String>>();
        String uid, olduid = null;
        // 用来存放随机生成的uid和term_id的对应关系
        Map<String, String> mapiduid = new HashMap<String, String>();
        path = pathService.getPath(path);
        String path_name = path.getPath_names();
        String path_id = path.getPath_ids();
        String isleaf = path.getIs_leaf();

        System.out.println("path1 = " + path);

        String[] patharray = path_name.split("\\|");
        String[] pathid = path_id.split("\\|");

        for (int i = 0; i < patharray.length; i++) {
            uid = this.getuid();
            if (i == 0) {
                olduid = this.getuid();
            }

            Map<String, String> map = new HashMap<>();
            map.put("id", "" + (uid) + "");
            map.put("pId", "" + olduid + "");
            map.put("name", patharray[i]);
            map.put("open", "true");
            if (isleaf.equals("1")) { //
                map.put("isParent", "false");
            } else {
                map.put("isParent", "true");
            }

            map.put("termid", pathid[i]);
            mapiduid.put(pathid[i], uid);
            pa_path.add(map);
            olduid = uid;
        }


        for (int i = 0; i < patharray.length - 1; i++) {

            String puid = mapiduid.get(pathid[i]);
            Tree tree = new Tree();
            tree.setTarget_term_id(pathid[i]);
            List<Tree> treeList = treeService.getTreeList(tree);

            for (Tree tempTree : treeList) {
                Map<String, String> mapchil = new HashMap<String, String>();
                mapchil.put("id", this.getuid());
                mapchil.put("pId", puid);
                mapchil.put("name", tempTree.getSource_term_name());
                mapchil.put("open", "false");
                if (tempTree.getIs_leaf().equals("1")) {
                    mapchil.put("isParent", "false");
                } else {
                    mapchil.put("isParent", "true");
                }
                mapchil.put("termid", tempTree.getSource_term_id());
                pa_path.add(mapchil);
            }
        }
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

        Collections.sort(pa_path, new MapComparator());
        JSONArray ja = JSONArray.fromObject(pa_path);
        String jaa = ja.toString();
        System.out.println("&&&&&&&&&&&&&&&&&&&" + jaa);
        return jaa;
    }


    @ResponseBody
    @RequestMapping("/getAsyncTree")
    public String getTree(String termid, String id) {
        Tree tree = new Tree();
        tree.setTarget_term_id(termid);
        List<Map<String, String>> asynclist = new LinkedList<>();
        List<Tree> treeList = treeService.getTreeList(tree);
        for (Tree tempTree : treeList) {
            Map<String, String> map = new HashMap<String, String>();
            map.put("id", this.getuid());
            map.put("pId", id);
            map.put("name", tempTree.getSource_term_name());
            map.put("open", "false");
            if (tempTree.getIs_leaf().equals("1")) {
                map.put("isParent", "false");
            } else {
                map.put("isParent", "true");
            }
            map.put("termid", tempTree.getSource_term_id());

            asynclist.add(map);
        }
        Collections.sort(asynclist, new MapComparator());
        JSONArray js = JSONArray.fromObject(asynclist);
        return (js.toString());
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

}
