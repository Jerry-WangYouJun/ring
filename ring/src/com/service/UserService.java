package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.UserDao;
import com.dao.UserMapper;
import com.model.User;

@Service
public class UserService {
	
	@Autowired
	UserDao  dao ;
	
	@Autowired
	UserMapper mapper;

	public User checkUser(User user) {
		
		return dao.checkUser(user);
	}

	public List<User> queryList(User user, Pagination page) {
		return mapper.queryByWhere(user , page);
	}
	
	public void insert(User user) {
		mapper.insert(user);
	}

	public void update(User user) {
		mapper.updateByPrimaryKey(user);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(User user) {
		return mapper.queryTotal(user);
	}

	public int checkUnique(String userNo) {
		return dao.checkUnique(userNo);
	}
	 	 
	public User queryUserById(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}
	
	public Integer queryInviteState(Integer id) {
		return dao.checkInviteState(id);
	}
	
}	 
