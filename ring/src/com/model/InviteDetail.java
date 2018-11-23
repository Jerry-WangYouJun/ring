package com.model;


public class InviteDetail {
    private Integer id;

    private Integer inviteId;

    private String preDate;

    private String confirmDate;
    
    private String confirmTime;

    private String confirmLoc;

    private Integer updateTimes;
    
    private Integer updateTimeJoin;
    
    private String  signFrom ;
    private String  signJoin;

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

	public String getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(String confirmTime) {
		this.confirmTime = confirmTime;
	}

	public Integer getUpdateTimeJoin() {
		return updateTimeJoin;
	}

	public void setUpdateTimeJoin(Integer updateTimeJoin) {
		this.updateTimeJoin = updateTimeJoin;
	}

	public String getSignFrom() {
		return signFrom;
	}

	public void setSignFrom(String signFrom) {
		this.signFrom = signFrom;
	}

	public String getSignJoin() {
		return signJoin;
	}

	public void setSignJoin(String signJoin) {
		this.signJoin = signJoin;
	}
}