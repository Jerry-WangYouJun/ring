package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.DictionaryMapper;
import com.model.Dictionary;

@Service
public class DictionaryService {
	
	
	@Autowired
	DictionaryMapper mapper;


	public List<Dictionary> queryList(Dictionary dic, Pagination page) {
		return mapper.queryByWhere(dic , page);
	}
	
	public void insert(Dictionary dic) {
		mapper.insert(dic);
	}

	public void update(Dictionary dic) {
		mapper.updateByPrimaryKey(dic);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(Dictionary dic) {
		return mapper.queryTotal(dic);
	}

	public int checkUnique(String dicNo) {
		//TODO
		return 0;
	}

	public Map<String, Map<String, Dictionary>> getDicMap() {
		List<Dictionary>  dicList = mapper.queryByWhere(new Dictionary(),
				new Pagination( 1 , mapper.queryTotal(new Dictionary())));
		Map<String , Map<String, Dictionary>>  dicMap = new  HashMap<String, Map<String,Dictionary>>();
		for (Dictionary dictionary : dicList) {
			   if(dicMap.containsKey(dictionary.getCol())){
				      for (String column : dicMap.keySet() ) {
						    if(column.equals(dictionary.getCol())){
						    	dicMap.get(dictionary.getCol()).put(dictionary.getCode(), dictionary);
						    }
					}
			   }else{
				   Map<String, Dictionary> tempMap = new HashMap<String, Dictionary>();
				   tempMap.put(dictionary.getCode(), dictionary);
				   dicMap.put(dictionary.getCol(), tempMap);
			   }
		}
		return dicMap;
	}
	 	 
	
}	 
