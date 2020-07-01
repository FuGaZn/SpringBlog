package com.fjx.blog.spring.service;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.vo.ArticleVO;
import org.springframework.stereotype.Service;

public interface ArticleService {
    void saveArticle(Article article);
}
