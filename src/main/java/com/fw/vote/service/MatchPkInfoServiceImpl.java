package com.fw.vote.service;

import com.fw.vote.dao.MatchPkInfoDao;
import com.fw.vote.model.MatchPkInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("MatchPkInfoService")
public class MatchPkInfoServiceImpl implements MatchPkInfoService{
    @Autowired
    MatchPkInfoDao matchPkInfoDao;

    @Override
    public void insert(MatchPkInfo matchPkInfo) {
        matchPkInfoDao.insert(matchPkInfo);
    }

    @Override
    public void update(MatchPkInfo matchPkInfo) {
        matchPkInfoDao.update(matchPkInfo);
    }

    @Override
    public void delete(String battleId) {

    }

    @Override
    public List<MatchPkInfo> select(MatchPkInfo matchPkInfo) {
        return matchPkInfoDao.select(matchPkInfo);
    }

    @Override
    public MatchPkInfo selectById(String battleId) {
        return null;
    }

    @Override
    public MatchPkInfo selectMatchById(String matchId) {
        return matchPkInfoDao.selectMatchById(matchId);
    }


    @Override
    public List<MatchPkInfo> playerList(MatchPkInfo matchPkInfo) {
        return matchPkInfoDao.playerList(matchPkInfo);
    }

    @Override
    public List<MatchPkInfo> selectMatchPkInfo(MatchPkInfo matchPkInfo) {
        return matchPkInfoDao.selectMatchPkInfo(matchPkInfo);
    }

    @Override
    @Transactional
    public void updateFlag(MatchPkInfo matchPkInfo) {
        matchPkInfoDao.updateAllFlag(matchPkInfo);
        matchPkInfo.setBattleFlag("1");
        matchPkInfoDao.update(matchPkInfo);

    }

    @Override
    public MatchPkInfo get(MatchPkInfo matchPkInfo) {
        return matchPkInfoDao.get(matchPkInfo);
    }

    @Override
    public List<MatchPkInfo> selectListByGradeAndMatchId(MatchPkInfo matchPkInfo) {
        return matchPkInfoDao.selectListByGradeAndMatchId(matchPkInfo);
    }

}
