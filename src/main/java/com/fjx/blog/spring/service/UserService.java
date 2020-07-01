package com.fjx.blog.spring.service;

import com.fjx.blog.spring.entity.User;
import org.springframework.stereotype.Service;

public interface UserService {
    User getUserByName(String name);

    void save(User user);
}
