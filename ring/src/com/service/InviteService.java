package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.EvaluateMapper;
import com.dao.InviteMapper;
import com.model.Evaluate;
import com.model.Invite;

@Service
public class InviteService {

	@Autowired
	InviteMapper mapper;
	
	@Autowired
	EvaluateMapper evaluteMapper;


	public List<Invite> queryList(Invite invite, Pagination page) {
		return mapper.queryByWhere(invite , page);
	}
	
	public void insert(Invite invite) {
		mapper.insert(invite);
	}

	public void update(Invite invite) {
		mapper.updateByPrimaryKey(invite);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(Invite invite) {
		return mapper.queryTotal(invite);
	}

	public int checkUnique(String inviteNo) {
		//TODO
		return 0;
	}

	public List<Evaluate> queryDetialsById(Evaluate evaluate, Pagination page) {
		return evaluteMapper.queryByWhere(evaluate, page);
	}

	public int queryDetailsTotal(Evaluate evaluate) {
		return evaluteMapper.queryTotal(evaluate);
	}



}
