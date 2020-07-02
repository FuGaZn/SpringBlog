package com.fjx.blog.spring.mapper;

import com.fjx.blog.spring.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component(value = "userMapper")
public interface UserMapper {

    @Select("select * from user")
    List<User> selectAll();

    @Select("select * from user where name = #{username}")
    List<User> selectUser(String username);

    @Insert("insert into user(uid,name,password,userLastLoginIp) values(#{id},#{name},#{password},#{userLastLoginIp})")
    int save(User user);
}
