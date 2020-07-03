package com.fjx.blog.spring.service;

import com.fjx.blog.spring.entity.User;

public interface UserService {
    User getUserByKey(String key);

    void save(User user);
}
