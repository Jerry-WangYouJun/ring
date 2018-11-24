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
<script src="${basePath}/ring/assets/js/bootstrap/bootstrap.js"></script>
<script type="text/javascript">
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
		
		function signUp(){
			var path = "${pageContext.request.contextPath}/invite/signUp?id=${inviteId}";
			$.ajax({
				url : path,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert(data.msg);
					} else {
						alert(data.msg);
					}
		
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			});
		}
		
		function evaluateDate(id){
			 window.location.href="${pageContext.request.contextPath}/ring/evaluate.jsp"
		}
</script>
</head>
<body>
		<div class="container-fluid">
			 <div class="row">
                        <div class="">
                            <!-- col-lg-4 start here -->
                            <div class="panel panel-default plain profile-widget">
                                <!-- Start .panel -->
                                <div class="panel-heading pink-bg">
                                    <h4 class="panel-title"><i class="ec-user"></i> 个人信息</h4>
                                </div>
                                <div class="panel-body">
                                    <div class="col-lg-4 col-md-4 col-sm-12">
                                        <div class="profile-avatar">
                                            <img class="img-responsive" src="${pageContext.request.contextPath}/ring/images/p3.jpg" alt="@roybarberuk">
                                        </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8 col-sm-12">
                                        <div class="profile-name">
                                            SuggeElson <span class="label label-success">admin</span>
                                        </div>
                                        <div class="profile-quote">
                                            <p>Building new app with yeoman generator plus grunt and bower, it`s awesome</p>
                                        </div>
                                        <div class="profile-stats-info">
                                            <a href="#" class="tipB" title="Views"><i class="im-eye2"></i> <strong>5600</strong></a>
                                            <a href="#" class="tipB" title="Comments"><i class="im-bubble"></i> <strong>75</strong></a>
                                            <a href="#" class="tipB" title="Likes"><i class="im-heart"></i> <strong>45</strong></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- col-lg-4 end here -->
                        <div class="">
                            <!-- col-lg-4 start here -->
                            <div class="panel panel-default plain">
                                <!-- Start .panel -->
                                <div class="panel-heading pink-bg">
                                    <h4 class="panel-title"><i class="ec-user"></i> 约会信息</h4>
                                </div>
                                <div class="panel-footer white-bg">
                                    <ul class="profile-info">
                                        <li><i class="ec-mobile"></i> +234 345 887</li>
                                        <li><i class="ec-location"></i> Spain, Barcelona</li>
                                        <li><i class="ec-mail"></i> suggeelson@suggelson.com</li>
                                        <li><i class="im-office"></i> Web developer</li>
                                        <li><i class="fa-bitbucket"></i> code@suggelab.com</li>
                                    </ul>
                                </div>
                                <div class="panel-body">
                                    <form class="form-vertical hover-stripped" role="form" id="dataForm" action="${basePath}/web/evaluateAdd" method="post">
                                    <input type="hidden" name="fromId" value="${customer.id }">
                                    <input type="hidden" name="dateingId" value="${invite.id }">
                                     <input type="hidden" name="toId" value="${evaluateCust.id}">
                                     <input type="hidden" name="evaluateIds" id="evaluateIds" >
                                        <div class="form-group">
                                            <label class="control-label mt10">添加标签</label>
                                             <input type="text" class="form-control col-lg-6 col-md-6"  id="tagA"  onchange="addTags()">
	                                        <div class="tags" >
					                        </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">评价</label>
                                            <textarea class="form-control" rows="3"></textarea>
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
		</script>
</body>
</html>