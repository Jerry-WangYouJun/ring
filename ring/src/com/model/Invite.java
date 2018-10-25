package com.model;

import java.util.Date;

public class Invite {
    private Integer id;

    private Integer fromId;

    private Integer joinId;

    private Integer pointId;

    private Date inviteDate;

    private String inviteStates;

    private String remark;
    
    private Customer customerFrom ;
    private Customer customerJoin;
    private Location pointLocation;

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

    public Integer getJoinId() {
        return joinId;
    }

    public void setJoinId(Integer joinId) {
        this.joinId = joinId;
    }

    public Integer getPointId() {
        return pointId;
    }

    public void setPointId(Integer pointId) {
        this.pointId = pointId;
    }

    public Date getInviteDate() {
        return inviteDate;
    }

    public void setInviteDate(Date inviteDate) {
        this.inviteDate = inviteDate;
    }

    public String getInviteStates() {
        return inviteStates;
    }

    public void setInviteStates(String inviteStates) {
        this.inviteStates = inviteStates == null ? null : inviteStates.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public Customer getCustomerFrom() {
		return customerFrom;
	}

	public void setCustomerFrom(Customer customerFrom) {
		this.customerFrom = customerFrom;
	}

	public Customer getCustomerJoin() {
		return customerJoin;
	}

	public void setCustomerJoin(Customer customerJoin) {
		this.customerJoin = customerJoin;
	}

	public Location getPointLocation() {
		return pointLocation;
	}

	public void setPointLocation(Location pointLocation) {
		this.pointLocation = pointLocation;
	}

    
    
}