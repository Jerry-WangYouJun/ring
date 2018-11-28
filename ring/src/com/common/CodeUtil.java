package com.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.common.entry.Pagination;
import com.model.Image;


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
		
		public static void SaveFileFromInputStream(MultipartFile file,
				Image image) throws IOException {
			String osName =  System.getProperty("os.name");
        	String path =  System.getProperty("user.dir")  ;
        	if(osName.toUpperCase().startsWith("MAC")) {
//        		int  splitIndex = System.getProperty("user.dir").lastIndexOf(System.getProperty("file.separator"));
//        		path = System.getProperty("user.dir").substring(0, splitIndex);
        		path="/Users/wangyoujun/Desktop/smd/WebContent/image";
        	}else{
        		path="D:\\uploadFile";
        	}
        	File f = new File(path + "/"+ image.getIname());
			 if(!f.exists()){
				 f.getParentFile().mkdirs();
			 }
			 OutputStream out = new FileOutputStream(f);
        	FileCopyUtils.copy(file.getInputStream(), out);
		}  
}
