package com.fw.vote.dao;


import com.fw.vote.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserDao {
   public void insert(User user);
   public User selectById(Integer id);
   public User selectByAccount(String account);
   public List<User> select(User user);
   public void update(User user);
   public int delete(Integer id);
   public int getCount(User user);
}

