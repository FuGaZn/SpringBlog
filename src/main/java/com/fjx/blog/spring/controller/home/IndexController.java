package com.fjx.blog.spring.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author fujiaixng
 * 访问的主页
 */
@Controller
public class IndexController {
    @RequestMapping("/index")
    public String index(){
        return "home/index";
    }
}
