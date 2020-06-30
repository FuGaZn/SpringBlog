package com.fjx.blog.spring.service;

import com.fjx.blog.spring.entity.User;

public interface UserService {
    User getUserByName(String name);

    void save(User user);
}
