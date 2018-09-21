package com.common;

import com.common.entry.Pagination;


public class CodeUtil {
	  
	   public static String  getFixCode(int  max){
		    if(max  <= 9 ){
		    	return "-0" + max;
		    }else{
		    	return  "-" + max ;
		    }
	   }
	   
		public static void initPagination(Pagination pagination ) {
			if ((pagination.getTotal() % pagination.getPageSize()) == 0) {
				pagination.setPageIndex(pagination.getTotal() / pagination.getPageSize());
			} else {
				pagination.setPageIndex(pagination.getTotal() / pagination.getPageSize() + 1);
			}
			pagination.setStart(pagination.getPageSize() * ( pagination.getPageNo() - 1));
		}
}
