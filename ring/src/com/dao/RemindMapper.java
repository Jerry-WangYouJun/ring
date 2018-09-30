package com.dao;

import com.model.Remind;

public interface RemindMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Remind record);

    int insertSelective(Remind record);

    Remind selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Remind record);

    int updateByPrimaryKey(Remind record);
}