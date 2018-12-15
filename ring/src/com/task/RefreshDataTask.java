package com.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.common.DateUtils;
import com.common.entry.Pagination;
import com.dao.InviteMapper;
import com.dao.RemindMapper;
import com.model.Invite;
import com.model.Remind;
import com.pay.msgreply.XMLUtil;
import com.pay.util.NoticeUtil;
import com.pay.util.WXAuthUtil;

public class RefreshDataTask {
	
	@Autowired
	private TransactionTemplate transactionTemplate;
	
	@Autowired
	private InviteMapper inviteMapper;
	
	@Autowired
	private RemindMapper remindMapper;
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void inviteRemind(){  
		System.out.println("cmccUpdateDisable");
			this.transactionTemplate.execute(new TransactionCallback() {
	            public Object doInTransaction(TransactionStatus transactionStatus) {
	      		  try{
	      			  System.out.println("执行定时任务，提醒约会信息等");
	      			  Invite invite = new Invite();
	      			  invite.setInviteStates("4");
	      			  List<Invite> list = inviteMapper.queryByWhere(invite, new Pagination());
	      			  for (Invite i : list) {
	      				  System.out.println("当前时间：" +DateUtils.getStringDate()  );
	      				  System.out.println("约会时间：" + i.getDetail().getConfirmDate().trim()+":00");
						 Long s = DateUtils.getDays(
								i.getDetail().getConfirmDate().trim()+":00",DateUtils.getStringDate() );
						 System.out.println("剩余时间：" + s + "小时");
						 if(s == 2  || s==24) {
							 Remind remind = new Remind();
							 remind.setRemindType("2");
							 remind.setRemindTime(s+"");
							List<Remind> remindList = remindMapper.queryByWhere(remind, new Pagination());
							remind =remindList.get(0);
							WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteRemind(remind.getRemind(), invite.getDetail().getConfirmDate(), invite.getCustomerFrom(), invite.getId(), Integer.valueOf(s+"")));
							WXAuthUtil.sendTemplateMsg(NoticeUtil.inviteRemind(remind.getRemind(), invite.getDetail().getConfirmDate(), invite.getCustomerFrom(), invite.getId(), Integer.valueOf(s+"")));
						 }
	      			  }
	      		  }catch (Exception e) {
	      			  System.out.println(e.getMessage());
				}
	      		  return null;
	         }
	        });
  } 
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void cmccUpdateNormal(){
		System.out.println("cmccUpdateNormal");
		this.transactionTemplate.execute(new TransactionCallback() {
            public Object doInTransaction(TransactionStatus transactionStatus) {
      		  try{
      		  }catch (Exception e) {
				  e.getMessage();
			}
      		  return null;
         }
        });
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void unicomUpdateNormal(){
		System.out.println("unicomUpdateNormal");
		this.transactionTemplate.execute(new TransactionCallback() {
            public Object doInTransaction(TransactionStatus transactionStatus) {
      		  try{
      			  
      			  
      		  }catch (Exception e) {
				  e.getMessage();
			}
      		  return null;
         }
        });
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void unicomUpdateDisable(){
		System.out.println("unicomUpdateDisable");
		this.transactionTemplate.execute(new TransactionCallback() {
            public Object doInTransaction(TransactionStatus transactionStatus) {
      		  try{
      		  }catch (Exception e) {
				  e.getMessage();
			}
      		  return null;
         }
        });
	}
}
