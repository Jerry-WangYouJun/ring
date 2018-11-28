package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.baidu.ueditor.ActionEnter;
import com.common.CodeUtil;
import com.common.DateUtils;
import com.common.StringCommons;
import com.model.Image;

@Controller
@RequestMapping("/upload")
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
	
	@RequestMapping("/images")
	public void instVipAjax(Image image, HttpServletRequest request , HttpServletResponse response ,
			MultipartFile upfile) {
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
