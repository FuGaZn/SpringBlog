package com.fjx.blog.spring.controller.home;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.service.ArticleService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/article/view/{id}")
    public void addView(@PathVariable("id") int id){
        articleService.addViewCount(id);
    }
}
