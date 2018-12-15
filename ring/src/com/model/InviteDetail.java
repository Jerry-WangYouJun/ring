package com.model;


public class InviteDetail {
    private Integer id;

    private Integer inviteId;

    private String preDate;
    private String preDate2;
    private String preDate3;
    private String confirmDate;
    private String confirmLoc;
    private String confirmLoc2;
    private String confirmLoc3;
    
    private String confirmTime;


    private Integer updateTimes;
    
    private Integer updateTimeJoin;
    
    private String  signFrom ;
    private String  signJoin;
    
    private Location location ;
    private Location location2;
    private Location location3;

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

	public String getPreDate2() {
		return preDate2;
	}

	public void setPreDate2(String preDate2) {
		this.preDate2 = preDate2;
	}

	public String getPreDate3() {
		return preDate3;
	}

	public void setPreDate3(String preDate3) {
		this.preDate3 = preDate3;
	}

	public String getConfirmLoc2() {
		return confirmLoc2;
	}

	public void setConfirmLoc2(String confirmLoc2) {
		this.confirmLoc2 = confirmLoc2;
	}

	public String getConfirmLoc3() {
		return confirmLoc3;
	}

	public void setConfirmLoc3(String confirmLoc3) {
		this.confirmLoc3 = confirmLoc3;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public Location getLocation2() {
		return location2;
	}

	public void setLocation2(Location location2) {
		this.location2 = location2;
	}

	public Location getLocation3() {
		return location3;
	}

	public void setLocation3(Location location3) {
		this.location3 = location3;
	}
	
	
}