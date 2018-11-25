package com.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.CodeUtil;
import com.common.entry.Grid;
import com.common.entry.Message;
import com.common.entry.Pagination;
import com.model.Customer;
import com.model.Evaluate;
import com.model.Invite;
import com.model.InviteDetail;
import com.model.Location;
import com.model.User;
import com.pay.util.NoticeUtil;
import com.pay.util.WXAuthUtil;
import com.service.CustomerService;
import com.service.InviteDetailService;
import com.service.InviteService;
import com.service.LocationService;

import net.sf.json.JSONObject;


@Controller
@RequestMapping("/invite")
public class InviteController {
	 
	@Autowired
	InviteService service ;
	
	@Autowired
	InviteDetailService detailService ;
	
	@Autowired
	CustomerService custService;
	
	@Autowired
	LocationService locService ;
	
	@ResponseBody
	@RequestMapping("/query")
	public Grid  query( HttpServletResponse response, HttpServletRequest request  ,Invite invite ) {
		String score = request.getParameter("invite");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
//	    if(StringUtils.isNotBlank(score)){
//	    	invite.setInvite(Integer.valueOf(score));
//	    }
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Invite> list = service.queryList(invite , page );
		int total = service.queryTotal(invite );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/queryByCustId")
	public Grid  queryByCustId( HttpServletResponse response, HttpServletRequest request  ,Invite invite ) {
		String score = request.getParameter("invite");
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
//	    if(StringUtils.isNotBlank(score)){
//	    	invite.setInvite(Integer.valueOf(score));
//	    }
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Invite> list = service.queryByCustId(invite , page );
		int total = service.queryTotal(invite );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@ResponseBody
	@RequestMapping("/queryEvaluate")
	public Grid  queryDetail( HttpServletResponse response, HttpServletRequest request , Evaluate evaluate ) {
		String pageNo = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		Pagination page =  new Pagination(pageNo, pageSize) ;
	    CodeUtil.initPagination(page);
		List<Evaluate> list = service.queryDetialsById(evaluate , page );
		int total = service.queryDetailsTotal(evaluate );
		Grid grid = new Grid();
		grid.setRows(list);
		grid.setTotal((long)total);
		return grid;
	}
	
	@RequestMapping("/detail")
	public String queryDetails(String id , Model model){
		 model.addAttribute("id", id);
		 return "invite_detail_list";
	}
	

	@ResponseBody
	@RequestMapping("/invite_status")
	public Message  status(Invite invite , HttpServletRequest request ){
		Message msg = new Message();
		Customer cust = (Customer)request.getSession().getAttribute("customer");
		String status = invite.getInviteStates();
		invite = service.selectById(invite.getId());
		invite.setInviteStates(status);
		service.refuseOther(cust.getId());
		service.update(invite);
		return msg;
	}
	
	@RequestMapping("/update")
	public String  updateInfo(Integer id  , String inviteStates ){
		Invite invite  = service.selectById(id);
		if(!"2".equals(inviteStates)){
			invite.setInviteStates(inviteStates);
		}
		return "forward:/web/dating?id=" + id;
	}
	
	@RequestMapping("/state")
	public String  updateStates(Integer id  , String inviteStates , String remark ,HttpSession session) throws ClientProtocolException, IOException{
		Invite invite  = service.selectById(id);
		if(!"2".equals(inviteStates)){
			invite.setInviteStates(inviteStates);
		}
		if(StringUtils.isNotBlank(remark)){
			remark = new String(remark.getBytes("ISO-8859-1"),"UTF-8");
			invite.setRemark(remark);
		}
		service.update(invite);
		if("3".equals(inviteStates)){
			 JSONObject jsonObject = WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteRefuse(remark, invite.getCustomerFrom()));
		        System.out.println(jsonObject);
			return "forward:/web/info";
		}else if("2".equals(inviteStates)){
			return "forward:/web/dating?id=" + id;
		}else if("4".equals(inviteStates) || "6".equals(inviteStates) ){
			if("4".equals(inviteStates)) {
				 WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteAccept(invite.getPointLocation(), invite.getCustomerFrom()));
				 WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteAccept(invite.getPointLocation(), invite.getCustomerJoin()));
			}
			return "forward:/web/dateinfo";
		}if("5".equals(inviteStates)){
			 JSONObject jsonObject = WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteRefuse(remark, invite.getCustomerJoin()));
		        System.out.println(jsonObject);
			return "forward:/web/info";
		}else{
			Location loc =locService.selectById(invite.getPointId());
			Customer  cust =  (Customer) session.getAttribute("customer");
			if( cust.getId().equals(invite.getFromId()) ) {
				WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteUpdate(loc, invite.getCustomerJoin() , invite.getInviteDate()));
			 }else if(cust.getId().equals(invite.getJoinId())) {
				 WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteUpdate(loc, invite.getCustomerFrom() ,invite.getInviteDate()));
			 }
			return "forward:/web/info";
		}
	}
	
	@ResponseBody
	@RequestMapping("/invite_state")
	public Message  invite_state(Integer id , String inviteStates   ){
		Message msg = new Message();
		Invite invite = service.selectById(id);
		invite.setInviteStates(inviteStates);
		service.update(invite);
		msg.setMsg("操作成功");
		msg.setSuccess(true);
		return msg ;
	}
	
	@ResponseBody
	@RequestMapping("/signUp")
	public Message  signUp( HttpSession session ,Integer id  ){
		Customer  cust =  (Customer) session.getAttribute("customer");
		Message msg = new Message();
		Invite invite = service.selectById(id);
		if( cust.getId().equals(invite.getFromId()) ) {
			invite.getDetail().setSignFrom("1");
		 }else if(cust.getId().equals(invite.getJoinId())) {
			 invite.getDetail().setSignJoin("1");
		 }
		detailService.update(invite.getDetail());
		if("1".equals(invite.getDetail().getSignFrom()) && "1".equals(invite.getDetail().getSignJoin())){
			 invite.setInviteStates("7");
			 service.update(invite);
		}
		msg.setMsg("签到成功");
		msg.setSuccess(true);
		return msg ;
	}
	
	@ResponseBody
	@RequestMapping("/invite_edit")
	public Message  editInvite(Invite invite , HttpServletRequest request , String preDate , InviteDetail detail, HttpSession session   ){
		Message msg = new Message();
		try{
			if(invite.getId() != null  &&  invite.getId() > 0){
				Invite inviteTemp = service.selectById(invite.getId());
				inviteTemp.setPointId(invite.getPointId());
				InviteDetail detailTemp = detailService.selectById(inviteTemp.getId());
				if("4".equals(inviteTemp.getInviteStates())  ) {
					Customer  cust =  (Customer) session.getAttribute("customer");
					 if( cust.getId().equals(inviteTemp.getFromId())&&detailTemp.getUpdateTimes() <1 ) {
						  detailTemp.setUpdateTimes(detailTemp.getUpdateTimes() + 1);
					 }else if((cust.getId().equals(inviteTemp.getJoinId())&&detailTemp.getUpdateTimeJoin() <1) ){
						 detailTemp.setUpdateTimeJoin(detailTemp.getUpdateTimeJoin()+1);
					 }else {
						 msg.setSuccess(false);
						 msg.setMsg("操作失败：对不起您只有一次修改约会地点的机会。" );
						 return msg ;
					 }
				}
				if("1".equals(inviteTemp.getInviteStates())  ) {
					inviteTemp.setInviteStates("2");
				}
				service.update(inviteTemp);
				detailTemp.setPreDate(preDate);
				detailService.update(detailTemp);
				if("2".equals(inviteTemp.getInviteStates())) {
					 JSONObject jsonObject = WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteAccept(inviteTemp.getPointLocation(), inviteTemp.getCustomerFrom()));
					 System.out.println(jsonObject);
				}
				if("4".equals(inviteTemp.getInviteStates())) {
					 Location loc =locService.selectById(invite.getPointId());
					 Customer  cust =  (Customer) session.getAttribute("customer");
					 if( cust.getId().equals(invite.getFromId()) ) {
						 WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteUpdate(loc, inviteTemp.getCustomerJoin() , inviteTemp.getInviteDate()));
					 }else if(cust.getId().equals(invite.getJoinId())) {
						 WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteUpdate(loc, inviteTemp.getCustomerFrom() ,inviteTemp.getInviteDate()));
					 }
				}
			}else{
				User user =  (User)request.getSession().getAttribute("webUser");
				if(user.getId() > 0 ) {
					invite.setFromId(Integer.valueOf(user.getRemark()));
				}
				Customer cust =  custService.selectById(Integer.valueOf(user.getRemark()));
				Invite test = new Invite();
				test.setFromId(Integer.valueOf(user.getRemark()));
				test.setInviteStates("1");
				int inviteTemp = service.queryTotal(test);
					if( inviteTemp == 0) {
						invite.setInviteDate(new Date());
						invite.setInviteStates("1");
						service.insert(invite);
						custService.update(cust);
						detail.setInviteId(invite.getId());
						detail.setUpdateTimes(0);
						detail.setUpdateTimeJoin(0);
						detailService.insert(detail);
						Customer custJoin = custService.selectById(invite.getJoinId());
						JSONObject jsonObject = WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteInit(detail, custJoin.getOpenId()));
					    System.out.println(jsonObject);
					}else {
						msg.setSuccess(false);
						msg.setMsg("操作失败：有其他邀约尚在进行" );
						return msg ;
					}
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
	@RequestMapping("/invite_delete")
	public Message  deleteInvite( Integer id  ){
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
	@RequestMapping("/invite_unique")
	public Message  uniqueInvite( String name ){
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
