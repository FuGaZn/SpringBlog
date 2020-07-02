package com.fjx.blog.spring.service;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.vo.ArticleVO;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ArticleService {
    void saveArticle(Article article);

    List<Article> getAllArticles();

    Article getArticleById(int id);

}
