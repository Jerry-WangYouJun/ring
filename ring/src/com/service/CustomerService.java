package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.CustomerMapper;
import com.dao.FocusMapper;
import com.model.Customer;
import com.model.Focus;

@Service
public class CustomerService {
	
	
	@Autowired
	CustomerMapper mapper;
	
	@Autowired
	FocusMapper focusMapper;


	public List<Customer> queryList(Customer customer, Pagination page) {
		return mapper.queryByWhere(customer , page);
	}
	
	public void insert(Customer customer) {
		mapper.insert(customer);
	}

	public void update(Customer customer) {
		mapper.updateByPrimaryKey(customer);
		
	}

	public void delete(Integer id) {
		mapper.deleteByPrimaryKey(id);
	}

	public int queryTotal(Customer customer) {
		return mapper.queryTotal(customer);
	}

	public int checkUnique(String customerNo , String colName) {
		Customer cust = new Customer();
		if("chName".equals(colName)){
			cust.setChName(customerNo);
		}
		if("nickName".equals(colName)){
			cust.setNickName(customerNo);
		}
		return mapper.queryTotal(cust);
	}

	public Customer selectById(Integer id) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(id);
	}

	public List<Focus> queryFocusByWhere(Focus focus , Pagination pagination){
		return focusMapper.queryByWhere(focus, pagination);
	}
	
	public Integer insertFocus(Focus focus ) {
		 return focusMapper.insert(focus);
	}
	
	public Integer deleteFocus(Integer id) {
		return focusMapper.deleteByPrimaryKey(id);
	}
}	 
