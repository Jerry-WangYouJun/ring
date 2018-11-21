package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.entry.Pagination;
import com.dao.CustomerMapper;
import com.model.Customer;

@Service
public class CustomerService {
	
	
	@Autowired
	CustomerMapper mapper;


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

	public int checkUnique(String customerNo) {
		//TODO
		return 0;
	}

	public Customer selectById(Integer id) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(id);
	}

	 	 
	
}	 
