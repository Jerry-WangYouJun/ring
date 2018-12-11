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
import com.model.Dictionary;
import com.service.DictionaryService;


@Controller
@RequestMapping("/dic")
public class DictionaryController {
	 
	@Autowired
	DictionaryService service ;
	@Autowired
	DictionaryService dicService;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request  ) {
		String col = request.getParameter("col");
		String name=request.getParameter("name");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    Dictionary dic = new Dictionary();
	    dic.setCol(col);
	    dic.setName(name);
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Dictionary> list = service.queryList(dic , page );
		int total = service.queryTotal(dic );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/dic_edit")
	public Message  editDictionary(Dictionary dic , HttpSession session ){
		Message msg = new Message();
		try{
			if(dic.getId() != null  &&  dic.getId() > 0){
				service.update(dic);
			}else{
				service.insert(dic);
			}
			Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
			session.setAttribute("dic",   JSONObject.fromObject(dicMap));
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
	@RequestMapping("/dic_delete")
	public Message  deleteDictionary( Integer id  ){
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
	@RequestMapping("/dicMap")
	public Map getDicList() {
		return dicService.getDicMap();
	}
	
	@ResponseBody
	@RequestMapping("/dic_unique")
	public Message  uniqueDictionary( String name ){
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
