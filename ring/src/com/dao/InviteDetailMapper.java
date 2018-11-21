package com.dao;

import com.model.InviteDetail;

public interface InviteDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(InviteDetail record);

    int insertSelective(InviteDetail record);

    InviteDetail selectByPrimaryKey(Integer id);
    
    InviteDetail selectByInviteId(Integer id);

    int updateByPrimaryKeySelective(InviteDetail record);

    int updateByPrimaryKey(InviteDetail record);
}