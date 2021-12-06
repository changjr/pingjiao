package com.fw.vote.service;

import com.fw.vote.dao.PlayerDao;
import com.fw.vote.model.Player;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("playerSerivce")
public class PlayerServiceImpl implements PlayerService{

    @Autowired
    PlayerDao playerDao;
    @Override
    public void insert(Player player) {
        playerDao.insert(player);
    }

    @Override
    public void update(Player player) {

        playerDao.update(player);
    }

    @Override
    public void delete(String playerId) {

        playerDao.delete(playerId);
    }

    @Override
    public List<Player> select(Player player) {

        return playerDao.select(player);
    }

    @Override
    public Player selectById(String playerId) {

        return playerDao.selectById(playerId);
    }

    @Override
    public int getCount(Player player) {
        return playerDao.getCount(player);
    }
    
    @Override
    public Player selectByNo(String playerId) {
        
        return playerDao.selectByNo(playerId);
    }
}
