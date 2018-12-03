package com.pay.util;

import java.io.IOException;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import com.pay.config.WxPayConfig;
import com.pay.msg.Template;

public class WXAuthUtil {
	public static JSONObject doGetJson(String url) throws ClientProtocolException, IOException {
		    JSONObject jsonObject =null;
		    DefaultHttpClient client = new DefaultHttpClient();
		    HttpGet httpGet =new HttpGet(url);
		    HttpResponse response = client.execute(httpGet);
		    HttpEntity entity =response.getEntity();
		    if(entity!=null)
		    {
		      //把返回的结果转换为JSON对象
		      String result =EntityUtils.toString(entity, "UTF-8");
		      jsonObject =JSONObject.fromObject(result);
		    }
		    return jsonObject;
	}
		
	public static  String getAccessToken() throws ClientProtocolException, IOException{  
        String requestUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
        
        requestUrl=requestUrl.replace("APPID", WxPayConfig.appid);  
        requestUrl=requestUrl.replace("APPSECRET", WxPayConfig.appsecret);
        
        JSONObject jsonObject = WXAuthUtil.doGetJson(requestUrl); 
        System.out.println("jsonObject" + jsonObject);
        String access_token = jsonObject.getString("access_token");
        return access_token;
      
	}
	
	public static JSONObject  sendTemplateMsg(Template template) throws ClientProtocolException, IOException{  
        
        //获取token
        String token = getAccessToken();
          
        String requestUrl = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=ACCESS_TOKEN";
        
        requestUrl=requestUrl.replace("ACCESS_TOKEN", token);  
        
        System.out.println(template.toJSON());
        //发送模板消息,返回json格式结果
        JSONObject jsonObject =CommonUtil.httpsRequest(requestUrl, "POST", template.toJSON());
        
        return jsonObject;
          
          
    }
}
