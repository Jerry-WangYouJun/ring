package com.pay.config;

public class WxPayConfig {
	
	/**
	 * 公众账号ID
	 */
	public static String appid = "wx1b12c0a79e8e36d1";
	
	/**
	 * 
	 */
	public static String appsecret = "f8f07ff50716ef0b3b255f7e4fc57563";
	
	/**
	 * 商户号（mch_id）
	 */
	public static String partner = "1448494802";
	
	public static String partnerkey = "zhangxinzhao1980zxcvzhangxinzhao";
	
	/**
	 * 交易类型
	 */
	public static String trade_type = "JSAPI";
	
	public static String signType = "MD5"; 
	
	/**
	 * 固定套餐金额
	 * @param args
	 */
	public static  Integer money = 18 ;
	
	/**
	 * 固定套餐包id
	 * @param args
	 */
	public  static  int packageId = 1 ;
}
