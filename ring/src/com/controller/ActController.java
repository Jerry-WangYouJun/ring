package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CodeUtil;
import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.dao.ActDetailMapper;
import com.dao.ActMapper;
import com.model.Act;
import com.model.ActDetail;
import com.model.Customer;
import com.model.Dictionary;
import com.model.User;
import com.service.DictionaryService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/act")
public class ActController {
	 
	@Autowired
	ActMapper service ;
	
	@Autowired
	DictionaryService dicService;
	
	@Autowired
	ActDetailMapper detailMapper;
	
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
				if("1".equals(user.getRole())) {
					act.setActState("1");
				}else {
					act.setActState("0");
				}
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
	
	@RequestMapping("/myAct")
	public String myAct(HttpServletRequest  request , HttpSession session ,String openId ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		Act act = new Act();
		Customer cust = (Customer)session.getAttribute("customer");
		act.setCustId(cust.getId());
		List<Act> actList = service.queryByWhere(act, new Pagination());
		request.setAttribute("actList", actList);
		return "forward:/ring/activity/main.jsp";
	}
	
	@RequestMapping("/joinAct")
	public String joinAct(HttpServletRequest  request , HttpSession session ,String openId ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		ActDetail actDetail = new ActDetail();
		Customer cust = (Customer)session.getAttribute("customer");
		actDetail.setCustId(cust.getId());
		List<ActDetail> detailList =  detailMapper.queryByWhere(actDetail, new Pagination());
		List<Act> actList = new ArrayList<>();
		for(ActDetail detail : detailList) {
			if(detail.getAct() != null) {
				actList.add(detail.getAct());
			}
		}
		request.setAttribute("actList", actList);
		return "forward:/ring/activity/main.jsp";
	}

	@RequestMapping("/detail")
	public String actdetail(HttpServletRequest  request , HttpSession session ,Integer id ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		Act act = service.selectByPrimaryKey(id);
		User user = (User)session.getAttribute("webUser");
		ActDetail detail = new ActDetail() ;
		detail.setActId(id);
		if(act.getCustId().equals(Integer.valueOf(user.getRemark()) )) {
			List<ActDetail> detailList = detailMapper.queryByWhere(detail, new Pagination());
			request.setAttribute("detailList", detailList);
			request.setAttribute("act", act);
			return "forward:/ring/activity/detail_admin.jsp";
		}else {
			detail.setCustId(Integer.valueOf(user.getRemark()));
			List<ActDetail> detailList = detailMapper.queryByWhere(detail, new Pagination());
			if(detailList!=null && detailList.size() > 0) {
				act.setDetail(detailList.get(0)); 
			}
			request.setAttribute("act", act);
			return "forward:/ring/activity/detail.jsp";
		}
	}
	
	@RequestMapping("/addDetail")
	public String addDetail(HttpServletRequest  request , HttpSession session ,Integer actId ) {
		User user = (User)session.getAttribute("webUser");
		ActDetail detail = new ActDetail() ;
		Act act = service.selectByPrimaryKey(actId);
		detail.setActId(actId);
		detail.setDetailState("6");
		int times = detailMapper.queryTotal(detail);
		if(times ==3 ) {
			 request.setAttribute("msg", "您已经三次爽约，不能在报名参加活动");
		}else if(times ==2 && !"1".equals(act.getAdmin())){
			request.setAttribute("msg", "您已经两次次爽约，只参加活动无名指之约官方组织的活动");
		}else {
			detail.setDetailState("1");
			detail.setCustId(Integer.valueOf(user.getRemark()));
			detailMapper.insert(detail);
		}
		return "forward:/act/detail?id=" + actId;
	}
	
	@RequestMapping("/updateDetail")
	public String updateDetail(HttpServletRequest  request , HttpSession session ,Integer id ,  String state ) {
		ActDetail detail = detailMapper.selectByPrimaryKey(id);
		detail.setDetailState(state);
		detailMapper.updateByPrimaryKey(detail);
		return "forward:/act/detail?id=" + detail.getActId();
	}
	
	@RequestMapping("/updateDetailAdmin")
	public String updateDetailAdmin(HttpServletRequest  request , HttpSession session ,ActDetail detail) {
		detailMapper.updateByPrimaryKey(detail);
		return "forward:/act/detail?id=" + detail.getActId();
	}
	
}
