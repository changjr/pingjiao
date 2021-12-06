package com.fw.vote.service;

import com.fw.vote.dao.MatchPkDao;
import com.fw.vote.model.MatchPk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class MatchPkServiceImpl implements MatchPkService {
  
  @Autowired
  MatchPkDao matchPkDao;
  
  @Override
  public List<MatchPk> selectMatchPk(MatchPk matchPk) {
	// TODO Auto-generated method stub
	return matchPkDao.selectMatchPk(matchPk);
  }
  
  @Override
  public List<Map<String, String>> selectMatchPkMap(MatchPk matchPk) {
	// TODO Auto-generated method stub
	return matchPkDao.selectMatchPkMap(matchPk);
  }
  
  @Override
  public void insertMatchPk(MatchPk matchPk) {
	// TODO Auto-generated method stub
	matchPkDao.insertMatchPk(matchPk);
	
  }
  
  @Override
  public void updateMatchPk(MatchPk matchPk) {
	// TODO Auto-generated method stub
	matchPkDao.updateMatchPk(matchPk);
  }
  
  @Override
  public MatchPk selectById(String battleId) {
	// TODO Auto-generated method stub
	return matchPkDao.selectById(battleId);
  }
  @Override
  public List<MatchPk> selectListByGradeAndMatchId(MatchPk matchPkInfo) {
	return this.matchPkDao.selectListByGradeAndMatchId(matchPkInfo);
  }
  
  @Override
  public List<MatchPk> selectListByGradeAndMatchIdAndTeacher(MatchPk matchPk) {
	return this.matchPkDao.selectListByGradeAndMatchIdAndTeacher(matchPk);
  }
}
