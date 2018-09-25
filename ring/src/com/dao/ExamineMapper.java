package com.dao;

import com.model.Examine;

public interface ExamineMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Examine record);

    int insertSelective(Examine record);

    Examine selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Examine record);

    int updateByPrimaryKey(Examine record);
}