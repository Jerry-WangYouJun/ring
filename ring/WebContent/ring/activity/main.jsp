<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath}/css/style.css" />
 <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel="stylesheet" />
<script type="text/javascript">
		
		function addActivity(){
			 window.location.href="${pageContext.request.contextPath}/ring/activity/activity.jsp" ;
		}
		
		$(function(){
			 var dic = eval('(${dic})');
			$(".dicValue").each(function(){
				 var field  = $(this).attr("name")
				 var value =  $(this).attr("value");
				 if(dic[field][value]!= undefined){
					 $(this).text($(this).text() + dic[field][value]["describ"]);
				 }
			})
		 });
		
		function actDetail(id){
			window.location.href="${pageContext.request.contextPath}/act/detail?id=" + id ;
		}
</script>
<style type="text/css">
.page-header {
  border-bottom: 1px solid gray;
}

.page-top {
  border-top: 1px solid gray;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}

.dingwei2{
    position: fixed;
    bottom: 50px;
    right: 20px;
    padding-bottom: 10px;

}

.images_3_of_b {
    width: 45.2%;
    float: left;
}

.desc2 {
    display: block;
    float: left;
    margin: 0% 0 2% 2.6%;
}

.span_3_of_b {
    width: 52.2%;
}
</style>
</head>
<body>
<%@include file="/ring/activity/header.jsp"%>
		<div class="container-fluid"  style="margin-top:60px">
			<div class="row container ">
				<div class="tab-content" style="margin-bottom: 93px;">
					<div role="tabpanel" class="tab-pane active" id="home">
						 <h3>活动列表</h3>
						 	 <c:forEach items="${actList }" var="actinfo">
						 	 		<div  onclick="actDetail('${actinfo.id }')" style="height: 220px">
						 	 			<div class="images_3_of_b">
										 	 <img  src="${pageContext.request.contextPath}/ring/images/p1.jpg" style="width:100%;height:auto;max-height: 200px;"/>
						 	 			</div>
									 	<div class="desc2 span_3_of_b">
                                                    <ul class="list-unstyled">
                                                        <li> <h3>活动名称：${actinfo.actName }</h3> </li>
                                                        <li> <h3>时间：${actinfo.actDate }</h3> </li>
                                                        <li> <h3 class="dicValue"  name="admin" value="${actinfo.admin}">主办方：</h3> </li>
                                                        <li> <h3>活动地点：${actinfo.actLoca }</h3> </li>
                                                        <li>  <h3 class="dicValue"  name="actForm" value="${actinfo.actForm }">活动形式：</h3> </li>
                                                    </ul>
									 	</div>
						 			</div>
						 	 </c:forEach>
					</div>
					<div role="tabpanel" class="tab-pane" id="profile">
					</div>
				</div> 
			</div>
			<div>
			<!-- <div class="dingwei2 pull-right">
					  <button class="btn btn-primary  btn-circle" onclick="addActivity()">新建 </button>
				</div> -->
 			<div class="row dingwei page-top " >
						<a type="button" class="text-center  col-xs-6" style="margin-bottom: 10px" onclick="signUp()"><i class="im-home"></i>活动主页</a>
						<a type="button" class="text-center  col-xs-6" style="border: none;" onclick="addActivity()"><i class="ec-user"></i>新建</a>
				</div>
			</div>
		</div>
 	<div class="modal fade" id="addModal"  role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height: ">
				<div class="modal-content">
					<div class="modal-body">
					 </div>
				</div>
			</div>
		</div>
</body>
</html>