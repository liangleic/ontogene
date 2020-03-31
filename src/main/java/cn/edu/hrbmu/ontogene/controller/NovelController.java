package cn.edu.hrbmu.ontogene.controller;

import cn.edu.hrbmu.ontogene.domain.Novel;
import cn.edu.hrbmu.ontogene.service.NovelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-18 15:41
 */
@Controller
public class NovelController {

    @Autowired
    NovelService novelService;

    @PostMapping("/novelSubmit")
    public String submit(Novel novel, HttpServletRequest request) {
        int i = novelService.insertNov(novel);
        if (i != 0) {
            request.setAttribute("flag", String.valueOf(i));
        } else {
            request.setAttribute("flag", String.valueOf(0));
        }
        return "/submit/submit";
    }


}
