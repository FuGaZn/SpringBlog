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

    public User getUserByName(String name) {
        List<User> users = userMapper.selectAll();
        for (User u: users)
            System.out.println(u.getName());
      //  System.out.println(users.size());
        return null;
    }

    public void save(User user) {
        System.out.println("=============save=============");
        System.out.println(user.getName());
       // userDao.save(user);
        int i = userMapper.save(user);
        System.out.println("i "+i);
    }
}
