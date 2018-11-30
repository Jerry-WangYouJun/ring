package com.model;

public class Article {
    private Integer id;
    
    private Integer custId;

    private String title;

    private String discrib;

    private String editorValue;

    private String author;

    private String articleImg;

    private String articleState;

    private String articleDate;

    private String articleType;

    private String articleTag;

    private Integer articleRead;

    private Integer articleTransmit;

    private Integer articleMark;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDiscrib() {
        return discrib;
    }

    public void setDiscrib(String discrib) {
        this.discrib = discrib == null ? null : discrib.trim();
    }

    public String getEditorValue() {
        return editorValue;
    }

    public void setEditorValue(String editorValue) {
        this.editorValue = editorValue == null ? null : editorValue.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getArticleImg() {
        return articleImg;
    }

    public void setArticleImg(String articleImg) {
        this.articleImg = articleImg == null ? null : articleImg.trim();
    }

    public String getArticleState() {
        return articleState;
    }

    public void setArticleState(String articleState) {
        this.articleState = articleState == null ? null : articleState.trim();
    }

    public String getArticleDate() {
    		
        return articleDate.length()>19 ?articleDate.substring(0, 19):articleDate;
    }

    public void setArticleDate(String articleDate) {
        this.articleDate = articleDate;
    }

    public String getArticleType() {
        return articleType;
    }

    public void setArticleType(String articleType) {
        this.articleType = articleType == null ? null : articleType.trim();
    }

    public String getArticleTag() {
        return articleTag;
    }

    public void setArticleTag(String articleTag) {
        this.articleTag = articleTag == null ? null : articleTag.trim();
    }

    public Integer getArticleRead() {
        return articleRead;
    }

    public void setArticleRead(Integer articleRead) {
        this.articleRead = articleRead;
    }

    public Integer getArticleTransmit() {
        return articleTransmit;
    }

    public void setArticleTransmit(Integer articleTransmit) {
        this.articleTransmit = articleTransmit;
    }

    public Integer getArticleMark() {
        return articleMark;
    }

    public void setArticleMark(Integer articleMark) {
        this.articleMark = articleMark;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public Integer getCustId() {
		return custId;
	}

	public void setCustId(Integer custId) {
		this.custId = custId;
	}
    
}