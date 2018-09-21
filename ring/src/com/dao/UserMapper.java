package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.model.Packages;
import com.model.Pagination;
import com.model.User;



public interface UserMapper {

	public void insertData(Packages pac);
	
	public void delete( Integer id );
	
	public void update(Packages pac);
	
	public List<User> queryByWhere(@Param("obj")User user, @Param("page")Pagination page);

}