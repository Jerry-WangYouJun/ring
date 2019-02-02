<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/index-info.css">
<script src="${pageContext.request.contextPath}/new/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/new/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new/js/public.js"></script>
<title>个人中心</title>
<script type="text/javascript">
</script>
</head>
<body>
<div class="vue_my_container">

    <div class="popToast2 showToast-transition" style="display:none">
            <span class="icon_popToast" style="display:none">
            </span>
        <span class="txt_popToast"></span>
    </div>
    <div class="info_mc borderB">
        <div class="helper_headCover">
            <div class="head_info_mc" >
			<c:if test="${empty customer.headImage}">
        			<c:if test="${customer.sex eq '1'}">
					<img src="${pageContext.request.contextPath}/img/men.jpg"  width ="56px"   height="56px"/>
		      	</c:if>
		      	<c:if test="${customer.sex eq '0'}">
							<img src="${pageContext.request.contextPath}/img/women.jpg" width ="56px"   height="56px"/>
		      	</c:if>
    			</c:if>
    			<c:if test="${not empty customer.headImage}">
	    			<c:choose>
	    				  <c:when test="${fn:startsWith(customer.headImage,'http')}">
	    				  		<img src="${customer.headImage}"width ="56px"   height="56px" />
	    				  </c:when>
	    				  <c:otherwise>
	    				  	     <img src="${pageContext.request.contextPath}/upload/${customer.headImage}" width ="56px"   height="56px" />
	    				  </c:otherwise>
	    			</c:choose>
    			</c:if>
            </div>
        </div>

        <div class="other_info_mc">
            <div class="name_other_imc">${customer.nickName}</div>
            <div class="tel_other_imc">
                <span class="major_icon general_icon"></span>
                <span class="major_title general_title">普通版</span>

            </div>
        </div>
        <div>
        <a  href="${pageContext.request.contextPath}/customer/updateInit?id=${customer.id}">
	            <span class="registration">修改信息 &gt;</span>
        </a>
        </div>
    </div>
    <div class="article_review">
        <a class="article1"  href="${pageContext.request.contextPath}/act/index">
            <span class="article1-bg bg join-act"></span>
            <span class="art_rev_tit">我的活动</span>
        </a>
        <a class="article1">
            <span class="article1-bg bg"></span>
            <span class="art_rev_tit">写文章</span>
        </a>
        <a class="template1" href="${pageContext.request.contextPath}/web/dateinfo">
            <span class="review1-bg bg"></span>
            <span class="art_rev_tit" >我的约会</span>
        </a>
        <c:if test="${ webUser.role == '1' }">
		        <a class="template1" href="${pageContext.request.contextPath}/web/myinfo">
		            <span class="template1-bg bg"></span>
		            <span class="art_rev_tit">我的审核</span>
		        </a>
		</c:if>
		<c:if test="${ webUser.role == '11' }">
			<a class="template1" href="${pageContext.request.contextPath}/web/myinfo">
		            <span class="template1-bg bg"></span>
		            <span class="art_rev_tit">我的审核</span>
		        </a>
      	</c:if>
        
    </div>
    
    <div class="new_my_center">
        <a href="${pageContext.request.contextPath}/web/info">
	        <div class="leaf_old_mc borderT mySpace borderB" style="position:relative" onclick="myinvite()">
	            <div class="ic_rep_space1 im" style="position:relative;"></div>
	            <div class="txt_leaf_omc ">我的邀约</div>
	            <div class="sponsor-act"><span>5</span>个</div>
	        </div>
        </a>
	</div>
	<div class="old_my_center my_message">
        <div class="leaf_old_mc">
            <div class="ic_rep_message im"></div>
            <div class="txt_leaf_omc">我的消息</div>

        </div>
    </div>
<div class="new_my_center">
        <div class="leaf_old_mc borderT mySpace borderB" style="position:relative">
            <div class="ic_rep_space ic_rep_sponsor1 im" style="position:relative;"></div>
            <div class="txt_leaf_omc">我是活动发起人</div>
            <div class="sponsor-act"><span>12</span>场</div>
        </div>
        <div class="leaf_old_mc borderT mySpace borderB" style="position:relative">
            <div class="ic_rep_space ic_rep_sponsor im" style="position:relative;"></div>
            <div class="txt_leaf_omc ">参加过的活动</div>
        </div>
         <a href="#">
            <div class="leaf_old_mc borderT mySpace borderB">
                <div class="ic_rep_space im" style="position:relative;"></div>
                <div class="txt_leaf_omc ">我的文章和回顾</div>
            </div>
        </a>
    </div>
</div>
</body>
<script type="text/javascript">

</script>
</html>