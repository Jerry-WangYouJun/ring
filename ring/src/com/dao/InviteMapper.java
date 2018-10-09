package com.dao;

import com.model.Invite;

public interface InviteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Invite record);

    int insertSelective(Invite record);

    Invite selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Invite record);

    int updateByPrimaryKey(Invite record);
}