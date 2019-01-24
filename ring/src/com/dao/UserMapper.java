package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.common.entry.Pagination;
import com.model.Packages;
import com.model.User;



public interface UserMapper {

	public void insertData(Packages pac);
	
	
	public List<User> queryByWhere(@Param("obj")User user, @Param("page")Pagination page);
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);


	public int queryTotal(User record);


	public User queryUserByTelephone(String telephone);

}