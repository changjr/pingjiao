package com.fw.vote.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Match {
    private String matchId;
    private String matchName;
    private String matchAddress;
    private String matchImage;
    //    datetime必须加注解
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date matchTime;
    private String matchInfo;
    private int voteNumber;
    private Player firstPlayer;
    private Player secondPlayer;

    public String getMatchId() {
        return matchId;
    }

    public void setMatchId(String matchId) {
        this.matchId = matchId;
    }

    public String getMatchName() {
        return matchName;
    }

    public void setMatchName(String matchName) {
        this.matchName = matchName;
    }

    public String getMatchAddress() {
        return matchAddress;
    }

    public void setMatchAddress(String matchAddress) {
        this.matchAddress = matchAddress;
    }

    public Date getMatchTime() {
        return matchTime;
    }

    public void setMatchTime(Date matchTime) {
        this.matchTime = matchTime;
    }

    public String getMatchInfo() {
        return matchInfo;
    }

    public void setMatchInfo(String matchInfo) {
        this.matchInfo = matchInfo;
    }

    public String getMatchImage() {
        return matchImage;
    }

    public void setMatchImage(String matchImage) {
        this.matchImage = matchImage;
    }

    public int getVoteNumber() {
        return voteNumber;
    }

    public void setVoteNumber(int voteNumber) {
        this.voteNumber = voteNumber;
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
}
