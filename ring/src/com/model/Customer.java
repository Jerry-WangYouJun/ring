package com.model;

import java.util.List;

public class Customer {
    private Integer id;

    private String examine;
    
    private String openId;

    private String headImage;

    private String chName;

    private String nickName;

    private String sex;

    private String webSex;//查询的性别
    
    private  String frontImg ;
    private String backImg;
   
    private String birthday;
    private String birthday2;

    //家乡
    private String hometown;
    private String hometownProvince;
    private String hometownCity;
    private String hometownCountry;
    private String hometown2;
    
    private String loca;

    //现居地
    private String addtress;
    private String addressProvince;
    private String addressCity;
    private String addressCountry;

    private String height;
    //身高查询条件
    private String heightQuery;
    private String custLoca;
    

	private Double height2;

    private Double weight;
    private Double weight2;

    private String marriage;
    private String marriage2;

    private String children;

    private String degree;
    private String degree2;

    private String houseStatus;
    private String houseStatus2;

    private String industry;

    private String income;
    private String income2;
    private String qq;

    private String telephone;

    private String email;

    private String referee;

    private String introduction;

    private String declaration;

    private String ask;

    private String remark;
    
    private String flag ;
    
    private String flagTemp ;
    
    private Integer age ;
    
    // from - to 是查询用的
    private String ageFrom ;
    private String ageTo ;
    private Double heightFrom;
    private Double heightTo;
    
    private String economic ;
    private String  looks; 
    private String disposition;
    private String disposition2;
    private String  lifeRole; 
    private String lifeType;
    private String  nonType; 
    private String other;
    
    private String carStatus;
    private String carStatus2;
    
    private String wx ;
    private String hobby;
    private String hobby2;
    private String weekday;
    private String weekday2;
    private String travel;
    private String travel2;
    private Integer age1;
    private Integer age2;
    private Double height1;
    private Integer inviteFlag ;
    
    
    List<Focus> focus  ;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getExamine() {
        return examine;
    }

    public void setExamine(String examine) {
        this.examine = examine == null ? null : examine.trim();
    }

    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    public String getChName() {
        return chName;
    }

    public void setChName(String chName) {
        this.chName = chName == null ? null : chName.trim();
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName == null ? null : nickName.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getHometown() {
        return hometown;
    }

    public void setHometown(String hometown) {
        this.hometown = hometown == null ? null : hometown.trim();
    }

    public String getAddtress() {
        return addtress;
    }

    public void setAddtress(String addtress) {
        this.addtress = addtress == null ? null : addtress.trim();
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public String getMarriage() {
        return marriage;
    }

    public void setMarriage(String marriage) {
        this.marriage = marriage == null ? null : marriage.trim();
    }

    public String getChildren() {
        return children;
    }

    public void setChildren(String children) {
        this.children = children == null ? null : children.trim();
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree == null ? null : degree.trim();
    }

    public String getHouseStatus() {
        return houseStatus;
    }

    public void setHouseStatus(String houseStatus) {
        this.houseStatus = houseStatus == null ? null : houseStatus.trim();
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry == null ? null : industry.trim();
    }

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income == null ? null : income.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getReferee() {
        return referee;
    }

    public void setReferee(String referee) {
        this.referee = referee == null ? null : referee.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getDeclaration() {
        return declaration;
    }

    public void setDeclaration(String declaration) {
        this.declaration = declaration == null ? null : declaration.trim();
    }

    public String getAsk() {
        return ask;
    }

    public void setAsk(String ask) {
        this.ask = ask == null ? null : ask.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public String getWebSex() {
		return webSex;
	}

	public void setWebSex(String webSex) {
		this.webSex = webSex;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getFlagTemp() {
		return flagTemp;
	}

	public void setFlagTemp(String flagTemp) {
		this.flagTemp = flagTemp;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getAgeFrom() {
		return ageFrom;
	}

	public void setAgeFrom(String ageFrom) {
		this.ageFrom = ageFrom;
	}

	public String getAgeTo() {
		return ageTo;
	}

	public void setAgeTo(String ageTo) {
		this.ageTo = ageTo;
	}

	public Double getHeightFrom() {
		return heightFrom;
	}

	public void setHeightFrom(Double heightFrom) {
		this.heightFrom = heightFrom;
	}

	public Double getHeightTo() {
		return heightTo;
	}

	public void setHeightTo(Double heightTo) {
		this.heightTo = heightTo;
	}

	public String getLoca() {
		return loca;
	}

	public void setLoca(String loca) {
		this.loca = loca;
	}

	public List<Focus> getFocus() {
		return focus;
	}

	public void setFocus(List<Focus> focus) {
		this.focus = focus;
	}

	public String getBirthday2() {
		return birthday2;
	}

	public void setBirthday2(String birthday2) {
		this.birthday2 = birthday2;
	}

	public String getHometown2() {
		return hometown2;
	}

	public void setHometown2(String hometown2) {
		this.hometown2 = hometown2;
	}

	public Double getHeight2() {
		return height2;
	}

	public void setHeight2(Double height2) {
		this.height2 = height2;
	}

	public Double getWeight2() {
		return weight2;
	}

	public void setWeight2(Double weight2) {
		this.weight2 = weight2;
	}

	public String getMarriage2() {
		return marriage2;
	}

	public void setMarriage2(String marriage2) {
		this.marriage2 = marriage2;
	}

	public String getDegree2() {
		return degree2;
	}

	public void setDegree2(String degree2) {
		this.degree2 = degree2;
	}

	public String getHouseStatus2() {
		return houseStatus2;
	}

	public void setHouseStatus2(String houseStatus2) {
		this.houseStatus2 = houseStatus2;
	}

	public String getIncome2() {
		return income2;
	}

	public void setIncome2(String income2) {
		this.income2 = income2;
	}

	public String getEconomic() {
		return economic;
	}

	public void setEconomic(String economic) {
		this.economic = economic;
	}

	public String getLooks() {
		return looks;
	}

	public void setLooks(String looks) {
		this.looks = looks;
	}

	public String getDisposition() {
		return disposition;
	}

	public void setDisposition(String disposition) {
		this.disposition = disposition;
	}

	public String getLifeRole() {
		return lifeRole;
	}

	public void setLifeRole(String lifeRole) {
		this.lifeRole = lifeRole;
	}

	public String getLifeType() {
		return lifeType;
	}

	public void setLifeType(String lifeType) {
		this.lifeType = lifeType;
	}

	public String getNonType() {
		return nonType;
	}

	public void setNonType(String nonType) {
		this.nonType = nonType;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public Integer getInviteFlag() {
		return inviteFlag;
	}

	public void setInviteFlag(Integer inviteFlag) {
		this.inviteFlag = inviteFlag;
	}
	
	 public String getHometownProvince() {
			return hometownProvince;
		}

		public void setHometownProvince(String hometownProvince) {
			this.hometownProvince = hometownProvince;
		}

		public String getHometownCity() {
			return hometownCity;
		}

		public void setHometownCity(String hometownCity) {
			this.hometownCity = hometownCity;
		}

		public String getHometownCountry() {
			return hometownCountry;
		}

		public void setHometownCountry(String hometownCountry) {
			this.hometownCountry = hometownCountry;
		}

		public String getAddressProvince() {
			return addressProvince;
		}

		public void setAddressProvince(String addressProvince) {
			this.addressProvince = addressProvince;
		}

		public String getAddressCity() {
			return addressCity;
		}

		public void setAddressCity(String addressCity) {
			this.addressCity = addressCity;
		}

		public String getAddressCountry() {
			return addressCountry;
		}

		public void setAddressCountry(String addressCountry) {
			this.addressCountry = addressCountry;
		}

		public String getHeightQuery() {
			return heightQuery;
		}

		public void setHeightQuery(String heightQuery) {
			this.heightQuery = heightQuery;
		}

		public String getDisposition2() {
			return disposition2;
		}

		public void setDisposition2(String disposition2) {
			this.disposition2 = disposition2;
		}

		public String getCarStatus() {
			return carStatus;
		}

		public void setCarStatus(String carStatus) {
			this.carStatus = carStatus;
		}

		public String getCarStatus2() {
			return carStatus2;
		}

		public void setCarStatus2(String carStatus2) {
			this.carStatus2 = carStatus2;
		}

		public String getWx() {
			return wx;
		}

		public void setWx(String wx) {
			this.wx = wx;
		}

		public String getHobby() {
			return hobby;
		}

		public void setHobby(String hobby) {
			this.hobby = hobby;
		}

		public String getHobby2() {
			return hobby2;
		}

		public void setHobby2(String hobby2) {
			this.hobby2 = hobby2;
		}

		public String getWeekday() {
			return weekday;
		}

		public void setWeekday(String weekday) {
			this.weekday = weekday;
		}

		public String getWeekday2() {
			return weekday2;
		}

		public void setWeekday2(String weekday2) {
			this.weekday2 = weekday2;
		}

		public String getTravel() {
			return travel;
		}

		public void setTravel(String travel) {
			this.travel = travel;
		}

		public String getTravel2() {
			return travel2;
		}

		public void setTravel2(String travel2) {
			this.travel2 = travel2;
		}

		public Integer getAge1() {
			return age1;
		}

		public void setAge1(Integer age1) {
			this.age1 = age1;
		}

		public Integer getAge2() {
			return age2;
		}

		public void setAge2(Integer age2) {
			this.age2 = age2;
		}

		public Double getHeight1() {
			return height1;
		}

		public void setHeight1(Double height1) {
			this.height1 = height1;
		}

		public String getFrontImg() {
			return frontImg;
		}

		public void setFrontImg(String frontImg) {
			this.frontImg = frontImg;
		}

		public String getBackImg() {
			return backImg;
		}

		public void setBackImg(String backImg) {
			this.backImg = backImg;
		}

		public String getCustLoca() {
			return custLoca;
		}

		public void setCustLoca(String custLoca) {
			this.custLoca = custLoca;
		}
}