package com.fw.vote.dao;

import com.fw.vote.model.Vote;

import java.util.List;

public interface VoteDao {
    public void insert(Vote vote);
    public void update(Vote vote);
    public void delete(String playerId);
    public List<Vote> select(Vote vote);
    public Vote selectById(String playerId);
}
