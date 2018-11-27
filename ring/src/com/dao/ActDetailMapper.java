package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.ActDetail;

public interface ActDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ActDetail record);

    ActDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(ActDetail record);
    
    List<ActDetail> queryByWhere(@Param("obj")ActDetail customer,@Param("page")Pagination page);

	int queryTotal(ActDetail record);

}