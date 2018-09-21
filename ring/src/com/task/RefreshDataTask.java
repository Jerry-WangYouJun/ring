package com.task;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

public class RefreshDataTask {
	
	@Autowired
	private TransactionTemplate transactionTemplate;
	
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void cmccUpdateDisable(){  
		System.out.println("cmccUpdateDisable");
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
