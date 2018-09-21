package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CodeUtil;
import com.model.Grid;
import com.model.Pagination;
import com.model.User;
import com.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	 
	@Autowired
	UserService service ;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request  ,HttpSession session ) {
		String userName = request.getParameter("userName");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    User user = new User();
	    user.setUserName(userName);
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<User> list = service.queryList(user , page );
		int total = 9;
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@RequestMapping("/user_edit")
	public String  editUser(User user , HttpServletRequest request , HttpSession session){
		user = service.checkUser(user);
		if(user != null ){
			session.setAttribute("user", user);
			return "index" ;
		}else{
			request.setAttribute("msg", "用户名或者密码错误");
			return "login" ;
		}
	}
	
	@RequestMapping("/checkUser")
	public String checkUser(User user , HttpServletRequest request , HttpSession session){
		user = service.checkUser(user);
		if(user != null ){
			session.setAttribute("user", user);
			return "index" ;
		}else{
			request.setAttribute("msg", "用户名或者密码错误");
			return "login" ;
		}
	}
	
	@RequestMapping("/login")
	public String login(){
		return "pages/login";
	}
	
	@RequestMapping("/loginOut")
	public String logout(HttpSession session){
		session.removeAttribute("agentcode");
		session.removeAttribute("user");
		session.removeAttribute("groupId");
		session.removeAttribute("agentId");
		return "pages/login";
	}
	
}
