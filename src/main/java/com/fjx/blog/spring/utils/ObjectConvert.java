package com.fjx.blog.spring.utils;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.vo.ArticleVO;

public class ObjectConvert {

    public static Article convertVO(ArticleVO vo){
        Article article = new Article();
        article.setAuthor(vo.getAuthor());
        article.setContent(vo.getContent());
        article.setStatus(vo.getStatus());
        article.setTitle(vo.getTitle());
        article.setAid(vo.getAid());
        return article;
    }
}
