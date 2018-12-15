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
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>

<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 

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
    
    $(".selectpicker").selectpicker({  
        noneSelectedText : '请选择'//默认显示内容  
    });  
});

function addDate(date,days){ 
    var d=new Date(date); 
    d.setDate(d.getDate()+days); 
    var m=d.getMonth()+1; 
    return d.getFullYear()+'-'+m+'-'+d.getDate(); 
  } 
</script>
</head>
<body id="a2">
	<div class="grid_3">
  <div class="container">
   <div class="services">
   	  <div class="col-sm-6 login_left">
	     <form id="dataForm">
						<input class="form-control" name="id" type="hidden" value="${inv.id }"></input>
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
						        </div> 
								<div class="form-group">
									<label for="message-text" class="control-label">约会地点一:</label> 
											  <c:forEach items="${locList}" var ="loca">
											 	    <input type="radio"   name="confirmLoc"  class = "confirmLoc" value="${loca.id}">:${loca.location} - ${loca.address}
 											  </c:forEach>
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
						        </div> 
								<div class="form-group">
									<label for="message-text" class="control-label">约会地点二:</label> 
											  <c:forEach items="${locList}" var ="loca">
											 	    <input type="radio"   name="confirmLoc2"   class="confirmLoc2" value="${loca.id}">:${loca.location} - ${loca.address}
 											  </c:forEach>
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
						        </div> 
								<div class="form-group">
									<label for="message-text" class="control-label">约会地点三:</label> 
											  <c:forEach items="${locList}" var ="loca">
											 	    <input type="radio"   name="confirmLoc3"  class="confirmLoc3" value="${loca.id}">:${loca.location} - ${loca.address}
 											  </c:forEach>
								</div>
								
						
						<div class="form-group">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary" onclick="subInfo()">提交</button>
						</div>
					</form>
	  </div>
	  <div class="clearfix"> </div>
   </div>
  </div>
</div>
</body>
<script type="text/javascript">
 
	function subInfo() {
		var flag = false;
		if( $("#preDate").val() != ""){
			$(".confirmLoc").each(function(){
				  if($(this).is(':checked')){
					   flag = true;
				  }
			})
		  if(!flag){
			  $("#preDate").val("") ;
		  }
		}
		var flag2 = false;
		if( $("#preDate2").val() != ""){
			$(".confirmLoc2").each(function(){
				  if($(this).is(':checked')){
					   flag2 = true;
				  }
			})
				  if(!flag2){
					  $("#preDate2").val("") ;
				  }
		}
		var flag3 = false ;
		if( $("#preDate3").val() != ""){
			$(".confirmLoc3").each(function(){
				  if($(this).is(':checked')){
					   flag3 = true;
				  }
			})
				  if(!flag3){
					  $("#preDate3").val("") ;
				  }
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
				console.info(data.rows[s].id);
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