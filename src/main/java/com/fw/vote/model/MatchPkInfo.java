package com.fw.vote.model;

import java.util.List;
import java.util.Map;

public class MatchPkInfo {
    private String matchId;
    private String battleId;
    private String firstPlayerId;
    private String firstSongName;
    private int firstTicketCount;
    private String firstNeedScore;
    private String firstScore;
    private String secondPlayerId;
    private String secondSongName;
    private int secondTicketCount;
    private String secondNeedScore;
    private String secondScore;
    private String battleFlag;
//    添加实体对象firstPlayer，player，secondPlayer是为了绑定firstPlayer.playerId，secondPlayer.playerId并找到playerId的值
    private Player firstPlayer;
    private Player player;
    private Player secondPlayer;
    private String matchName;
    private String matchTime;
    private String playerInfo;
    private String playerName;
    private String playerId;
    private String matchInfo;
    private String grade;

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

    public String getFirstSongName() {
        return firstSongName;
    }

    public void setFirstSongName(String firstSongName) {
        this.firstSongName = firstSongName;
    }

    public int getFirstTicketCount() {
        return firstTicketCount;
    }

    public void setFirstTicketCount(int firstTicketCount) {
        this.firstTicketCount = firstTicketCount;
    }

    public String getFirstNeedScore() {
        return firstNeedScore;
    }

    public void setFirstNeedScore(String firstNeedScore) {
        this.firstNeedScore = firstNeedScore;
    }

    public String getFirstScore() {
        return firstScore;
    }

    public void setFirstScore(String firstScore) {
        this.firstScore = firstScore;
    }

    public String getSecondPlayerId() {
        return secondPlayerId;
    }

    public void setSecondPlayerId(String secondPlayerId) {
        this.secondPlayerId = secondPlayerId;
    }

    public String getSecondSongName() {
        return secondSongName;
    }

    public void setSecondSongName(String secondSongName) {
        this.secondSongName = secondSongName;
    }

    public int getSecondTicketCount() {
        return secondTicketCount;
    }

    public void setSecondTicketCount(int seconTicketCount) {
        this.secondTicketCount = seconTicketCount;
    }

    public String getSecondNeedScore() {
        return secondNeedScore;
    }

    public void setSecondNeedScore(String secondNeedScore) {
        this.secondNeedScore = secondNeedScore;
    }

    public String getSecondScore() {
        return secondScore;
    }

    public void setSecondScore(String secondScore) {
        this.secondScore = secondScore;
    }

    public String getBattleFlag() {
        return battleFlag;
    }

    public void setBattleFlag(String battleFlag) {
        this.battleFlag = battleFlag;
    }


    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public Player getFirstPlayer() {
        return firstPlayer;
    }

    public void setFirstPlayer(Player firstPlayer) {
        this.firstPlayer = firstPlayer;
    }

    public Player getSecondPlayer() {
        return secondPlayer;
    }

    public void setSecondPlayer(Player secondPlayer) {
        this.secondPlayer = secondPlayer;
    }

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

    public String getPlayerInfo() {
        return playerInfo;
    }

    public void setPlayerInfo(String playerInfo) {
        this.playerInfo = playerInfo;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public String getPlayerId() {
        return playerId;
    }

    public void setPlayerId(String playerId) {
        this.playerId = playerId;
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
}
