package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.common.CodeUtil;
import com.common.DateUtils;
import com.common.StringUtils;
import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.model.Customer;
import com.model.Focus;
import com.model.Image;
import com.model.User;
import com.pay.util.NoticeUtil;
import com.pay.util.WXAuthUtil;
import com.service.CustomerService;
import com.service.UserService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	 
	@Autowired
	CustomerService service ;
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request   ) {
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
	
	@RequestMapping("/updateInit")
	public String updateInit(Integer id , HttpServletRequest request) {
		Customer cust = service.selectById(id);
		request.setAttribute("mycust", cust);
		return "forward:/ring/register.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/cardimg")
	public Message uploadCardImg( MultipartFile file , MultipartFile upfile2 ) {
		Message msg = new Message();
		try {
				String prename = DateUtils.getDate14() ;
				String img = prename + "_" +  file.getOriginalFilename();
				if(file!=null){
					CodeUtil.SaveFileFromInputStream(file, new Image(img));
				}
				msg.setSuccess(true);
				msg.setMsg(img);
		}catch(Exception e) {
			 msg.setSuccess(false);
			 msg.setMsg("操作失败");
		}
		return msg ;
	}
	
	@ResponseBody
	@RequestMapping("/customer_edit")
	public Message  editCustomer(Customer customer  , HttpServletRequest request ,  HttpServletResponse response){
		Message msg = new Message();
		try{
			 customer.setFlag(customer.getFlagTemp());
			 customer.setLoca(customer.getCustLoca());
			if(customer.getId() != null  &&  customer.getId() > 0){
				service.update(customer);
				User user = userService.queryUserByTelephone(customer.getTelephone());
				user.setUserNo(customer.getTelephone());
				userService.update(user);
			}else{
				customer.setExamine("0");
				service.insert(customer);
				User user = new User();
				user.setUserNo(customer.getTelephone());
				user.setPwd("123");
				user.setRemark(customer.getOpenId());
				user.setUserName(customer.getChName());
				user.setRole("2");
				userService.insert(user);
		        JSONObject jsonObject = WXAuthUtil.sendTemplateMsg(NoticeUtil.registerSuccess(customer));
		        User admin = new User();
		        admin.setRole("11");
		        List<User> userList = userService.queryList(admin, new Pagination());
		        for(User u : userList){
		        	 	WXAuthUtil.sendTemplateMsg(NoticeUtil.registerReport(u , customer));
		        }
		        System.out.println(jsonObject);
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
	
	@RequestMapping("/customer_submit")
	public Message  customerAjax(Customer customer , MultipartFile upfile , MultipartFile upfile2  ){
		Message msg = new Message();
		try{
			 customer.setFlag(customer.getFlagTemp());
			if(customer.getId() != null  &&  customer.getId() > 0){
				service.update(customer);
			}else{
				customer.setExamine("0");
				service.insert(customer);
				
				if(StringUtils.isNotEmpty(customer.getOpenId())){
					User user = new User();
					user.setUserNo(customer.getTelephone());
					user.setPwd("123");
					user.setRemark(customer.getOpenId());
					user.setUserName(customer.getChName());
					user.setRole("2");
					userService.insert(user);
			        JSONObject jsonObject = WXAuthUtil.sendTemplateMsg(NoticeUtil.registerSuccess(customer));
			        User admin = new User();
			        admin.setRole("11");
			        List<User> userList = userService.queryList(admin, new Pagination());
			        for(User u : userList){
			        	 WXAuthUtil.sendTemplateMsg(NoticeUtil.registerReport(u , customer));
			        }
			        System.out.println(jsonObject);
				}
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
	@RequestMapping("/examine")
	public Message  examine( Integer id  , String state , String remark){
		Message msg = new Message();
		try{
			Customer cust = service.selectById(id);
			cust.setExamine(state);
			if(StringUtils.isNotEmpty(remark)){
				cust.setRemark(remark);
			}
			service.update(cust);
			 WXAuthUtil.sendTemplateMsg(NoticeUtil.registerNotice(null , cust));
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
	public Message  uniqueCustomer( String name , String colName ){
		Message msg = new Message();
		try{
			int num = service.checkUnique(name , colName);
			if(num > 0){
				msg.setSuccess(false);
				msg.setMsg("填写的信息有重复，请重新填写");
			}else{
				msg.setSuccess(true);
			}
		}catch(Exception e ){
			 msg.setSuccess(false);
			 msg.setMsg("操作失败：" + e.getMessage());
			 return msg ;
		} 
		return msg;
	}
	
	@RequestMapping("/insertFocus")
	public String insertFocus(Focus focus ,HttpServletRequest request ,HttpSession session ) {
		 Customer cust = (Customer)session.getAttribute("customer");
		 focus.setFromId(cust.getId());
		 service.insertFocus(focus);
		 return "forward:/web/customer?id=" + focus.getToId();
	}
	
	@RequestMapping("/deleteFocus")
	public String deleteFocus(Focus focus ) {
		 service.deleteFocus(focus.getId());
		 return "forward:/web/customer?id=" + focus.getToId();
	}
	
}
