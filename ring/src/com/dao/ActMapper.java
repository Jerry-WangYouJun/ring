package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.Act;

public interface ActMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Act record);

    int insertSelective(Act record);

    Act selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Act record);

    int updateByPrimaryKey(Act record);
    
    List<Act> queryByWhere(@Param("obj")Act customer,@Param("page")Pagination page);

	int queryTotal(Act record);

	Integer checkActOut(Integer id);

}