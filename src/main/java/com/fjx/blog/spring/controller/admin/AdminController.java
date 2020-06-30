package com.fjx.blog.spring.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @author fujiaxing
 * 后台主界面
 */
@Controller
public class AdminController {
    @RequestMapping("/admin")
    public String admin(){
        return "/admin/index";
    }
}
