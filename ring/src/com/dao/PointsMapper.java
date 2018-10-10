package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.Points;

public interface PointsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Points record);

    int insertSelective(Points record);

    Points selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Points record);

    int updateByPrimaryKey(Points record);
    
    public List<Points> queryByWhere(@Param("obj")Points record, @Param("page")Pagination page);
    
   	public int queryTotal(Points record);
}