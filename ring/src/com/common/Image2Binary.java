package com.common;
 
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.UnknownHostException;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
 
  
public class Image2Binary  
{  
	private static Logger log = LoggerFactory.getLogger(Image2Binary.class);
	
	public static byte[] toByteArray(InputStream in) throws IOException {
		
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        byte[] buffer=new byte[1024*4];
        int n=0;
        while ( (n=in.read(buffer)) !=-1) {
            out.write(buffer,0,n);
        }
        return out.toByteArray();
	}
	
	/**
	 * 网络文件转换为byte二进制
	* @Title: toByteArray
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @param @param url
	* @param @return
	* @param @throws IOException    设定文件
	* @return byte[]    返回类型
	* @throws
	 */
	public static byte[] toByteArray(String urlStr) throws IOException {
		URL url = new URL(urlStr);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		DataInputStream in = new DataInputStream(conn.getInputStream());
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        byte[] buffer=new byte[1024*4];
        int n=0;
        while ( (n=in.read(buffer)) !=-1) {
            out.write(buffer,0,n);
        }
        return out.toByteArray();
	}
	
	/**
	 * @throws IOException 
	 * @throws MalformedURLException 
	 * 网络文件转换为本地文件
	* @Title: toByteArray
	* @Description: TODO(这里用一句话描述这个方法的作用)
	* @param @param url
	* @param @return
	* @param @throws IOException    设定文件
	* @return byte[]    返回类型
	* @throws
	 */
	public static void toBDFile(String urlStr, String bdUrl) throws IOException,UnknownHostException{
		URL url = new URL(urlStr);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		DataInputStream in = new DataInputStream(conn.getInputStream());
        byte[] data=toByteArray(in);
        in.close();
        FileOutputStream out=new FileOutputStream(bdUrl);
        out.write(data);
        out.close();
	}
	
	/**
	 * 直接获取网络文件的md5值
	 * @param urlStr
	 * @return
	 */
	public static String getMd5ByUrl(String urlStr){
		String md5 = null;
		try {
			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			DataInputStream in = new DataInputStream(conn.getInputStream());
			md5 = DigestUtils.md5Hex(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    
		return md5;
	}
	
	/**
	 * 获取网络文件的输入流
	 * @param urlStr
	 * @return
	 */
	public static InputStream getInputStreamByUrl(String urlStr){
		DataInputStream in = null;
		try {
			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			in = new DataInputStream(conn.getInputStream());
		} catch (IOException e) {
			log.error("url转换输入流失败,错误信息{}",e.getMessage());
		}    
		return in;
	}
	
 
	public static void getHeadImg(String headImg , String openId) throws UnknownHostException, IOException {
		String osName =  System.getProperty("os.name");
    	String path =  System.getProperty("user.dir")  ;
    	if(osName.toUpperCase().startsWith("MAC")) {
//    		int  splitIndex = System.getProperty("user.dir").lastIndexOf(System.getProperty("file.separator"));
//    		path = System.getProperty("user.dir").substring(0, splitIndex);
    		path="/Users/wangyoujun/Desktop/upload/";
    	}else{
    		path="D:\\uploadFile/";
    	}
		toBDFile(headImg,path + openId + ".jpg");
	}
    public static void main(String[] args)  
    {  
//    	String a = getMd5ByUrl("http://thirdwx.qlogo.cn/mmopen/vi_32/LOnpvKZliaSZUTLR6ZEGNX9CAibibic4libhn3E2AsUeYMicpC9PiciaudkwceficXKaxib8OLKbXGbBVgphvjxrLYucYtiaw/132");
//    	System.out.println(a);
    }  
}  
