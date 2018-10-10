package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CodeUtil;
import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.model.Points;
import com.service.PointService;


@Controller
@RequestMapping("/point")
public class PointController {
	 
	@Autowired
	PointService service ;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  query( HttpServletResponse response, HttpServletRequest request  ) {
		String score = request.getParameter("point");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    Points point = new Points();
	    if(StringUtils.isNotBlank(score)){
	    	point.setPoint(Integer.valueOf(score));
	    }
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Points> list = service.queryList(point , page );
		int total = service.queryTotal(point );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/queryDetail")
	public Grid  queryDetail( HttpServletResponse response, HttpServletRequest request  ) {
		String id = request.getParameter("id");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    Points point = new Points();
	    if(StringUtils.isNotBlank(id)){
	    	point.setId(Integer.valueOf(id));
	    }
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Points> list = service.queryList(point , page );
		int total = service.queryTotal(point );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@RequestMapping("/detail")
	public String queryDetails(String id , Model model){
		 model.addAttribute("id", id);
		 return "point_detail_list";
	}
	
	@ResponseBody
	@RequestMapping("/point_edit")
	public Message  editPoint(Points point ){
		Message msg = new Message();
		try{
			if(point.getId() != null  &&  point.getId() > 0){
				service.update(point);
			}else{
				service.insert(point);
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
	@RequestMapping("/point_delete")
	public Message  deletePoint( Integer id  ){
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
	@RequestMapping("/point_unique")
	public Message  uniquePoint( String name ){
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
