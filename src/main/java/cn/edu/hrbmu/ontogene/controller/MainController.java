package cn.edu.hrbmu.ontogene.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 20:24
 */
@Controller
public class MainController {

    @GetMapping("/")
    public String goIndex() {
        return "index";
    }

    @GetMapping("/tutorial")
    public String goTutorial() {
        return "/tutorial/tutorial";
    }


    @GetMapping("/genelink")
    public String goGlink() {
        return "/glink/genelink";
    }

    @GetMapping("/termlink")
    public String goTlink() {
        return "/tlink/termlink";
    }

    @GetMapping("/search")
    public String goSearch() {
        return "/search/search";
    }

    @GetMapping("/service")
    public String goService() {
        return "/service/service";
    }

    @GetMapping("/resource")
    public String goResource() {
        return "resource/resource";
    }

    @GetMapping("/submit")
    public String goSubmit() {
        return "submit/submit";
    }

    @GetMapping("/randomwalk")
    public String goRandomwalk(){return "randomwalk/randomwalk";}

    /**
     * 这个方法只用来做测试，随时可以删除
     * @return
     */
    @GetMapping("/cyto")
    public String goTest() {
        return "/cyto/cyto";
    }

}
