package com.fjx.blog.spring.controller.home;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ArticleShowController {
    @Autowired
    ArticleService articleService;

    @RequestMapping(value = "/article/{id}")
    public String articleDetails(@PathVariable("id") int id, Model model){
        Article article = articleService.getArticleById(id);
        model.addAttribute("article", article);
        return "/home/articleDetails";
    }
}
