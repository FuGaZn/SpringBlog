package com.fjx.blog.spring.controller.admin;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author fujiaxing
 * 后台主界面
 */
@Controller
public class AdminController {
    @Autowired
    ArticleService articleService;

    @RequestMapping("/admin")
    public String admin(Model model){
        List<Article> articleList = articleService.getAllArticles();
        model.addAttribute("articleList", articleList);
        return "/admin/index";
    }

    @RequestMapping("/admin/comment")
    public String comment(){
        return "/admin/comment";
    }
    @RequestMapping("/admin/category")
    public String category(){
        return "/admin/category";
    }

}
