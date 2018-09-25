package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.DictionaryMapper;
import com.model.Dictionary;

@Service
public class DictionaryService {
	
	
	@Autowired
	DictionaryMapper mapper;


	public List<Dictionary> queryList(Dictionary user, Pagination page) {
		return mapper.queryByWhere(user , page);
	}
	
	public void insert(Dictionary user) {
		mapper.insert(user);
	}

	public void update(Dictionary user) {
		mapper.updateByPrimaryKey(user);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(Dictionary user) {
		return mapper.queryTotal(user);
	}

	public int checkUnique(String userNo) {
		//TODO
		return 0;
	}
	 	 
	
}	 
