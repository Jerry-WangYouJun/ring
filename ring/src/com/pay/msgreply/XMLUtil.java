package com.pay.msgreply;

import java.io.PrintWriter;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.pay.config.WxPayConfig;

public class XMLUtil {
	public static String content="";
    public static Document  readString2XML(String str){
        Document document=null;
        try {
            document=DocumentHelper.parseText(str);
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return document;
    };
    /**
     * 读取根节点下每一个节点信息
     * @param node
     * @return
     */
    public static String readNodes(Element node){
        content+=node.getName()+":"+node.getTextTrim()+"\n";
      //递归遍历当前节点所有的子节点  
        List<Element> listElement=node.elements();//所有一级子节点的list  
        for(Element e:listElement){//遍历所有一级子节点  
            readNodes(e);//递归  
        }
        return content;
    }
    /**
     * 读取单个节点信息
     * @param node
     * @param name
     * @return
     */
    public static String readNode(Element node,String name){
        Element e=node.element(name);
        String nodeString=e.getTextTrim();
        return nodeString;

    }
    
    public static void replyMessage(String message, PrintWriter out) {
        Document document = XMLUtil.readString2XML(message);
        Element root = document.getRootElement();
        String MsgType = XMLUtil.readNode(root, "MsgType");
        if (MsgType.equals("text")) {
            ReplyTextMsg textMsg = new ReplyTextMsg();
            textMsg.setFromUserName(WxPayConfig.appid);
            textMsg.setToUserName(XMLUtil.readNode(root, "FromUserName"));
            textMsg.setCreateTime();
            //将XML消息的参数都转化内容回复给微信
            XMLUtil.content = "";
            String nodeString = XMLUtil.readNodes(root);
            textMsg.setContent(nodeString);
            textMsg.setMsgType("text");
            try {
                //将对象转化为XML
                String replyMsg = textMsg.Msg2Xml();
                out.println(replyMsg);
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
}
}
