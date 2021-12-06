package com.fw.vote.service;

import com.fw.vote.dao.MatchDao;
import com.fw.vote.model.Match;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("MatchService")
public class MatchServiceImpl implements MatchService{
    @Autowired
    MatchDao matchDao;

    @Override
    public List<Match> select(Match match) {
        return matchDao.select(match);
    }

    @Override
    public Match getMatchById(String matchId) {
        return matchDao.getMatchById(matchId);
    }

    @Override
    public void insert(Match match) {
        matchDao.insert(match);
    }

    @Override
    public void update(Match match) {
        matchDao.update(match);
    }

    @Override
    public int delete(String matchId) {
        return matchDao.delete(matchId);
    }

    @Override
    public String save(Match match) {
        return matchDao.save(match);
    }

    @Override
    public int count(Match match) {
        return matchDao.count(match);
    }


}
