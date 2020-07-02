package com.fjx.blog.spring.service.impl;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.mapper.ArticleMapper;
import com.fjx.blog.spring.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    ArticleMapper articleMapper;

    @Override
    public void saveArticle(Article article) {
        if (article.getAid()== 0)
            articleMapper.save(article);
        else
            articleMapper.update(article);
    }

    @Override
    public List<Article> getAllArticles() {
        return articleMapper.selectAll();
    }

    @Override
    public Article getArticleById(int id) {
        return articleMapper.selectById(id);
    }

}
