package com.fw.vote.service;
import com.fw.vote.model.User;

import java.util.List;

public interface UserService {
    public User login(String account, String password);
    public void regist(User user);
    public List<User> select(User user);
    public User selectById(String userid);

    User selectById(Integer userid);

    public void update(User user);
    public int delete(Integer userid);
    public void insert(User user);
    public int getCount(User user);

}
