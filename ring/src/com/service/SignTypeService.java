package com.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.SignTypeMapper;
import com.model.SignType;

@Service
public class SignTypeService {


	@Autowired
	SignTypeMapper mapper;


	public List<SignType> queryList(SignType signType, Pagination page) {
		return mapper.queryByWhere(signType , page);
	}
	
	public void insert(SignType signType) {
		mapper.insert(signType);
	}

	public void update(SignType signType) {
		mapper.updateByPrimaryKey(signType);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(SignType signType) {
		return mapper.queryTotal(signType);
	}

	public int checkUnique(String signTypeNo) {
		//TODO
		return 0;
	}


	 
}
