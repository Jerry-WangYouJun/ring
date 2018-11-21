package com.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.entry.Message;
import com.common.entry.Pagination;
import com.model.Customer;
import com.model.Invite;
import com.model.Location;
import com.model.User;
import com.service.CustomerService;
import com.service.InviteService;
import com.service.LocationService;
import com.service.UserService;

@Controller
@RequestMapping("/web")
public class WebController {

	@Autowired
	UserService service ;
	
	@Autowired
	CustomerService custService;
	@Autowired
	LocationService locService;
	@Autowired
	InviteService inviteService;
	
	@ResponseBody
	@RequestMapping("/login")
	public Message login( HttpSession session , User user) {
		user = service.checkUser(user);
		Message msg = new Message();
		if(user.getId() != null  && user.getId()>0) {
			session.setAttribute("webUser", user);
			Customer cust = custService.selectById(Integer.valueOf(user.getRemark()));
			session.setAttribute("customer", cust);
			msg.setSuccess(true);
			msg.setMsg("登陆成功");
			return msg;
		}else {
			msg.setSuccess(false);
			msg.setMsg("用户名或密码错误");
			return msg;
		}
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest  request  ) {
		User  user = (User)request.getSession().getAttribute("webUser");
		Customer cust = new Customer();
		List<Customer> list  = new ArrayList<>();
		
		if(StringUtils.isNotBlank(user.getRemark())) {
			Customer c =  custService.selectById(Integer.valueOf(user.getRemark()));
			cust.setWebSex(c.getSex());
		}
		list= custService.queryList(cust, new Pagination());
		request.setAttribute("list", list);
		return "forward:/ring/index.jsp";
	}
	
	@RequestMapping("/customer")
	public String customer(HttpServletRequest  request , Integer id ) {
		Customer cust = custService.selectById(id);
		request.setAttribute("cust", cust);
		return "forward:/ring/view_profile.jsp";
	}
	
	@RequestMapping("/inviteInit")
	public String invite(HttpServletRequest request , Invite invite ) {
		List<Location> locList= locService.queryList(new Location(), new Pagination());
		String[] time = {"周六","周日","周一~五下班","其他时间"};
		request.setAttribute("times", Arrays.asList(time));
		List<String> loc = new ArrayList<>();
		for (Location  obj : locList) {
			 if(!loc.contains(obj.getLocName())) {
				  loc.add(obj.getLocName());
			 }
		}
		request.setAttribute("joinId", invite.getJoinId());
		request.setAttribute("locList", loc);
		return "forward:/ring/dating.jsp";
	}
	
	@RequestMapping("/accept")
	public String accept(HttpServletRequest request , Invite invite ) {
		Invite invite2 = inviteService.selectById(invite.getId());
		request.setAttribute("joinId", invite.getJoinId());
		request.setAttribute("inv", invite2);
		return "forward:/ring/dating.jsp";
	}
}
