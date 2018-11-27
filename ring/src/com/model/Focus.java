package com.model;

/**
 * 评价信息
 * @author Administrator
 *
 */
public class Focus {
    private Integer id;
    
    private Integer fromId;

    private Integer toId;

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

}