package com.fjx.blog.spring.service.impl;

import com.fjx.blog.spring.entity.Article;
import com.fjx.blog.spring.mapper.ArticleMapper;
import com.fjx.blog.spring.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.URLDecoder;
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
    public List<Article> getAllArticles(){
        try {
            List<Article> articleList = articleMapper.selectAll();
            for (int i=0;i<articleList.size();i++){
                articleList.get(i).setContentDecode(URLDecoder.decode(articleList.get(i).getContent(),"UTF-8"));
            }
            return articleList;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Article getArticleById(int id) {
        return articleMapper.selectById(id);
    }

    @Override
    public void addViewCount(int id) {
        Article article = articleMapper.selectById(id);
        article.setViewCount((article.getViewCount()+1));
        articleMapper.updateViewCount(article);
    }
}
