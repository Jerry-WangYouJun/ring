package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CodeUtil;
import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.model.Customer;
import com.service.CustomerService;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	 
	@Autowired
	CustomerService service ;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request  ) {
		String cname = request.getParameter("cname");
		String nickName = request.getParameter("nickName");
		String sex = request.getParameter("sex");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    Customer customer = new Customer();
	    customer.setChName(cname);
	    customer.setNickName(nickName);
	    customer.setSex(sex);
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Customer> list = service.queryList(customer , page );
		int total = service.queryTotal(customer );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/customer_edit")
	public Message  editCustomer(Customer customer ){
		Message msg = new Message();
		try{
			 customer.setFlag(customer.getFlagTemp());
			if(customer.getId() != null  &&  customer.getId() > 0){
				service.update(customer);
			}else{
				service.insert(customer);
			}
			msg.setSuccess(true);
			msg.setMsg("操作成功");
		}catch(Exception e ){
			 e.getStackTrace();
			 msg.setSuccess(false);
			 msg.setMsg("操作失败：" + e.getMessage());
			 return msg ;
		} 
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/customer_delete")
	public Message  deleteCustomer( Integer id  ){
		Message msg = new Message();
		try{
			service.delete(id);
			msg.setSuccess(true);
			msg.setMsg("操作成功");
		}catch(Exception e ){
			 msg.setSuccess(false);
			 msg.setMsg("操作失败：" + e.getMessage());
			 return msg ;
		} 
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/customer_unique")
	public Message  uniqueCustomer( String name ){
		Message msg = new Message();
		try{
			int num = service.checkUnique(name);
			if(num > 0){
				msg.setSuccess(false);
				msg.setMsg("用户名重复");
			}
		}catch(Exception e ){
			 msg.setSuccess(false);
			 msg.setMsg("操作失败：" + e.getMessage());
			 return msg ;
		} 
		return msg;
	}
	
}
