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
import com.model.Remind;
import com.service.RemindService;


@Controller
@RequestMapping("/remind")
public class RemindController {
	 
	@Autowired
	RemindService service ;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request  ) {
		String col = request.getParameter("col");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    Remind remind = new Remind();
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Remind> list = service.queryList(remind , page );
		int total = service.queryTotal(remind );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/remind_edit")
	public Message  editRemind(Remind remind ){
		Message msg = new Message();
		try{
			if(remind.getId() != null  &&  remind.getId() > 0){
				service.update(remind);
			}else{
				service.insert(remind);
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
	public Message  deleteRemind( Integer id  ){
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
	@RequestMapping("/remind_unique")
	public Message  uniqueRemind( String name ){
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
