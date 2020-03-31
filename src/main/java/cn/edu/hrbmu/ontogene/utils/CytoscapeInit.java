package cn.edu.hrbmu.ontogene.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2020-03-31 15:14
 */
public class CytoscapeInit {
    public static Map<String, Map<String, List>> initCytoscape(){
        Map<String, Map<String, List>> mapdata = new HashMap<>();


        Map<String, List> mapsc = new HashMap<>();
        List<Map<String, String>> noschema = new ArrayList<>();
        List<Map<String, String>> edschema = new ArrayList<>();


        Map<String, String> map1 = new HashMap<>();
        Map<String, String> map2 = new HashMap<>();
        Map<String, String> map3 = new HashMap<>();
        Map<String, String> map4 = new HashMap<>();
        map1.put("name", "label");
        map1.put("type", "string");

        map3.put("name", "nodesize");
        map3.put("type", "string");


        map4.put("name", "nodecolor");
        map4.put("type", "string");

        map2.put("name", "edgecolor");
        map2.put("type", "string");


        noschema.add(map1);
        noschema.add(map3);
        noschema.add(map4);

        edschema.add(map1);
        edschema.add(map2);

        mapsc.put("nodes", noschema);
        mapsc.put("edges", edschema);
        mapdata.put("dataSchema", mapsc);
        return mapdata;

    }
}
