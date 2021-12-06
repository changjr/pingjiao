package com.fw.vote.dao;

import com.fw.vote.model.Match;

import java.util.List;

public interface MatchDao {
    public List<Match> select(Match match);

    public Match getMatchById(String matchId);

    public void insert(Match match);

    public void update(Match match);

    public int delete(String matchId);

    public String save(Match match);
    public int count(Match match);
}
