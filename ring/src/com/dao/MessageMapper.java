package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
    
 public List<Message> queryByWhere(@Param("obj")Message record, @Param("page")Pagination page);
    
   	public int queryTotal(Message record);
}