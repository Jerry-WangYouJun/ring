package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.entry.Message;
import com.common.entry.Pagination;
import com.dao.ActMapper;
import com.dao.ArticleMapper;
import com.dao.EvaluateMapper;
import com.dao.UserDao;
import com.model.Act;
import com.model.Article;
import com.model.Customer;
import com.model.Dictionary;
import com.model.Evaluate;
import com.model.Focus;
import com.model.Invite;
import com.model.InviteDetail;
import com.model.Location;
import com.model.User;
import com.pay.util.NoticeUtil;
import com.pay.util.WXAuthUtil;
import com.sendMail.EmailSendService;
import com.service.CustomerService;
import com.service.DictionaryService;
import com.service.InviteDetailService;
import com.service.InviteService;
import com.service.LocationService;
import com.service.MessageService;
import com.service.UserService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/web")
public class WebController {

	@Autowired
	UserService service ;
	
	@Autowired
	CustomerService custService;
	@Autowired
	LocationService locService;
	@Autowired
	InviteService inviteService;
	@Autowired
	InviteDetailService inviteDetaiService;
	@Autowired
	EvaluateMapper evaluateMapper;
	@Autowired
	DictionaryService dicService;
	@Autowired
	EmailSendService emailService;
	@Autowired
	UserDao  dao ;
	@Autowired
	MessageService msgService;
	@Autowired
	ArticleMapper articleMapper ;
	@Autowired
	ActMapper  actMapper;
	@Autowired
	UserService  userService;
	
	@RequestMapping("/login")
	public String login( HttpSession session , User user , String headImg) {
			user = service.checkUser(user);
			Customer cust =  new Customer();
			cust.setTelephone(user.getUserNo());
			List<Customer> custList = custService.queryList(cust, new Pagination());
			if(custList != null && custList.size() > 0) {
				cust = custList.get(0);
			}
			Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
			if("0".equals(cust.getExamine())){
 			   return "forward:/web/registerInit?openId=0" ;
 		   }else{
 			   if(StringUtils.isEmpty(cust.getHeadImage())) {
 				    cust.setHeadImage(headImg);
 				    custService.update(cust);
 			   }
 			   session.setAttribute("dic",   JSONObject.fromObject(dicMap));
 			   session.setAttribute("webUser", user);
 			   session.setAttribute("customer", cust);
 			   session.setMaxInactiveInterval(1800);
 			   return "forward:/web/index";
 		   }
	}
	
	
	@ResponseBody
	@RequestMapping("/sendMail")
	public Message sendMail( HttpSession session , String codeEmail  , String telephone ) {
		Message msg = new Message();
		try {
			Customer cust = new Customer();
			cust.setEmail(codeEmail);
			cust.setTelephone(telephone);
			List<Customer> list = custService.queryList(cust , new Pagination());
			if(list != null && list.size()>0){
				 int code = emailService.sendMail(codeEmail);
				 Map map = new HashMap();
				 map.put("code", code);
				 String openId = (String)session.getAttribute("openId");
				 map.put("openId", openId);
				 msg.setObj(map);
				 msg.setSuccess(true);
				 msg.setMsg("邮件发送成功");
				 Customer customer = list.get(0);
				 customer.setOpenId(openId);
				 customer.setExamine("0");
				 customer.setRemark(code+"");
				 custService.update(customer);
			}else{
				msg.setSuccess(false);
				msg.setMsg("您所填写的邮箱或手机信息错误或不存在，请核对！");
			}
		} catch (Exception e) {
			msg.setSuccess(false);
			msg.setMsg("系统异常：" + e.getMessage());
			e.printStackTrace();
		}
		return msg ;
	}
	
	@RequestMapping("/registerInit")
	public String registerInit(HttpServletRequest  request , HttpSession session ,String openId ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		Customer cust = new Customer();
		cust.setOpenId(openId);
		session.setAttribute("mycust", cust);
		
		return "forward:/ring/registerInit.jsp";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest  request , HttpSession session ,String openId ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		session.setAttribute("openId", openId);
//		Map<String,String> ret = JsSignUtil.sign("http://www.ringfingerdating.cn/ring/web/register");
//		request.setAttribute("ret", ret);
		return "forward:/ring/register.jsp";
	}
	
	
	@RequestMapping("/myFocus")
	public String myFocus(HttpServletRequest  request  ,HttpSession session ) {
		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		User  user = (User)request.getSession().getAttribute("webUser");
		Customer cust = custService.queryCustByUserNo(user.getUserNo());
		List<Focus>  list = cust.getFocus();
		List<Customer> customerList = new ArrayList<>();
		for(Focus f : list) {
			Customer c = custService.selectById(f.getToId());
			customerList.add(c);
		}
		request.setAttribute("list", customerList);
		return "forward:/ring/focus.jsp";
	}
	

	@RequestMapping("/myinfo")
	public String myinfo(HttpServletRequest  request , HttpSession session) {
		Customer custLogin = (Customer)session.getAttribute("customer");
		User user = (User)session.getAttribute("webUser");
		Focus focus = new Focus();
		focus.setFromId(custLogin.getId());
		if("1".equals(user.getRole()) || "11".equals(user.getRole())) {
			Customer queryCust = new Customer();
			queryCust.setExamine("0");
			  List<Customer> examineList =  custService.queryList(queryCust, new Pagination());
			  session.setAttribute("myCustExamine", examineList);
			  
			  Invite invite = new Invite();
			  invite.setInviteStates("6");
			  List<Invite> inviteList = inviteService.queryList(invite, new Pagination());
			  session.setAttribute("cancelDating", inviteList);
//			  
//			  com.model.Message msg = new com.model.Message();
//			  msg.setRemark("0");
//			  List<com.model.Message> msgList = msgService.queryList(msg, new Pagination());
//			  session.setAttribute("myMsgExamine", msgList);
			  
			  Article  article = new Article();
			  article.setArticleState("1");
			  List<Article>  articleList = articleMapper.queryByWhere(article, new Pagination());
			  session.setAttribute("myArticleExamine", articleList);
			  
			  Act act = new Act() ;
			  act.setActState("0");
			  List<Act> actList =  actMapper.queryByWhere(act, new Pagination());
			  session.setAttribute("myActExamine", actList);
		}
		List<Focus> focusList = custService.queryFocusByWhere(focus, new Pagination());
		if(focusList != null &&  focusList.size() > 0) {
			request.setAttribute("focusId", focusList.get(0).getId()  );
		}else {
			request.setAttribute("focusId", 0  );
		}
		return "forward:/ring/person_center.jsp";
	}
	
	/**
	 *  邀约初始化页面，改页面进行首次邀约
	 * @param request
	 * @param invite
	 * @return
	 */
	@RequestMapping("/inviteInit")
	public String invite(HttpServletRequest request , Invite invite ) {
		List<Location> locList= locService.queryList(new Location(), new Pagination());
		request.setAttribute("joinId", invite.getJoinId());
		request.setAttribute("locList", locList);
		request.setAttribute("inv", invite);
		return "forward:/ring/dating.jsp";
	}
	
	/**
	 * 第一次邀约请求
	 * @param request
	 * @param invite
	 * @return
	 */
	@RequestMapping("/accept")
	public String accept(HttpServletRequest request , Invite invite ) {
		Invite invite2 = inviteService.selectById(invite.getId());
		request.setAttribute("joinId", invite.getJoinId());
		request.setAttribute("inv", invite2);
		return "forward:/ring/dating.jsp";
	}
	
	/**
	 * 第一次邀约请求
	 * @param request
	 * @param invite
	 * @return
	 */
	@RequestMapping("/dateUpdate")
	public String dateUpdate(HttpServletRequest request , Invite invite ) {
		List<Location> locList= locService.queryList(new Location(), new Pagination());
		Invite invite2 = inviteService.selectById(invite.getId());
		request.setAttribute("locList", locList);
		request.setAttribute("joinId", invite.getJoinId());
		request.setAttribute("inv", invite2);
		return "forward:/ring/dating.jsp";
	}
	
	/**
	 * 受邀人同意邀约申请，选择约会时间地点
	 * @param request
	 * @param invite
	 * @return
	 */
	@RequestMapping("/dating")
	public String dating(HttpServletRequest request , Integer id ) {
		Invite invite  = inviteService.selectById(id);
		InviteDetail detail = inviteDetaiService.selectById(invite.getId());
		request.setAttribute("joinId", invite.getJoinId());
		request.setAttribute("inv", invite);
		request.setAttribute("detail", detail);
		return "forward:/ring/accept.jsp";
	}
	
	@RequestMapping("/evaluate")
	public String evaluate( HttpSession session  , Integer id  , HttpServletRequest request) {
		Invite invite  = inviteService.selectById(id);
		Customer  cust =  (Customer) request.getSession().getAttribute("customer");
		Evaluate ev = new Evaluate();
		ev.setDateingId(id);
		ev.setFromId(cust.getId());
		List<Evaluate> list= evaluateMapper.queryByWhere(ev, new Pagination());
		if(list != null && list.size() > 0) {
			ev = list.get(0);
		}
		Integer custId = 0;
		if(cust.getId().equals(invite.getFromId())){
			custId =  invite.getJoinId();
		}else{
			custId =  invite.getFromId();
		}
		Customer evaluateCust = custService.selectById(custId);
		request.setAttribute("evaluateCust", evaluateCust);
		request.setAttribute("invite", invite);
		request.setAttribute("evaluate", ev);
		return "forward:/ring/evaluate.jsp";
	}
	
	@RequestMapping("/evaluateAdd")
	public String evaluateAdd(Evaluate evaluate  ) {
		if(evaluate.getId() != null && evaluate.getId() > 0) {
			evaluateMapper.updateByPrimaryKey(evaluate);
		}else {
			
			evaluateMapper.insert(evaluate);
		}
		return "forward:/web/dateinfo";
	}
	
	@RequestMapping("/detail")
	public String detail(Integer id , HttpServletRequest request ) {
		Invite invite = inviteService.selectById(id);
		request.setAttribute("invite", invite);
		Customer  cust =  (Customer) request.getSession().getAttribute("customer");
		Evaluate evaluate  = new Evaluate();
		evaluate.setDateingId(id);
				 evaluate.setToId(cust.getId());
		List<Evaluate>  evList= evaluateMapper.queryByWhere(evaluate, new Pagination());
		if(evList!= null && evList.size() > 0){
			request.setAttribute("ev", evList.get(0));
		}
		return "forward:/ring/detail.jsp";
	}
	
	
	@ResponseBody
	@RequestMapping("/examineSuccess")
	public Message examineSuccess(String table , String column , String state , Integer id , String remark ) {
		Message msg = new Message();
		try {
			dao.updateExamine(table , column , state , id  , remark);
//			Customer customer =  new Customer();
//			if("invite".equals(table)) {
//				  Invite invte = inviteService.selectById(id);
//				  customer = custService.selectById(invte.getFromId());
//			}else if("act".equals(table)) {
//				Act act = actMapper.selectByPrimaryKey(id);
//				customer = custService.selectById(act.getCustId());
//			}else if("article".equals(table)) {
//				Article article = articleMapper.selectByPrimaryKey(id);
//				customer = custService.selectById(article.getCustId());
//			}
				 // WXAuthUtil.sendTemplateMsg(NoticeUtil.examine( customer,"1" , ""))	;
		}catch(Exception e) {
			 msg.setMsg("系统异常："  + e.getMessage());
			 msg.setSuccess(false);
			 return msg;
		}
		msg.setSuccess(true);
		msg.setMsg("更新成功");
		return msg;
	}
	
	@ResponseBody
	@RequestMapping("/examineFail")
	public Message examineFail(String table ,String column, Integer id , String remark , String state ) {
		Message msg = new Message();
		try {
			dao.examineFail(table  ,column, state , remark , id );
				Customer customer = custService.selectById(id);
				 WXAuthUtil.sendTemplateMsg(NoticeUtil.examine( customer,"0" , remark))	;
		}catch(Exception e) {
			 msg.setMsg("系统异常："  + e.getMessage());
			 msg.setSuccess(false);
			 return msg;
		}
		msg.setSuccess(true);
		msg.setMsg("更新成功");
		return msg;
	}
	
	
	
	
	/********************************分割线********************************************/
	/**
	 * web登录
	 * @param session
	 * @param user
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/webLogin")
	public Message webLogin( HttpSession session , User user) {
		user = service.checkUser(user);
		Message msg = new Message();
		if(user.getId() != null  && user.getId()>0) {
			session.setAttribute("webUser", user);
			
			Customer cust = new Customer();
			cust.setTelephone(user.getUserNo());
			List<Customer> custList = custService.queryList(cust, new Pagination());
			if(custList != null && custList.size() > 0) {
				cust = custList.get(0);
			}
			session.setAttribute("customer", cust);
			Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
			session.setAttribute("dic",   JSONObject.fromObject(dicMap));
			session.setMaxInactiveInterval(1800);
			msg.setSuccess(true);
			msg.setMsg("登陆成功");
			return msg;
		}else {
			msg.setSuccess(false);
			msg.setMsg("用户名或密码错误");
			return msg;
		}
	}
	
	@RequestMapping("/index")
	public String index(){
		
		return "forward:/new/index.jsp";
	}
	
	/**
	 *   会员信息列表页
	 * @param request
	 * @param session
	 * @param custQuery
	 * @return
	 */
	
	@RequestMapping("/ring/index")
	public String ringIndex(HttpServletRequest  request  ,HttpSession session , Customer custQuery) {
//		Map<String, Map<String, Dictionary>> dicMap = dicService.getDicMap();
//		session.setAttribute("dic",   JSONObject.fromObject(dicMap));
		User  user = (User)request.getSession().getAttribute("webUser");
		List<Customer> list  = new ArrayList<>();
		Customer c = custService.queryCustByUserNo(user.getUserNo());
		if(StringUtils.isNotBlank(user.getUserNo())) {
			custQuery.setWebSex(c.getSex());
		}
		if(StringUtils.isNotBlank(custQuery.getCustLoca())) {
			custQuery.setLoca(custQuery.getCustLoca());
		}
		list= custService.queryList(custQuery, new Pagination());
		for (Customer customer : list) {
			int flag = userService.queryInviteState(customer.getId());
			customer.setInviteFlag(flag);
		}
		request.setAttribute("list", list);
		request.setAttribute("custQuery", custQuery);
		return "forward:/new/cust_list.jsp";
	}
	
	/**
	 * 会员信息详情页
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("/customer")
	public String customer(HttpServletRequest  request , Integer id ) {
		Customer cust = custService.selectById(id);
		cust.setInviteFlag(userService.queryInviteState(id));
		request.setAttribute("cust", cust);
		Customer custLogin = (Customer)request.getSession().getAttribute("customer");
		Focus focus = new Focus();
		focus.setFromId(custLogin.getId());
		focus.setToId(id);
		List<Focus> focusList = custService.queryFocusByWhere(focus, new Pagination());
		if(focusList != null &&  focusList.size() > 0) {
			request.setAttribute("focusId", focusList.get(0).getId()  );
		}else {
			request.setAttribute("focusId", 0  );
		}
		return "forward:/new/cust_detail.jsp";
	}
	/**
	 * 邀约列表
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/info")
	public String info( HttpSession session  , HttpServletRequest request  ) {
		Customer  cust =  (Customer) session.getAttribute("customer");
		List<Invite> inviteList = inviteService.queryInviteByCustId(cust.getId());
		List<Invite> inviteInfo = new ArrayList<>();
		List<Invite> invitedInfo = new ArrayList<>();
		for(Invite invite : inviteList){
			InviteDetail detail = inviteDetaiService.selectById(invite.getId());
			invite.setDetail(detail);
			 if(cust.getId().equals( invite.getFromId())){
				 inviteInfo.add(invite);
			 }else{
				 invitedInfo.add(invite);
			 }
		}
		request.setAttribute("inviteInfo", inviteInfo);
		request.setAttribute("invitedInfo", invitedInfo);
		return "forward:/new/date_list.jsp";
	}
	
	/**
	 * 约会列表
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping("/dateinfo")
	public String dateinfo( HttpSession session  , HttpServletRequest request  ) {
		Customer  cust =  (Customer) session.getAttribute("customer");
		List<Invite> inviteList = inviteService.queryDateingByCustId(cust.getId());
		List<Invite> inviteInfo = new ArrayList<>();
		List<Invite> invitedInfo = new ArrayList<>();
		for(Invite invite : inviteList){
			 if(cust.getId().equals( invite.getFromId())){
				 inviteInfo.add(invite);
			 }else{
				 invitedInfo.add(invite);
			 }
		}
		request.setAttribute("inviteInfo", inviteInfo);
		request.setAttribute("invitedInfo", invitedInfo);
		return "forward:/new/date_list.jsp";
	}
	
//	
//    @ExceptionHandler({Exception.class})   
//    @ResponseBody
//    public String exception(Exception e ,HttpServletRequest request  ) {       
//        System.out.println(e.getMessage());       
//        request.setAttribute("exmsg", e.getMessage());
//        return e.getMessage();     
//    } 
}
