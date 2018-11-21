package com.model;

import java.util.Date;

public class Message {
    private Integer id;

    private Integer fromId;

    private Integer toId;

    private String msg;

    private Date msgDate;

    private Integer followId;

    private String remark;
    
    private Customer customerFrom ;
    private Customer customerJoin;

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

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg == null ? null : msg.trim();
    }

    public Date getMsgDate() {
        return msgDate;
    }

    public void setMsgDate(Date msgDate) {
        this.msgDate = msgDate;
    }

    public Integer getFollowId() {
        return followId;
    }

    public void setFollowId(Integer followId) {
        this.followId = followId;
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
    
}