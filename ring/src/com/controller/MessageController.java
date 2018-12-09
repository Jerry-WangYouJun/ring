package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CodeUtil;
import com.common.entry.Grid;
import com.common.entry.Pagination;
import com.model.Message;
import com.model.User;
import com.pay.util.NoticeUtil;
import com.pay.util.WXAuthUtil;
import com.service.MessageService;
import com.service.UserService;


@Controller
@RequestMapping("/message")
public class MessageController {
	 
	@Autowired
	MessageService service ;
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request  , HttpSession session ) {
		String col = request.getParameter("col");
		User user = (User)session.getAttribute("user");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    Message message = new Message();
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Message> list = service.queryList(message , page );
		int total = service.queryTotal(message );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/remind_edit")
	public com.common.entry.Message  editMessage(Message message ,HttpSession session ){
		com.common.entry.Message msg = new com.common.entry.Message();
		User user = (User)session.getAttribute("webUser");
		try{
			message.setMsgDate(new Date());
			if(message.getId() != null  &&  message.getId() > 0){
				service.update(message);
			}else{
				message.setFromId(Integer.valueOf(user.getRemark()));
				message.setMsgDate(new Date());
				message.setRemark("0");
				service.insert(message);
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
	@RequestMapping("/remind_delete")
	public com.common.entry.Message  deleteMessage( Integer id  ){
		com.common.entry.Message msg =new com.common.entry.Message();
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
	@RequestMapping("/remind_unique")
	public com.common.entry.Message  uniqueMessage( String name ){
		com.common.entry.Message msg = new com.common.entry.Message();
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
	
	@RequestMapping("/examine")
	public String  examine(Integer id ,HttpServletRequest request){
		Message msg = service.selectByPrimaryKey(id);
		request.setAttribute("msg", msg);
		return "forward:/ring/message.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/updateState")
	public com.common.entry.Message  updateState(Integer id ,HttpServletRequest request){
		com.common.entry.Message m = new com.common.entry.Message();
		Message msg = service.selectByPrimaryKey(id);
		msg.setRemark("通过");
		m.setMsg("审核成功");
		m.setSuccess(true);
		try {
			WXAuthUtil.sendTemplateMsg(NoticeUtil.msgSuccess(null ,msg.getCustomerFrom(), msg));
			WXAuthUtil.sendTemplateMsg(NoticeUtil.msgSuccess(null ,msg.getCustomerFrom(), msg));
		} catch (Exception e) {
			m.setMsg("审核失败：" + e.getMessage());
			m.setSuccess(false);
		}
		return m;
	}
}
