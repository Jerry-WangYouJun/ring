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

import com.common.CodeUtil;
import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.dao.ArticleMapper;
import com.model.Article;
import com.model.Customer;
import com.model.Dictionary;
import com.model.User;
import com.service.DictionaryService;


@Controller
@RequestMapping("/article")
public class ArticleController {
	 
	@Autowired
	ArticleMapper service ;
	
	@Autowired
	DictionaryService dicService;
	
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  queryTest( HttpServletResponse response, HttpServletRequest request  ) {
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
	    Article article = new Article();
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Article> list = service.queryByWhere(article , page );
		int total = service.queryTotal(article );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/article_edit")
	public Message  editArticle(Article article , HttpServletRequest request ){
		Message msg = new Message();
		try{
			if(article.getId() != null  &&  article.getId() > 0){
				service.updateByPrimaryKey(article);
			}else{
				User user = (User)request.getSession().getAttribute("webUser");
				article.setCustId(Integer.valueOf(user.getRemark()));
				if("1".equals(user.getRole())) {
					article.setArticleState("1");
				}else {
					article.setArticleState("0");
				}
				service.insert(article);
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
	@RequestMapping("/article_delete")
	public Message  deleteArticle( Integer id  ){
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
	@RequestMapping("/article_unique")
	public Message  uniqueArticle( String name ){
		Message msg = new Message();
		try{
			Article article = new Article();
			int total = service.queryTotal(article );
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
		return "forward:/ring/article/article.jsp";
	}
	
	@RequestMapping("/index")
	public String articleIndex(HttpServletRequest  request , HttpSession session ,String openId ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		List<Article> articleList = service.queryByWhere(new Article(), new Pagination());
		request.setAttribute("articleList", articleList);
		return "forward:/ring/article/main.jsp";
	}
	
	@RequestMapping("/myArticle")
	public String myArticle(HttpServletRequest  request , HttpSession session ,String openId ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		Article article = new Article();
		Customer cust = (Customer)session.getAttribute("customer");
		article.setCustId(cust.getId());
		List<Article> articleList = service.queryByWhere(article, new Pagination());
		request.setAttribute("articleList", articleList);
		return "forward:/ring/article/main.jsp";
	}

	@RequestMapping("/detail")
	public String articledetail(HttpServletRequest  request , HttpSession session ,Integer id ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		Article article = service.selectByPrimaryKey(id);
		User user = (User)session.getAttribute("webUser");
		request.setAttribute("article", article);
		return "forward:/ring/article/detail.jsp";
	}
	
}
