package com.fjx.blog.spring.mapper;

import com.fjx.blog.spring.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component(value = "userMapper")
public interface UserMapper {

    @Select("select * from users")
    List<User> selectAll();

    @Select("select * from users where ukey = #{ukey}")
    List<User> selectUserByKey(String ukey);

    @Insert("insert into users values(#{user.id},#{user.ukey},#{user.name},#{user.password},#{user.userLastLoginIp})")
    @Options(useGeneratedKeys = true)
    int save(@Param("user") User user);
}
