package com.fw.vote.model;

public class BaseBean {
    //分页
    private int count;//总记录数
    private int pageSize=4; // 每页记录数
    private int curr=1;//第几页
    private int index;//起始页

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
}
