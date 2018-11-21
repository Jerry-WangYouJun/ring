package com.model;

import java.util.Date;

public class InviteDetail {
    private Integer id;

    private Integer inviteId;

    private String preDate;

    private String confirmDate;

    private String confirmLoc;

    private Integer updateTimes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInviteId() {
        return inviteId;
    }

    public void setInviteId(Integer inviteId) {
        this.inviteId = inviteId;
    }

    public String getPreDate() {
        return preDate;
    }

    public void setPreDate(String preDate) {
        this.preDate = preDate;
    }

    public String getConfirmDate() {
        return confirmDate;
    }

    public void setConfirmDate(String confirmDate) {
        this.confirmDate = confirmDate == null ? null : confirmDate.trim();
    }

    public String getConfirmLoc() {
        return confirmLoc;
    }

    public void setConfirmLoc(String confirmLoc) {
        this.confirmLoc = confirmLoc == null ? null : confirmLoc.trim();
    }

    public Integer getUpdateTimes() {
        return updateTimes;
    }

    public void setUpdateTimes(Integer updateTimes) {
        this.updateTimes = updateTimes;
    }
}