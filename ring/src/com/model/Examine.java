package com.model;

import java.util.Date;

public class Examine {
    private Integer id;

    private Integer custId;

    private String reason;

    private Date throughTime;

    private Integer examineUser;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustId() {
        return custId;
    }

    public void setCustId(Integer custId) {
        this.custId = custId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public Date getThroughTime() {
        return throughTime;
    }

    public void setThroughTime(Date throughTime) {
        this.throughTime = throughTime;
    }

    public Integer getExamineUser() {
        return examineUser;
    }

    public void setExamineUser(Integer examineUser) {
        this.examineUser = examineUser;
    }
}