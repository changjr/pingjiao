package com.fw.vote.service;

import com.fw.vote.model.Vote;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface VoteService {
    public void insert(Vote vote);
    public Map<String,Object> save(Vote vote, HttpSession session, String flag);
}
