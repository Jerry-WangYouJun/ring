package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.MessageMapper;
import com.model.Message;

@Service
public class MessageService {

	
	@Autowired
	MessageMapper msgMapper;


	public List<Message> queryList(Message msg, Pagination page) {
		return msgMapper.queryByWhere(msg , page);
	}
	
	public void insert(Message msg) {
		msgMapper.insert(msg);
	}

	public void update(Message msg) {
		msgMapper.updateByPrimaryKey(msg);
		
	}

	public void delete(Integer id) {
		msgMapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(Message msg) {
		return msgMapper.queryTotal(msg);
	}

	public int checkUnique(String inviteNo) {
		//TODO
		return 0;
	}


	public int queryDetailsTotal(Message msg) {
		return msgMapper.queryTotal(msg);
	}

	 public Message selectByPrimaryKey(Integer id){
		 return msgMapper.selectByPrimaryKey(id);
	 }

}
