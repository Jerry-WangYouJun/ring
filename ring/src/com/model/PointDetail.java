package com.model;

public class PointDetail {
    private Integer id;
    
    private Integer account;

    private Integer point;

    private Integer pointId;

    private String reason;

    private String remark;
    
    private String pointDate;
    
    private Points pointBean;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public Integer getPointId() {
        return pointId;
    }

    public void setPointId(Integer pointId) {
        this.pointId = pointId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public Points getPointBean() {
		return pointBean;
	}

	public void setPointBean(Points pointBean) {
		this.pointBean = pointBean;
	}

	public Integer getAccount() {
		return account;
	}

	public void setAccount(Integer account) {
		this.account = account;
	}

	public String getPointDate() {
		return pointDate;
	}

	public void setPointDate(String pointDate) {
		this.pointDate = pointDate;
	}
	
    
}