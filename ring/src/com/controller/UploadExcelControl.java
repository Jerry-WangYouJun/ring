package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.baidu.ueditor.ActionEnter;
import com.common.CodeUtil;
import com.common.DateUtils;
import com.model.Image;

@Controller
@RequestMapping("/up")
public class UploadExcelControl {

	
	@RequestMapping("/test")
	public void test(){
		 System.out.println("1231231");
	}
	
	@RequestMapping("/images")
	public void instVipAjax( HttpServletRequest request , HttpServletResponse response ,
			MultipartFile upfile) {
		response.setContentType("application/json");
		PrintWriter out;
		JSONObject json = new JSONObject();
		try {
				String name = DateUtils.getDate14() + "_" + upfile.getOriginalFilename();
				if(StringUtils.isNotEmpty(name) && name.length() > 50){
					out = response.getWriter();
					json.put("success", false);
					json.put("msg", "文件名过长，请修改后再上传");
					out.println(json);
					out.flush();
					out.close();
					return;
				}
				Image image = new Image();
				image.setIname(name);
				CodeUtil.SaveFileFromInputStream(upfile ,image);
			out = response.getWriter();
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/image")
	public void instVip(Image image, HttpServletRequest request , HttpServletResponse response 
			) {
		response.setContentType("application/json");
        String rootPath = request.getSession()
                .getServletContext().getRealPath("/");
 
        try{
            String exec =new ActionEnter(request, rootPath).exec();
            PrintWriter writer = response.getWriter();
            writer.write(exec);
            writer.flush();
            writer.close();
        }catch (IOException e) {
            e.printStackTrace();
        }
	}
}
