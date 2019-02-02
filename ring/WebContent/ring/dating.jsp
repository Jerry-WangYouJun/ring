<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>约会信息</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/jquery.metadata.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/messages_zh.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<link href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
 <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel="stylesheet" />

<style>
.error{
	 color:red;
}
</style>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
.grid_3{
	 padding: 20px;20px
}

.rcolor{
	color:black;
}

</style>
<script>

$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
    
    if($('.datetimepicker1')[0] != undefined){
		$('.datetimepicker1').datetimepicker({  
			minView: "month",
			format: 'yyyy-mm-dd hh:00',
		    todayBtn: false,//显示今日按钮
		    autoclose: true,
		    language:"zh-CN",
		    clearBtn: true ,
		    startDate: new Date(),
		    minView: 1
		}).on('changeDate', function(ev){
			   var select = ev.date.getHours();
			   var flag = true
			    if( select > 21 || select < 9){
			    		alert("时间不合适，只能选择早9点到晚8点之间的时间") ;
				    $(this).children()[0].value = ""
			    }
		});
	}
    
 
    
    $('.datetimepicker1').datetimepicker('setEndDate',addDate(new Date() , 14));  
    
});

$(function(){
	 var dic = eval('(${dic})');
	$(".dicValue").each(function(){
		 var field  = $(this).attr("name")
		 var value =  $(this).attr("value");
		 if(dic[field] !=undefined && dic[field][value]!= undefined){
			 $(this).text(dic[field][value]["describ"]);
		 }
	})
	if(parseInt("${cust.inviteFlag}")  > 0){
		 $("#flag").hide()
	}
});

function addDate(date,days){ 
    var d=new Date(date); 
    d.setDate(d.getDate()+days); 
    var m=d.getMonth()+1; 
    return d.getFullYear()+'-'+m+'-'+d.getDate(); 
  } 
  
  function getLocaInfo(obj){
	   var path = "${pageContext.request.contextPath}/location/detail";
		$.ajax({
			url : path,
			type : 'post',
			data : {id:$(obj).prev().val()},
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					$("#locName").text(data.obj.locName == 'null'?'':data.obj.locName);
					$("#workDate").text(data.obj.workDate);
					$("#workTime").text(data.obj.workTime == null?'':data.obj.workTime);
					$("#telephone").text(data.obj.telephone == null?'':data.obj.telephone);
					$("#location").text(data.obj.location);
					$("#address").text(data.obj.address);
					$("#detailModal").modal("show");
					
				} else {
					alert(data.msg);
				}
			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
  }
  
</script>
</head>
<body id="a2">
	<%@include file="/ring/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<div class="grid_3">
  <div class="container">
   <div class="services">
   	  <div class="col-sm-6 login_left">
   	  	<div><span  style='color:red'>约会时间只能选择两周之内的时间</span></div>
	     <form id="dataForm">
						<input class="form-control" name="id" type="hidden" value="${inv.id }"></input>
						<input class="form-control" name="inviteStates" type="hidden" value="${inv.inviteStates }"></input>
						<input class="form-control" name="joinId" type="hidden" value="${joinId }"></input>
								<div class="form-group" >
							            <label for="message-text" class="control-label">约会时间一：</label>  
							            <!--指定 date标记-->  
								            <div class='input-group date  col-lg-12 datetimepicker1'  >  
								                <input type='text' class="form-control"  name="preDate" id="preDate" />  
								                <span class="input-group-addon" >  
								                    <span class="glyphicon glyphicon-calendar"></span>  
								                </span>  
								            </div>
										<label for="message-text" class="control-label">约会地点一:</label> 
										<div class="form-inline">
											<select
												class="form-control dicSelect col-lg-10"  id="confirmLoc" name="confirmLoc" 
												placeholder="必填" >
														<option value="">-请选择-</option>
												  <c:forEach items="${locList}" var ="loca">
												  		<option value="${loca.id}"> ${loca.locName}</option>
	 											  </c:forEach>
											</select>
											<input type="button" class="btn btn-link" value="查看约会地点" onclick="getLocaInfo(this)">
										</div>
						        </div> 
								
								<div class="form-group" >
							            <label for="message-text" class="control-label">约会时间二：</label>  
							            <!--指定 date标记-->  
								            <div class='input-group date  col-lg-12 datetimepicker1'  >  
								                <input type='text' class="form-control"  name="preDate2"  id="preDate2" />  
								                <span class="input-group-addon" >  
								                    <span class="glyphicon glyphicon-calendar"></span>  
								                </span>  
								            </div>
								            <label for="message-text" class="control-label">约会地点二:</label>
								            <select
												class="form-control dicSelect" id="confirmLoc2" name="confirmLoc2" 
												placeholder="必填" >
												<option value="">-请选择-</option>
												  <c:forEach items="${locList}" var ="loca">
												  		<option value="${loca.id}"> ${loca.locName}</option>
	 											  </c:forEach>
											</select>
										<input type="button" class="btn btn-link" value="查看约会地点" onclick="getLocaInfo(this)">
						        </div> 
								
								<div class="form-group" >
							            <label for="message-text" class="control-label">约会时间三：</label>  
							            <!--指定 date标记-->  
								            <div class='input-group date  col-lg-12  datetimepicker1'  >  
								                <input type='text' class="form-control"  name="preDate3"  id="preDate3" />  
								                <span class="input-group-addon" >  
								                    <span class="glyphicon glyphicon-calendar"></span>  
								                </span>  
								            </div>
										<label for="message-text" class="control-label">约会地点三:</label> 
											<select 
													class="form-control dicSelect" id="confirmLoc3" name="confirmLoc3" 
													placeholder="必填" >
													<option value="">-请选择-</option>
													  <c:forEach items="${locList}" var ="loca">
													  		<option value="${loca.id}"> ${loca.locName}</option>
		 											  </c:forEach>
												</select>
												<input type="button" class="btn btn-link" value="查看约会地点" onclick="getLocaInfo(this)">
						        </div> 
								
						
						<div class="form-group">
							<button type="button" class="btn btn-primary" onclick="subInfo()">提交</button>
							<button type="button" class="btn btn-primary" onclick="window.history.back()"> 返回上一步</button>
						</div>
					</form>
	  </div>
	  <div class="clearfix"> </div>
   </div>
  </div>
</div>
<div class="modal fade" id="detailModal"  role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content"  >
					<div class="modal-body" style="height:250px;background-color: #f6f6f6">
							  店铺信息
						 	 <div class="list-main-cot"  style="margin-top: 10px">
						        <div class="list-main-introduce">
						            <ul style="padding: 10px">
						                <li><span class="col-xs-5 spanleft" style="text-align: right">店铺名</span><span class="col-xs-7 rcolor" id="locName" style="color:black;">店铺名</span></li>
						                <li><span class="col-xs-5 spanleft" style="text-align: right">工作日</span><span class="col-xs-7 rcolor" id="workDate"></span></li>
										<li><span class="col-xs-5 spanleft" style="text-align: right">营业时间</span><span class="col-xs-7 rcolor" id="workTime"></span></li>
										<li><span class="col-xs-5 spanleft" style="text-align: right">联系电话</span><span class="col-xs-7 rcolor" id="telephone"></span></li>
										<li><span class="col-xs-5 spanleft" style="text-align: right">所在区</span><span class="col-xs-7 rcolor"  id="location"></span></li>
										<li><span class="col-xs-5 spanleft" style="text-align: right">具体地址</span><span class="col-xs-7 rcolor" id="address"></span></li>
						            </ul>
						        </div>
						    </div>
					 </div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
</body>
<script type="text/javascript">
 
	function subInfo() {
		var flag = false;
		  if($("#preDate").val() != "" && $("#confirmLoc").val() != ""){
					   flag = true;
		  }
		var flag2 = false;
		  if($("#preDate2").val() != "" && $("#confirmLoc2").val() != ""){
			   flag2 = true;
			 }
		var flag3 = false ;
		  if($("#preDate3").val() != "" && $("#confirmLoc3").val() != ""){
			   flag3 = true;
		   }
		if(flag || flag2 || flag3){
			subInfoAll("invite");
		}else{
			alert("约会信息最少填写一组完整的时间和地点")
		}
	}
	
	function subInfoAll(name) {
		
		var path = "${pageContext.request.contextPath}/"+name+"/"+name+"_edit";
		$.ajax({
			url : path,
			type : 'post',
			data : $("#dataForm").serialize(),
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					alert(data.msg);
					$("#infoTable").bootstrapTable("refresh");
					window.location.href="${pageContext.request.contextPath}/web/info";
				} else {
					alert(data.msg);
				}
	
			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
	}
	
	
	$(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/location/query",
			type : 'post',
			dataType : 'json',
			success : function(data) {
				var htmlStr = "";
				for( var  s in data.rows ){
				htmlStr += "<option value="+data.rows[s].id+">"+data.rows[s].locName+"</option>"
				 }
				 $("#pointId").append(htmlStr); 
			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
	});
</script>


</html>