package com.fjx.blog.spring.service.impl;

import com.fjx.blog.spring.entity.User;
import com.fjx.blog.spring.mapper.UserMapper;
import com.fjx.blog.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserByKey(String key) {
        List<User> users = userMapper.selectUserByKey(key);
        if (users == null || users.size() == 0){
            User user =new User();
            user = new User();
            user.setId(0);
            user.setUkey("Yui");
            user.setName("Yui");
            user.setPassword("123456");
            save(user);
            return user;
        }else
            return users.get(0);

    }

    public void save(User user) {
        int i = userMapper.save(user);
    }
}
