package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.Invite;

public interface InviteMapper {
	
	
    int deleteByPrimaryKey(Integer id);

    int insert(Invite record);

    int insertSelective(Invite record);

    Invite selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Invite record);

    int updateByPrimaryKey(Invite record);
    
    public List<Invite> queryByWhere(@Param("obj")Invite dic, @Param("page")Pagination page);
    public List<Invite> queryByCustId(@Param("obj")Invite dic, @Param("page")Pagination page);
	public int queryTotal(Invite record);

	public void refuseOther(Integer joinId);
}