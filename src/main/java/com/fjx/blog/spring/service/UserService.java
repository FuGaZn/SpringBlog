package com.fjx.blog.spring.service;

import com.fjx.blog.spring.entity.User;
import org.springframework.stereotype.Service;

public interface UserService {
    User getUserByKey(String key);

    void save(User user);
}
