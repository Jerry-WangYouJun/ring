package com.model;

public class ActDetail {
	  private Integer id;
	  private Integer actId;
	  private Integer custId;
	  private String detailState;
	  private Customer customer;
	  private Act act;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getActId() {
		return actId;
	}
	public void setActId(Integer actId) {
		this.actId = actId;
	}
	public Integer getCustId() {
		return custId;
	}
	public void setCustId(Integer custId) {
		this.custId = custId;
	}
	public String getDetailState() {
		return detailState;
	}
	public void setDetailState(String detailState) {
		this.detailState = detailState;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Act getAct() {
		return act;
	}
	public void setAct(Act act) {
		this.act = act;
	}
	  
}
