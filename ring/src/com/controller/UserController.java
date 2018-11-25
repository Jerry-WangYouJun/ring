package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.model.Dictionary;
import com.model.User;
import com.pay.msg.Template;
import com.pay.msg.TemplateParam;
import com.service.DictionaryService;
import com.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	 
	@Autowired
	UserService service ;
	@Autowired
	DictionaryService dicService;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request  ) {
		String userName = request.getParameter("userName");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    User user = new User();
	    user.setUserName(userName);
		Pagination page =  new Pagination(pageNo, pageSize) ;
		List<User> list = service.queryList(user , page );
		int total = service.queryTotal(user );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/user_edit")
	public Message  editUser(User user ){
		Message msg = new Message();
		try{
			if(user.getId() != null  &&  user.getId() > 0){
				service.update(user);
			}else{
				user.setPwd("123456");
				service.insert(user);
			}
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
	@RequestMapping("/user_delete")
	public Message  deleteUser( Integer id  ){
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
	@RequestMapping("/user_unique")
	public Message  uniqueUser( String name ){
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
	
	@ResponseBody
	@RequestMapping("/reset")
	public Message  resetPwd(User user ){
		Message msg = new Message();
		try{
			if(user.getId() != null  &&  user.getId() > 0){
				user.setPwd("123456");
				service.update(user);
			}
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
	@RequestMapping("/pwd")
	public Message  uploadPwd(String pwd , HttpSession session){
		Message msg = new Message();
		try{
			User user = (User)session.getAttribute("user");
			if(user.getId() != null  &&  user.getId() > 0){
				user.setPwd(pwd);
				service.update(user);
			}
			msg.setSuccess(true);
			msg.setMsg("操作成功");
		}catch(Exception e ){
			 msg.setSuccess(false);
			 msg.setMsg("操作失败：" + e.getMessage());
			 return msg ;
		} 
		return msg;
	}
	
	@RequestMapping("/checkUser")
	public String checkUser(User user , HttpServletRequest request , HttpSession session){
		user = service.checkUser(user);
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		if(user.getId() != null  && user.getId()>0){
			session.setAttribute("user", user);
			session.setAttribute("dic",   JSONObject.fromObject(dicMap));
			return "index" ;
		}else{
			request.setAttribute("msg", "用户名或者密码错误");
			return "login" ;
		}
	}
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/loginOut")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		session.removeAttribute("dic");
		return "login";
	}
	
}
