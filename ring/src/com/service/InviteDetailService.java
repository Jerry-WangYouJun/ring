package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.EvaluateMapper;
import com.dao.InviteDetailMapper;
import com.model.Evaluate;
import com.model.InviteDetail;

@Service
public class InviteDetailService {

	@Autowired
	InviteDetailMapper mapper;
	
	@Autowired
	EvaluateMapper evaluteMapper;


	public void insert(InviteDetail invite) {
		mapper.insert(invite);
	}

	public void update(InviteDetail invite) {
		mapper.updateByPrimaryKey(invite);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}


	public List<Evaluate> queryDetialsById(Evaluate evaluate, Pagination page) {
		return evaluteMapper.queryByWhere(evaluate, page);
	}

	public int queryDetailsTotal(Evaluate evaluate) {
		return evaluteMapper.queryTotal(evaluate);
	}

	public InviteDetail selectById(Integer id) {
		// TODO Auto-generated method stub
		return mapper.selectByInviteId(id);
	}

}
