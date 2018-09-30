package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.LocationMapper;
import com.model.Location;

@Service
public class LocationService {
	
	
	@Autowired
	LocationMapper mapper;


	public List<Location> queryList(Location location, Pagination page) {
		return mapper.queryByWhere(location , page);
	}
	
	public void insert(Location location) {
		mapper.insert(location);
	}

	public void update(Location location) {
		mapper.updateByPrimaryKey(location);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(Location location) {
		return mapper.queryTotal(location);
	}

	public int checkUnique(String locationNo) {
		//TODO
		return 0;
	}


	 	 
	
}	 
