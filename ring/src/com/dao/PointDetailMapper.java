package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.PointDetail;

public interface PointDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PointDetail record);

    int insertSelective(PointDetail record);

    PointDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PointDetail record);

    int updateByPrimaryKey(PointDetail record);
    
    public List<PointDetail> queryByWhere(@Param("obj")PointDetail record, @Param("page")Pagination page);
    
   	public int queryTotal(PointDetail record);
}