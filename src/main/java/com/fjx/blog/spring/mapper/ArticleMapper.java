package com.fjx.blog.spring.mapper;

import com.fjx.blog.spring.entity.Article;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

import javax.ws.rs.Path;
import java.util.List;

@Mapper
@Component(value = "articleMapper")
public interface ArticleMapper {

    @Select("select * from articles")
    List<Article> selectAll();

    @Insert("insert into articles values(#{article.aid},#{article.title},#{article.author},#{article.publishTime},#{article.viewCount},#{article.content},#{article.status})")
    @Options(useGeneratedKeys = true)
    int save(@Param("article") Article article);

    @Select("select * from articles where aid = #{id}")
    Article selectById(int id);

    @Update("update articles set title=#{article.title},author=#{article.author},publishTime=#{article.publishTime}," +
            "content=#{article.content},status=#{article.status} where aid=#{article.aid}")
    int update(@Param("article") Article article);

    @Update("update articles set viewCount=#{article.viewCount} where aid=#{article.aid}")
    int updateViewCount(@Param("article") Article article);
}
