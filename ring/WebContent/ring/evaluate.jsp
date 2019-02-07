<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${basePath}/ring/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/css/style.css" />
<link rel="stylesheet" href="${basePath}/ring/css/main.css" />
<script src="${basePath}/js/jquery-3.1.1.min.js"></script>
<script src="${basePath}/js/validate/jquery.validate.min.js"></script>
<script src="${basePath}/js/validate/jquery.metadata.js"></script>
<script src="${basePath}/js/validate/messages_zh.js"></script>
<script src="${basePath}/ring/assets/js/bootstrap/bootstrap.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
		$(function(){
			 $(".dicSelect").each(function(){
				     var field = this.name ;
			    	 var htmlStr = "";
				     if (dic.hasOwnProperty(field)) {
						 for( var keyValue in dic[field] ){
							   htmlStr += "<option value="+keyValue+">"+dic[field][keyValue].describ+"</option>"
						 }
					  } 
				     $(this).append(htmlStr);
			 });
			 
			 $("#late").val("${evaluate.late}");
			 $("#next").val("${evaluate.next}");
			 $("#talk").val("${evaluate.talk}");
			 $("#compare").val("${evaluate.compare}");
		});
	 function updateStates(id , states){
		 var str = "";
		 if(states == '3' || states =='5'){
			 str = window.prompt("请输入拒绝的原因") 
		 }
		 window.location.href= "${basePath}/invite/state?id="+id+"&inviteStates=" + states +"&remark=" + str;
	 }
	 
		function  addInvite(id , states){
			//$("#addModal").modal("show");

			$("#addModal").modal({  
			    remote: "${pageContext.request.contextPath}/invite/state?id="+id+"&inviteStates=" + states
			});
		}
		function  updateDating(id , states){
			if(confirm("只有一次修改约会信息的机会，确定修改？")){
				$("#addModal").modal({  
				    remote: "${pageContext.request.contextPath}/invite/update?id="+id+"&inviteStates=" + states
				});
			 }
		}
		
		
		function evaluateDate(id){
			 window.location.href="${pageContext.request.contextPath}/ring/evaluate.jsp"
		}
</script>
<style type="text/css">

	 .day_value{
	 	 color: black;
	 	 margin-left: 10px;
	 }
</style>
</head>
<body>
<%@include file="/ring/header.jsp"%>
		<div class="container-fluid">
			 <div class="row">
                        <!-- col-lg-4 end here -->
                        <div class="">
                            <!-- col-lg-4 start here -->
                            <div class="panel panel-default plain mt10" >
                                <!-- Start .panel -->
                                <div class="basic_1">
				    	<div class="col-md-6 basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<tr class="opened_1">
									<td class="day_label">邀请人 :</td>
									<td class="day_value" ><a href="${pageContext.request.contextPath}/web/customer?id=${invite.fromId}">${invite.customerFrom.nickName}</a></td>
								</tr>
								<tr class="opened_1">
									<td class="day_label">受邀人 :</td>
									<td class="day_value" ><a href="${pageContext.request.contextPath}/web/customer?id=${invite.joinId}">${invite.customerJoin.nickName}</a></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">约会时间 :</td>
									<td class="day_value">${invite.detail.confirmDate }</td>
								</tr>
								 <tr class="opened">
									<td class="day_label">活动地点 :</td>
									<td class="day_value">${invite.pointLocation.location} - ${invite.pointLocation.locName}</td>
								</tr>
								<tr class="opened_1">
									<td class="day_label"> 详细地址 : </td>
									<td class="day_value">  ${invite.pointLocation.address }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label"> 店铺电话 :&nbsp; </td>
									<td class="day_value " >${invite.pointLocation.telephone }</td>
								</tr>
								<tr class="opened">
									<td class="day_label" colspan="2">
									<c:if test="${invite.inviteStates eq '4' }">
										<button type="button" class="btn btn-primary btn-lg  col-xs-6" style="border: none;" onclick="signUp()">约会签到</button>
									</c:if>
									</td>
								</tr>
								
						    </tbody>
				          </table>
				          
				         </div>
				        <div class="clearfix"> </div>
				    </div>
                                <div class="panel-body">
                                    <form class="form-vertical hover-stripped" role="form" id="dataForm" action="${basePath}/web/evaluateAdd" method="post">
                                    <input type="hidden" name="fromId" value="${customer.id }">
                                    <input type="hidden" name="dateingId" value="${invite.id }">
                                     <input type="hidden" name="toId" value="${evaluateCust.id}">
                                     <input type="hidden" name="evaluateIds" id="evaluateIds" >
                                     <input type="hidden" name="id" value="${evaluate.id }">
                                        <div class="form-group">
                                            <label class="control-label mt10">添加标签</label>
                                             <input type="text" class="form-control col-lg-6 col-md-6"  id="tagA"  onchange="addTags()">
	                                        <div class="tags" >
					                        </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label">是否发生迟到</label>
                                           		<select 
													class="form-control dicSelect" id="late" name="late" >
												</select>
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label">对方实际情况与系统描述相符情况</label>
                                            <select 
													class="form-control dicSelect" id="compare" name="compare" >
												</select>
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label">互动中，对方反馈积极程度</label>
                                           	    <select 
													class="form-control dicSelect" id="talk" name="talk" >
												</select>
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label">是否愿意再次与对方见面</label>
                                            <select  
													class="form-control dicSelect" id="next" name="next" >
												</select>
                                        <div class="form-group">
                                       		 <input type="hidden" name="remark"  id="remark">
                                            <label class="control-label">魅力值</label>
                                            <textarea class="form-control" rows="3" name="evaluateMsg">${evaluate.evaluateMsg }</textarea>
                                        </div>
                                        <div class="form-group">
                                       		<label class="control-label">综合评价</label>
											<div id="test2"></div>
                                        </div>
                                        </div>
                                        <!-- End .form-group  -->
                                        <div class="form-group">
	                                        <p class="text-center">
	                                            <button  class="btn btn-primary btn-lg  col-xs-6" style="border: none;" >提交评价</button>
	                                       </p>
                                        </div>
                                        <!-- End .form-group  -->
                                    </form>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- col-lg-4 end here -->
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
		<script type="text/javascript">
			 function addTags(){
				 var rand = parseInt(Math.random() * (4) + 1); 
				 var  val = $("#tagA").val();
				 var arr = ["primary","success","info","warning"];
				 $("#evaluateIds").val($("#evaluateIds").val() + val + ",");
				 $(".tags").append('<span class="badge badge-' +arr[rand] +'  mt10">'+ val+'<a href="####"  onclick="deleteTag(this)" class="mr5">X</a></span>');
			 }
			 function deleteTag(obj){
				   $(obj).parent().remove();
			 }
			 layui.use(['rate'], function(){
				  var rate = layui.rate;
				//显示文字
				  rate.render({
				    elem: '#test2'
				    ,value: "${evaluate.remark}" //初始值
				    ,text: true //开启文本
				    ,choose: function(value){
				          $("#remark").val(value);
				      }
				  ,setText: function(value){
					    var arrs = {
					      '1': '极差'
					      ,'2': '差'
					      ,'3': '中等'
					      ,'4': '好'
					      ,'5' : '非常好'
					    };
					    this.span.text(arrs[value] || ( value + "星"));
					  }
				  });
			 });
			 
		</script>
</body>
</html>