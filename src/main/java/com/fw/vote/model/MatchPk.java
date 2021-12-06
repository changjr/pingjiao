package com.fw.vote.model;

public class MatchPk {
    private String matchId;
    private String battleId;
    private String firstPlayerId;
    private String secondPlayerId;
    private int secondTicketCount;
    private String battleFlag;

    private String matchName;
    private String matchTime;
    private String grade;
    private String teacherName;
    private String courseName;
    private String matchInfo;
    
    
    public String getMatchName() {
        return matchName;
    }
    
    public void setMatchName(String matchName) {
        this.matchName = matchName;
    }
    
    public String getMatchTime() {
        return matchTime;
    }
    
    public void setMatchTime(String matchTime) {
        this.matchTime = matchTime;
    }
    
    public String getTeacherName() {
        return teacherName;
    }
    
    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
    
    public String getCourseName() {
        return courseName;
    }
    
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    
    public String getMatchInfo() {
        return matchInfo;
    }
    
    public void setMatchInfo(String matchInfo) {
        this.matchInfo = matchInfo;
    }
    
    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

	public String getMatchId() {
        return matchId;
    }

    public void setMatchId(String matchId) {
        this.matchId = matchId;
    }

    public String getBattleId() {
        return battleId;
    }

    public void setBattleId(String battleId) {
        this.battleId = battleId;
    }

    public String getFirstPlayerId() {
        return firstPlayerId;
    }

    public void setFirstPlayerId(String firstPlayerId) {
        this.firstPlayerId = firstPlayerId;
    }

    public int getSecondTicketCount() {
        return secondTicketCount;
    }

    public void setSecondTicketCount(int secondTicketCount) {
        this.secondTicketCount = secondTicketCount;
    }
    

    public String getSecondPlayerId() {
        return secondPlayerId;
    }

    public void setSecondPlayerId(String secondPlayerId) {
        this.secondPlayerId = secondPlayerId;
    }
    

    public String getBattleFlag() {
        return battleFlag;
    }

    public void setBattleFlag(String battleFlag) {
        this.battleFlag = battleFlag;
    }
    
   
}
