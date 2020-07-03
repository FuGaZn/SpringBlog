package com.fjx.blog.spring.controller.home;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author fujiaixng
 * 访问的主页
 */
@Controller
public class IndexController {
    @Autowired
    ArticleService articleService;

    @RequestMapping({"/index","/"})
    public String index(Model model){
        List<Article> articleList = articleService.getAllArticles();
        model.addAttribute(articleList);
        return "home/index";
    }
}
