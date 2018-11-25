package com.pay.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.common.DateUtils;
import com.model.Customer;
import com.model.InviteDetail;
import com.model.Location;
import com.pay.msg.Template;
import com.pay.msg.TemplateParam;

public class NoticeUtil {
	
	static String registerSuccess = "d8w35wAWCN9cCxpcVZmtDPVWgERECjKJG6ItCZiBkYM";
	
	static String inviteInit = "SpEZI4pB8MhHFo-1zeIJd8od0ooIlMt1UafnQxUbTZw";
	
	static String inviteConfirm = "_X4HhFarcwEb95SFkIZQaG8SKZ-vYeh6U09-4E4vz-E";
	
	static String inviteRefuse = "lhB85KT6SNdvYct8ltjb1Q-mxlB5ljdDtpQO1jzdoiQ";
	
	static String inviteAccept = "rLBm4XmI2JOKebMEvVFzrF8HjzeLj5QkXYhi21aHGC8";
	static String inviteUpdate = "G6gzlxHwCEptgbtxhX5_QVVohfUEGQ-KWpOMjR3yEt0";
	/**
	 * 注册成功
	 * @param customer
	 * @param joinOpenID 
	 * @return
	 */
	public static Template registerSuccess(Customer customer) {
		 Template tem=new Template();  
	        tem.setTemplateId(registerSuccess);  
	        tem.setTopColor("#000000");  
	                  
	        List<TemplateParam> paras=new ArrayList<TemplateParam>();  
	        paras.add(new TemplateParam("first","注册成功。","#333"));  
	        paras.add(new TemplateParam("keyword1",customer.getChName(),"#333"));
	        paras.add(new TemplateParam("keyword2", DateUtils.getToday(),"#333"));
	        paras.add(new TemplateParam("keyword3","微信","#333"));
	        paras.add(new TemplateParam("remark","感谢你对无名指之约的支持!!!","#333"));  
	                  
	        tem.setTemplateParamList(paras);  
	        tem.setToUser(customer.getOpenId());//用户openid
	        //设置超链接
	        tem.setUrl("http://localhost/web/index");  
	        return tem;
	}
	
	/**
	 * 发出约会邀约 1
	 * @param customer
	 * @return
	 */
	public static Template inviteInit(InviteDetail detail , String joinOpenID) {
		 Template tem=new Template();  
	        tem.setTemplateId(inviteInit);  
	        tem.setTopColor("#000000");  
	        List<TemplateParam> paras=new ArrayList<TemplateParam>();  
	        paras.add(new TemplateParam("first","您有新的约会邀请","#333"));  
	        paras.add(new TemplateParam("keyword1", "等待确认","#333"));
	        paras.add(new TemplateParam("keyword2","原来是你","#333"));
	        paras.add(new TemplateParam("keyword3", "待定","#333"));
	        paras.add(new TemplateParam("keyword4",detail.getConfirmLoc(),"#333"));
	        paras.add(new TemplateParam("remark","点击查看详情并选择具体约会时间地点","#333"));  
	        tem.setTemplateParamList(paras);  
	        tem.setToUser(joinOpenID);//用户openid
	        //设置超链接
	        tem.setUrl("http://localhost/web/info");  
	        return tem;
	}
	/**
	 * 约会时间地点确认 2 
	 * @param customer
	 * @param joinOpenID
	 * @return
	 */
	public static Template inviteConfirm(Customer customer , String joinOpenID) {
		 Template tem=new Template();  
	        tem.setTemplateId(inviteConfirm);  
	        tem.setTopColor("#000000");  
	        List<TemplateParam> paras=new ArrayList<TemplateParam>();  
	        paras.add(new TemplateParam("first","您发起的约会邀约已经通过确认","#333"));  
	        String no = "1".equals(customer.getSex())?("MO"+customer.getId()):("FO" + customer.getId());
	        paras.add(new TemplateParam("keyword1", no ,"#333"));
	        paras.add(new TemplateParam("keyword2", DateUtils.getToday() ,"#333"));
	        paras.add(new TemplateParam("remark","点击查看详情","#333"));  
	        tem.setTemplateParamList(paras);  
	        tem.setToUser(customer.getOpenId());//用户openid
	        //设置超链接
	        tem.setUrl("http://localhost/web/info");  
	        return tem;
	}
	/**
	 * 拒绝邀请，3/5
	 * @param location
	 * @param customer
	 * @return
	 */
	public static Template inviteRefuse( String reason  ,  Customer customer) {
		 Template tem=new Template();  
	        tem.setTemplateId(inviteRefuse);  
	        tem.setTopColor("#000000");  
	        List<TemplateParam> paras=new ArrayList<TemplateParam>();  
	        paras.add(new TemplateParam("first","您发起的约会邀约被拒绝","#333"));  
	        paras.add(new TemplateParam("keyword1", reason,"#333"));
	        paras.add(new TemplateParam("keyword2",DateUtils.getToday(),"#333"));
	        paras.add(new TemplateParam("remark","","#333"));  
	        tem.setTemplateParamList(paras);  
	        tem.setToUser(customer.getOpenId());//用户openid
	        //设置超链接
	        tem.setUrl("http://localhost/web/info");  
	        return tem;
	}
	
	
	/**
	 * 接受邀请 4
	 * @param location
	 * @param customer
	 * @return
	 */
	public static Template inviteAccept(Location location  ,  Customer customer) {
		 Template tem=new Template();  
	        tem.setTemplateId(inviteAccept);  
	        tem.setTopColor("#000000");  
	        List<TemplateParam> paras=new ArrayList<TemplateParam>();  
	        paras.add(new TemplateParam("first","您约会已经确定，时间地点如下","#333"));  
	        paras.add(new TemplateParam("keyword1", location.getLocName(),"#333"));
	        paras.add(new TemplateParam("keyword2", location.getManager(),"#333"));
	        paras.add(new TemplateParam("keyword3", location.getTelephone(),"#333"));
	        paras.add(new TemplateParam("remark","点击查看预约详情","#333"));  
	        tem.setTemplateParamList(paras);  
	        tem.setToUser(customer.getOpenId());//用户openid
	        //设置超链接
	        tem.setUrl("http://localhost/web/info");  
	        return tem;
	}
	
	public static Template inviteUpdate(Location location  ,  Customer customer , Date date) {
		Template tem=new Template();  
        tem.setTemplateId(inviteUpdate);  
        tem.setTopColor("#000000");  
        List<TemplateParam> paras=new ArrayList<TemplateParam>();  
        paras.add(new TemplateParam("first","您约会有信息发生变化，时间地点如下","#333"));  
        paras.add(new TemplateParam("keyword1", customer.getNickName(),"#333"));
        paras.add(new TemplateParam("keyword2", location.getLocName(),"#333"));
        paras.add(new TemplateParam("keyword3", location.getAddress(),"#333"));
        paras.add(new TemplateParam("keyword4", DateUtils.formatDate("yyyy年MM月dd日HH:00", date) ,"#333"));
        paras.add(new TemplateParam("keyword5", "场所及相关服务","#333"));
        paras.add(new TemplateParam("remark","点击查看详情","#333"));  
        tem.setTemplateParamList(paras);  
        tem.setToUser(customer.getOpenId());//用户openid
        //设置超链接
        tem.setUrl("http://localhost/web/info");  
        return tem;
	}

}
