package com.fjx.blog.spring.service.impl;

import com.fjx.blog.spring.entity.User;
import com.fjx.blog.spring.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    public User getUserByName(String name) {
        User user = new User();
        user.setName("Yui");
        user.setPassword("123456");
        return user;
    }

    public void save(User user) {

    }
}
