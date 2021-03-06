package com.pay.dto;

public class Menu {
	
	public final static String CLICK = "click"; // click菜单
	public final static String VIEW = "view"; // url菜单
	public final static String SCANCODE_WAITMSG = "scancode_waitmsg"; // 扫码带提示
	public final static String SCANCODE_PUSH = "scancode_push"; // 扫码推事件
	public final static String PIC_SYSPHOTO = "pic_sysphoto"; // 系统拍照发图
	public final static String PIC_PHOTO_OR_ALBUM = "pic_photo_or_album"; // 拍照或者相册发图
	public final static String PIC_WEIXIN = "pic_weixin"; // 微信相册发图
	public final static String LOCATION_SELECT = "location_select"; // 发送位置
 
	private BasicButton[] button;
 
	public BasicButton[] getButton() {
		return button;
	}
 
	public void setButton(BasicButton[] button) {
		this.button = button;
	}
}

