package com.controller;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.StringCommons;

@Controller
@RequestMapping("/upload/*")
public class UploadExcelControl {

	public static void main(String[] args) {
		Format format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		System.out.println(format.format(new Date(System.currentTimeMillis())));
	}

	
	@RequestMapping(value = "uploadInit", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String  uploadInit(HttpSession session ){
		String roleId =  session.getAttribute("roleid").toString();
		if(!(StringCommons.ROLE_ADMIN.equals(roleId) )){
			   return "unicom/agent";
		}
		 return "main";
	}
	
	@RequestMapping(value = "forward", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String  forwardInit(){
		 return "forwardData";
	}

}
