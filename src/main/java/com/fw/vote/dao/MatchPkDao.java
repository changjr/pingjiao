package com.fw.vote.dao;

import com.fw.vote.model.MatchPk;

import java.util.List;
import java.util.Map;


public interface MatchPkDao {
  public List<MatchPk> selectMatchPk(MatchPk matchPk);
  
  public List<Map<String, String>> selectMatchPkMap(MatchPk matchPk);
  
  public void insertMatchPk(MatchPk matchPk);
  
  public void updateMatchPk(MatchPk matchPk);
  
  public MatchPk selectById(String battleId);
  
  public List<MatchPk> selectListByGradeAndMatchId(MatchPk matchPk);
  
  public List<MatchPk> selectListByGradeAndMatchIdAndTeacher(MatchPk matchPk);
  
}
