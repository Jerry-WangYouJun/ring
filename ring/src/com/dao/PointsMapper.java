package com.dao;

import com.model.Points;

public interface PointsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Points record);

    int insertSelective(Points record);

    Points selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Points record);

    int updateByPrimaryKey(Points record);
}