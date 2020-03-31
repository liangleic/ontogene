package cn.edu.hrbmu.ontogene.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-11 11:19
 */
@Controller
public class HelloController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    //    @ResponseBody
//    @RequestMapping("/hello")
//    public Map<String ,Object> map(){
//        List<Map<String, Object>> list = jdbcTemplate.queryForList("select * from department");
//        return list.get(0);
//    }
    @GetMapping("/cytotest")
    public String goTutorial() {
        return "/cytotest";
    }
}
