package com.model;

public class Act {
    private Integer id;
    
    private Integer custId;

    private String actName;

    private String actLoca;

    private String actAddress;

    private String admin;

    private String actForm;

    private String tags;

    private String editorValue;

    private Double money;
    
    private String actState;
    
    private String actDate;
    
    private String acount ;
    private String actEnd ;
    private String payType;
    private String payRange;
    
    
    private Customer customer;
    private ActDetail detail;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getActName() {
        return actName;
    }

    public void setActName(String actName) {
        this.actName = actName == null ? null : actName.trim();
    }

    public String getActLoca() {
        return actLoca;
    }

    public void setActLoca(String actLoca) {
        this.actLoca = actLoca == null ? null : actLoca.trim();
    }

    public String getActAddress() {
        return actAddress;
    }

    public void setActAddress(String actAddress) {
        this.actAddress = actAddress == null ? null : actAddress.trim();
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin == null ? null : admin.trim();
    }

    public String getActForm() {
        return actForm;
    }

    public void setActForm(String actForm) {
        this.actForm = actForm == null ? null : actForm.trim();
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags == null ? null : tags.trim();
    }

    public String getEditorValue() {
		return editorValue;
	}

	public void setEditorValue(String editorValue) {
		this.editorValue = editorValue;
	}

	public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

	public String getActState() {
		return actState;
	}

	public void setActState(String actState) {
		this.actState = actState;
	}

	public String getActDate() {
		return actDate;
	}

	public void setActDate(String actDate) {
		this.actDate = actDate;
	}

	public Integer getCustId() {
		return custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public ActDetail getDetail() {
		return detail;
	}

	public void setDetail(ActDetail detail) {
		this.detail = detail;
	}

	public String getAcount() {
		return acount;
	}

	public void setAcount(String acount) {
		this.acount = acount;
	}

	public String getActEnd() {
		return actEnd;
	}

	public void setActEnd(String actEnd) {
		this.actEnd = actEnd;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayRange() {
		return payRange;
	}

	public void setPayRange(String payRange) {
		this.payRange = payRange;
	}
	
    
}