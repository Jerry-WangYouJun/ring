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
import com.common.entry.Grid;
import com.common.entry.Pagination;
import com.model.Message;
import com.model.User;
import com.service.MessageService;


@Controller
@RequestMapping("/message")
public class MessageController {
	 
	@Autowired
	MessageService service ;
	
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
	public com.common.entry.Message  editMessage(Message message ){
		com.common.entry.Message msg = new com.common.entry.Message();
		try{
			if(message.getId() != null  &&  message.getId() > 0){
				service.update(message);
			}else{
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
	
}
