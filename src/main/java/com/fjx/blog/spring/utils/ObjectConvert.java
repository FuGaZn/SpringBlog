package com.fjx.blog.spring.utils;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.vo.ArticleVO;

public class ObjectConvert {

    public static Article convertVO(ArticleVO vo){
        Article article = new Article();
        article.setAuthorName(vo.getAuthor());
        article.setContent(vo.getContent());
        article.setStatus(vo.getStatus());
        article.setTitle(vo.getTitle());
        return article;
    }
}
