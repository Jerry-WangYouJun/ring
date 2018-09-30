package com.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.RemindMapper;
import com.model.Remind;

@Service
public class RemindService {


	@Autowired
	RemindMapper mapper;


	public List<Remind> queryList(Remind remind, Pagination page) {
		return mapper.queryByWhere(remind , page);
	}
	
	public void insert(Remind remind) {
		mapper.insert(remind);
	}

	public void update(Remind remind) {
		mapper.updateByPrimaryKey(remind);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(Remind remind) {
		return mapper.queryTotal(remind);
	}

	public int checkUnique(String remindNo) {
		//TODO
		return 0;
	}


	 
}
