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
        System.out.println(userMapper == null);
        System.out.println(userMapper.selectAll() == null);
      //  System.out.println(users.size());
        User u = userMapper.selectUser("Yui");
        if (u == null){
            u = new User();
            u.setUid(0);
            u.setName("Yui");
            u.setPassword("123456");
            save(u);
        }
        User user = userMapper.selectUser(name);

        return user;
    }

    public void save(User user) {
        System.out.println("=============save=============");
        System.out.println(user.getName());
       // userDao.save(user);
        int i = userMapper.save(user);
        System.out.println("i "+i);
    }
}
