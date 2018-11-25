package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CodeUtil;
import com.common.DateUtils;
import com.common.StringUtils;
import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.model.Customer;
import com.model.User;
import com.pay.msg.Template;
import com.pay.msg.TemplateParam;
import com.pay.util.WXAuthUtil;
import com.service.CustomerService;
import com.service.UserService;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	 
	@Autowired
	CustomerService service ;
	@Autowired
	UserService userService;
	
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
				if(StringUtils.isNotEmpty(customer.getOpenId())){
					User user = new User();
					user.setUserNo(customer.getOpenId());
					user.setPwd("123");
					user.setRemark(customer.getId()+"");
					user.setUserName(customer.getChName());
					user.setRole("2");
					userService.insert(user);
					String tplId = "d8w35wAWCN9cCxpcVZmtDPVWgERECjKJG6ItCZiBkYM";
			        Template tem=new Template();  
			        tem.setTemplateId(tplId);  
			        tem.setTopColor("#000000");  
			                  
			        List<TemplateParam> paras=new ArrayList<TemplateParam>();  
			        paras.add(new TemplateParam("first","注册成功。","#333"));  
			        paras.add(new TemplateParam("keyword1",customer.getChName(),"#333"));
			        paras.add(new TemplateParam("keyword2", DateUtils.getToday(),"#333"));
			        paras.add(new TemplateParam("keyword3","微信","#333"));
			        paras.add(new TemplateParam("remark","感谢你对无名指之约的支持!!!","#333"));  
			                  
			        tem.setTemplateParamList(paras);  
			        tem.setToUser(customer.getOpenId());//用户openid
			        //设置超链接
			        tem.setUrl("http://localhost/web/index");  
			        JSONObject jsonObject = WXAuthUtil.sendTemplateMsg(tem);
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
