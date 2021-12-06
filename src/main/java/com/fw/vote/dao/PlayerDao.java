package com.fw.vote.dao;

import com.fw.vote.model.Player;

import java.util.List;

public interface PlayerDao {
    public void insert(Player player);
    public void update(Player player);
    public void delete(String playerId);
    public List<Player> select(Player player);
    public Player selectById(String playerId);
    public List<Player> count(Player player);
    public int getCount(Player player);
    public Player selectByNo(String playerId);
}
