package com.controller;

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

import com.common.CodeUtil;
import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.dao.ActMapper;
import com.model.Act;
import com.model.Dictionary;
import com.model.User;
import com.service.DictionaryService;


@Controller
@RequestMapping("/act")
public class ActController {
	 
	@Autowired
	ActMapper service ;
	
	@Autowired
	DictionaryService dicService;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request  ) {
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    Act act = new Act();
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Act> list = service.queryByWhere(act , page );
		int total = service.queryTotal(act );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/act_edit")
	public Message  editAct(Act act , HttpServletRequest request ){
		Message msg = new Message();
		try{
			if(act.getId() != null  &&  act.getId() > 0){
				service.updateByPrimaryKey(act);
			}else{
				User user = (User)request.getSession().getAttribute("webUser");
				act.setCustId(Integer.valueOf(user.getRemark()));
				service.insert(act);
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
	@RequestMapping("/act_delete")
	public Message  deleteAct( Integer id  ){
		Message msg = new Message();
		try{
			service.deleteByPrimaryKey(id);
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
	@RequestMapping("/act_unique")
	public Message  uniqueAct( String name ){
		Message msg = new Message();
		try{
			Act act = new Act();
			int total = service.queryTotal(act );
			if(total > 0){
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
	
	@RequestMapping("/init")
	public String register(HttpServletRequest  request , HttpSession session ,String openId ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		return "forward:/ring/activity/activity.jsp";
	}
	
	@RequestMapping("/index")
	public String actIndex(HttpServletRequest  request , HttpSession session ,String openId ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		List<Act> actList = service.queryByWhere(new Act(), new Pagination());
		request.setAttribute("actList", actList);
		return "forward:/ring/activity/main.jsp";
	}
	
	
}
