package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.Location;
import com.model.Remind;

public interface RemindMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Remind record);

    int insertSelective(Remind record);

    Remind selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Remind record);

    int updateByPrimaryKey(Remind record);
    
    public List<Remind> queryByWhere(@Param("obj")Remind record, @Param("page")Pagination page);
    
 	public int queryTotal(Remind record);
    
}