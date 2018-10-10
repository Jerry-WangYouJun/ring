package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.PointsMapper;
import com.model.Points;

@Service
public class PointService {

	@Autowired
	PointsMapper mapper;


	public List<Points> queryList(Points remind, Pagination page) {
		return mapper.queryByWhere(remind , page);
	}
	
	public void insert(Points remind) {
		mapper.insert(remind);
	}

	public void update(Points remind) {
		mapper.updateByPrimaryKey(remind);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(Points remind) {
		return mapper.queryTotal(remind);
	}

	public int checkUnique(String remindNo) {
		//TODO
		return 0;
	}


}
