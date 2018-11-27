package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.Focus;

public interface FocusMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Focus record);

    int insertSelective(Focus record);

    Focus selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Focus record);

    int updateByPrimaryKey(Focus record);
    
    public List<Focus> queryByWhere(@Param("obj")Focus record, @Param("page")Pagination page);
    
   	public int queryTotal(Focus record);
}