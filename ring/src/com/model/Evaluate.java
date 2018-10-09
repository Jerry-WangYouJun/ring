package com.model;

public class Evaluate {
    private Integer id;

    private Integer fromId;

    private Integer toId;

    private String evaluateMsg;

    private String evaluateIds;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFromId() {
        return fromId;
    }

    public void setFromId(Integer fromId) {
        this.fromId = fromId;
    }

    public Integer getToId() {
        return toId;
    }

    public void setToId(Integer toId) {
        this.toId = toId;
    }

    public String getEvaluateMsg() {
        return evaluateMsg;
    }

    public void setEvaluateMsg(String evaluateMsg) {
        this.evaluateMsg = evaluateMsg == null ? null : evaluateMsg.trim();
    }

    public String getEvaluateIds() {
        return evaluateIds;
    }

    public void setEvaluateIds(String evaluateIds) {
        this.evaluateIds = evaluateIds == null ? null : evaluateIds.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}