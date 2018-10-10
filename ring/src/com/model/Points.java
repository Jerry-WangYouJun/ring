package com.model;

public class Points {
    private Integer id;

    private Integer custId;

    private Integer point;

    private String flag;

    private Integer wavePoint;

    private String waveReason;
    
    private Customer customer;
    

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

    public Integer getPoint() {
        return point;
    }

    public void setPoint(Integer point) {
        this.point = point;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public Integer getWavePoint() {
        return wavePoint;
    }

    public void setWavePoint(Integer wavePoint) {
        this.wavePoint = wavePoint;
    }

    public String getWaveReason() {
        return waveReason;
    }

    public void setWaveReason(String waveReason) {
        this.waveReason = waveReason == null ? null : waveReason.trim();
    }

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}