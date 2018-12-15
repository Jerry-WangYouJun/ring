<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/new/js/jquery-1.10.2.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/new/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new/js/public.js"></script>
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 
<title>会员信息</title>
<script type="text/javascript">
$(function(){
	$('.form_datetime').datetimepicker({
	    format: 'yyyy-mm',
	    autoclose: true,
	    todayBtn: true,
	    startView: 'decade',
	    minView:'year',
	    maxView:'decade',
	    language:  'zh-CN',
	});
});

function personCenter(){
	 window.location.href="${pageContext.request.contextPath}/new/person_center.jsp";
}
</script>
</head>
<body>
<%@include file="/ring/header.jsp"%>
<div class="container">
    <!-- <div class="row index-menu">
        <div class="col-xs-2"><span class="on">全部</span></div>
        <div class="col-xs-2"><span>文化</span></div>
        <div class="col-xs-2"><span>亲自</span></div>
        <div class="col-xs-2"><span>工艺</span></div>
        <div class="col-xs-2"><span>丽人</span></div>
        <div class="col-xs-2"><i class="glyphicon glyphicon-menu-right"></i></div>
    </div> -->
    <!-- <div class="row">
    		<div class="col-xs-6">
            <div class="index-header-search">
                <input type="text" class="form-control" placeholder="Search">
            </div>
        </div>
        <div class="col-xs-6">
            <div class="index-header-search">
                <input type="text" class="form-control" placeholder="Search">
            </div>
        </div>
    </div> -->
    
    <div class="row"  >
                        <!-- Start .row -->
                        <div class="col-lg-12">
                            <!-- Start col-lg-12 -->
                            <div class=" panel-default toggle">
                                <!-- Start .panel -->
                                <div class="panel-body">
                                    <form class=" group-border hover-stripped" role="form" action="${pageContext.request.contextPath}/web/ring/index" method="post">
                                        <div class="form-group" >
                                        		<label class="col-lg-2 col-md-2 col-xs-12 control-label" >出生年月</label>
                                            <div class="col-lg-5 col-md-5 col-xs-6 mb10" style="margin-bottom: 5px">
                                               <input class="form-control form_datetime" type="text" value="" size="16" name="ageFrom">
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-xs-6 mb10" style="margin-bottom: 5px">
                                                <input class="form-control form_datetime" type="text" value="" size="16" name="ageTo">
                                            </div>
                                        </div>
                                        
                                         <div class="form-group" >
                                        		<label class="col-lg-2 col-md-2 col-xs-4 control-label" >身高范围</label>
                                        		<div class="col-lg-4 col-md-4 col-xs-8 mb10" style="margin-bottom: 5px">
                                            		<select name="heightQuery" class="form-control" >
                                               	   <option value="">请选择</option>
                                                	   <option value="1">160以下</option>
                                                	   <option value="2">160-170</option>
                                                	   <option value="3">170-180</option>
                                                	   <option value="4">180以上</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- End .form-group  -->
                                        <div class="form-group">
                                            <label class="col-lg-2 col-md-2 col-sm-12 col-xs-4 control-label " style="text-align: right">活动范围</label>
                                            <div class="col-lg-4 col-md-4 col-xs-8 mb10 " >
                                            		<div class="form-group ">
												    <label class="checkbox-inline">
												      <input type="checkbox"  value="市南" name="loca">市南
												    </label>
												    <label class="checkbox-inline">
												      <input type="checkbox"  value="市北" name="loca">市北
												    </label>
												    <label class="checkbox-inline">
												    <input type="checkbox"  value="崂山" name="loca">崂山
												    </label>
												  </div>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                                <button class="btn main-about-btn"  >查询心仪的Ta</button>
                                            </div>
                                        <!-- End .form-group  -->
                                    </form>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- End col-lg-12 -->
                    </div>
    <c:forEach items="${list}" var ="customerJoin">
	    <div class="row index-list">
	        <div class="col-xs-4 list-left">
	            <a href="${pageContext.request.contextPath}/web/customer?id=${customerJoin.id}"><img src="${pageContext.request.contextPath}/new/images/1_03.jpg" width="100%"></a>
	        </div>
	        <div class="col-xs-8 list-right">
	            <div class="row">
	                <p class="menu-list-main">
	                <c:if test="${cust.sex eq '1'}">
						<img src="${pageContext.request.contextPath}/img/men.jpg"  />
			      	</c:if>
			      	<c:if test="${cust.sex eq '0'}">
								<img src="${pageContext.request.contextPath}/img/women.jpg" />
			      	</c:if>
	                
	                 ${customerJoin.nickName}</p>
	                <div class="index-list-tap">
	                    <i class="glyphicon glyphicon-bookmark fl"></i>
	                    <span class="line"></span>
	                    <span><c:if test="${customerJoin.inviteFlag  > 0 }">约会中</c:if>
	             	 		 <c:if test="${customerJoin.inviteFlag  == 0 }"> 可邀约</c:if> 
	             	    <span></span></span>
	                    <span class="line"></span>
	                    <span> ${customerJoin.birthday }</span>
	                    <span class="line"></span>
	                    <a href="${pageContext.request.contextPath}/web/customer?id=${customerJoin.id}"><span>详细信息</span></a>
	                  
	                </div>
	
	            </div>
	        </div>
	        <div class="menu-list-bottom-line"></div>
	    </div>
    </c:forEach>
</div>
</body>
</html>