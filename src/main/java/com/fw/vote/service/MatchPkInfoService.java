package com.fw.vote.service;

import com.fw.vote.model.MatchPkInfo;

import java.util.List;


public interface MatchPkInfoService {
    public void insert(MatchPkInfo matchPkInfo);
    public void update(MatchPkInfo matchPkInfo);
    public void delete(String battleId);
    public List<MatchPkInfo> select(MatchPkInfo matchPkInfo);
    public MatchPkInfo selectById(String battleId);
    public MatchPkInfo selectMatchById(String matchId);
    public List<MatchPkInfo> playerList(MatchPkInfo matchPkInfo);
    public List<MatchPkInfo> selectMatchPkInfo(MatchPkInfo matchPkInfo);
    public void updateFlag(MatchPkInfo matchPkInfo);
    public MatchPkInfo get(MatchPkInfo matchPkInfo);

    List<MatchPkInfo> selectListByGradeAndMatchId(MatchPkInfo matchPkInfo);
}
