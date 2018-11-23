package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.SignType;

public interface SignTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SignType record);

    int insertSelective(SignType record);

    SignType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SignType record);

    int updateByPrimaryKey(SignType record);

	int queryTotal(SignType signType);

	List<SignType> queryByWhere(@Param("obj")SignType signType, @Param("page")Pagination page);
}