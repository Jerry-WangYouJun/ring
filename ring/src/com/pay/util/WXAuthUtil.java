package com.pay.util;

import java.io.IOException;

import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

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
		
}
