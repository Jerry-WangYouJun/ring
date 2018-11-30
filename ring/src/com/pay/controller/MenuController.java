package com.pay.controller;

import java.util.TreeMap;

import org.springframework.stereotype.Controller;

import com.pay.dto.BasicButton;
import com.pay.dto.ComplexMenu;
import com.pay.dto.Menu;
import com.pay.dto.ViewButton;

@Controller
public class MenuController {
	 
	private static Menu getMenu() {
		
		ViewButton btn11 = new ViewButton();
		btn11.setName("测试11");
		btn11.setUrl("http://www.qq.com");
		
		ClickButton btn21 = new ClickButton();
		btn21.setName("测试21");
		btn21.setKey("21");
	 
		ClickButton btn22 = new ClickButton();
		btn22.setName("测试22");
		btn22.setKey("22");
	 
		//一级菜单(没有二级菜单)
		ComplexMenu mainBtn1 = new ComplexMenu();
		mainBtn1.setName("测试1");
		mainBtn1.setSub_button(new BasicButton[] { btn11});
	 
		//一级菜单(有二级菜单)
		ComplexMenu mainBtn2 = new ComplexMenu();
		mainBtn2.setName("测试2");
		mainBtn2.setSub_button(new BasicButton[] { btn21, btn22 }); 
		
		Menu menu = new Menu();
		menu.setButton(new BasicButton[] { mainBtn1, mainBtn2 });
		return menu;
	}
	
	/**
	 * 创建的菜单
	 * 
	 * @param menu 菜单项
	 * @param token 授权token
	 * @return {"errcode":0,"errmsg":"ok"}
	 */
	public ResultState createMenu(Menu menu, String token) {
		TreeMap<String, String> map = new TreeMap<String, String>();
		map.put("access_token", token);
		String jsonData = JsonUtil.toJson(menu).toString();
		String result = HttpReqUtil.HttpsDefaultExecute(HttpReqUtil.POST_METHOD, WechatConfig.MENU_CREATE_URL, map, jsonData);
		return JsonUtil.fromJson(result, ResultState.class);
	}


}
