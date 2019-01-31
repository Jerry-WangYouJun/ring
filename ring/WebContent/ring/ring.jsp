<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
<title>页面对应信息</title>
</head>
<body>
<table class="layui-hide" id="test"></table>
              
          
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
 
<script>
layui.use('table', function(){
  var table = layui.table;
  
  table.render({
    elem: '#test'
    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
    ,cols: [[
       {field:'city', width:'20%', title: '页面描述'}
      ,{field:'username', width:'30%', title: '页面路径'}
      ,{field:'classify', width:'30%', title: '请求路径'}
    ]],data: [{
       		"city": "从浏览器的登录页面"
            ,"username": "暂无"
            ,"classify": "ring/login.jsp"
          },{
        		"city": "浏览器点击登录到主页"
            ,"username": "base/web/webLogin ajax 跳转 web/index"
            ,"classify": "new/index.jsp"
         },{
       		 "city": "浏览器注册"
            ,"username": "http://localhost:8888/ring/web/register"
            ,"classify": "/ring/register.jsp"
       	  },{
        		 "city": "登录用户信息"
            ,"username": "session"
            ,"classify": "webUser"
       	  },{
     		 "city": "登录customer信息"
             ,"username": "session"
             ,"classify": "customer"
        	  },{
  		 	"city": "约会列表页信息"
             ,"username": "/web/ring/index"
             ,"classify": "/new/cust_list.jsp"
        	  },{
   		 	"city": "会员详细信息"
             ,"username": "web/customer?id=70"
             ,"classify": "new/cust_detail.jsp"
        	  },{
   		 	"city": "邀约首次申请信息"
            ,"username": "web/inviteInit?joinId=71"
            ,"classify": "/ring/dating.jsp"
       	  },{
 		 	"city": "发出首次邀请"
            ,"username": "invite/invite_edit"
            ,"classify": "/web/info 转 /new/date_list.jsp"
       	  },{
 			"city": "约会详情"
           ,"username": "web/detail?id=64"
           ,"classify": "/ring/detail.jsp"
      	  },{
   			"city": "同意约会"
           ,"username": "invite/state?id=64&inviteStates=1"
           ,"classify": "/web/dating?id=  转 /ring/accept.jsp"
      	  },{
 			"city": "个人中心- 我的约会 "
           ,"username": "web/dateinfo"
           ,"classify": ":/new/date_list.jsp"
      	  },{
   			"city": "个人中心- 我的约会 - 全部约会 "
          ,"username": "web/info"
          ,"classify": "new/date_list.jsp"
     	  },{
    			"city": "我的约会 - 约会评价"
	         ,"username": "web/evaluate?id=64"
	         ,"classify": "/ring/evaluate.jsp"
	    	  },{
			"city": "我的约会 - 约会详情"
	         ,"username": "web/detail?id=64##"
	         ,"classify": "/ring/detail.jsp"
	    	  }]
  		  ,page: true
  });
});
</script>
	

</body>
</html>