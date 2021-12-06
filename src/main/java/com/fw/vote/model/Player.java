package com.fw.vote.model;

import java.util.Objects;

public class Player {
    private String playerId;
    private String playerNo;
    private String playerName;
    private String playerImage;
    private String playerCount;
    private String access;
    private int voteNumber;
    private String playerInfo;
    //分页
    private int count;//总记录数
    private int pageSize=4; // 每页记录数
    private int curr=1;//第几页
    private int index;//起始页


    public String getPlayerCount() {
        return playerCount;
    }

    public void setPlayerCount(String playerCount) {
        this.playerCount = playerCount;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    public String getPlayerId() {
        return playerId;
    }

    public void setPlayerId(String playerId) {
        this.playerId = playerId;
    }

    public String getPlayerNo() {
        return playerNo;
    }

    public void setPlayerNo(String playerNo) {
        this.playerNo = playerNo;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public String getPlayerImage() {
        return playerImage;
    }

    public void setPlayerImage(String playerImage) {
        this.playerImage = playerImage;
    }

    public int getVoteNumber() {
        return voteNumber;
    }

    public void setVoteNumber(int voteNumber) {
        this.voteNumber = voteNumber;
    }

    public String getPlayerInfo() {
        return playerInfo;
    }

    public void setPlayerInfo(String playerInfo) {
        this.playerInfo = playerInfo;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurr() {
        return curr;
    }

    public void setCurr(int curr) {
        this.curr = curr;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Player player = (Player) o;
        return Objects.equals(playerId, player.playerId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(playerId);
    }

}
