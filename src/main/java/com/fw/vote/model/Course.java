package com.fw.vote.model;

import java.util.Objects;

public class Course extends BaseBean{

    private String cname;

    private String cid;
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }
}
