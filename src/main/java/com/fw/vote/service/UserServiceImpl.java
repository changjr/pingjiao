package com.fw.vote.service;

import com.fw.vote.dao.UserDao;
import com.fw.vote.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService v")
public class UserServiceImpl implements UserService{
    @Autowired
    UserDao userDao;

    @Override
    public User login(String account, String password) {
        User user = userDao.selectByAccount(account);
        if(user != null && user.getPassword().equals(password)){

            return user;
        }
        return null;
    }

    @Override
    public void regist(User user) {
        userDao.insert(user);
    }

    @Override
    public List<User> select(User user) {
        return userDao.select(user);
    }

    @Override
    public User selectById(String userid) {
        return null;
    }

    @Override
    public User selectById(Integer userid) {
        return userDao.selectById(userid);
    }


    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public int delete(Integer userid) {
        return userDao.delete(userid);
    }

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public int getCount(User user) {
        return userDao.getCount(user);
    }


}
