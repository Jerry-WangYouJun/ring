<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="basePath" value="${pageContext.request.contextPath}" scope="request"></c:set>
<script type="text/javascript" src="${basePath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script src="${basePath}/js/validate/jquery.validate.min.js"></script>
<script src="${basePath}/js/validate/jquery.metadata.js"></script>
<script src="${basePath}/js/validate/messages_zh.js"></script>
<script src="${basePath}/js/base.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/JavaScript" src="${basePath}/js/jquery.form.js"></script>

<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 

<style>
.error{
	 color:red;
}
</style>
<script type="text/javascript">
	var dic = eval('(${dic})');
		$(function(){
			//$("#dataForm").validate();
		});
		
		function addInfo() {
			$(':input', '#dataForm').not(':button,:submit,:reset').val(
			'').removeAttr('checked').removeAttr('checked');
			$("#myModal").modal("show");
		}
		
		function updateData() {
			var selectRow =  $("#infoTable").bootstrapTable('getSelections')[0];
			SetFromValues($("#dataForm"),selectRow);
			$("#myModal").modal("show");
		}
		function SetFromValues(el, data)
		{
		    for (var p in data)
		    {
		        el.find(":input[name='" + p + "']").val(data[p]);
		    } 
		}
		
		function subInfoAll(name) {
			
			if(!$("#dataForm").validate().form()){
				return false ; 
			}
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
						closeModel();
					} else {
						alert(data.msg);
					}
		
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			});
		}
		
		function closeModel() {
			$("#myModal").modal("hide");
			$(':input', '#dataForm').not(':button,:submit,:reset').val(
					'').removeAttr('checked').removeAttr('checked');
			
		}
		function deleteDataAll(name) {
			var del = confirm("确认删除？");
			if (!del) {
				return false;
			}
			var selectObj = $("#infoTable").bootstrapTable('getSelections')[0];
			var id = selectObj.id;
			if (id > 0) {
				var path = "${basePath}/"+name+"/"+name+"_delete";
				$.ajax({
					url : path,
					type : 'post',
					data:{'id':id},
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							alert( data.msg);
							$("#infoTable").bootstrapTable("refresh");
						} else {
							alert( data.msg);
						}
		
					},
					error : function(transport) {
						alert( "系统产生错误,请联系管理员!");
					}
				});
			}
		}
		
		function checkUnique(name , column , value ){
			var path = "${pageContext.request.contextPath}/"+name+"/"+name+"_unique";
			$.ajax({
				url : path,
				type : 'post',
				data :  {name:value},
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						
					} else {
						alert(data.msg);
						$("#" + column).val("");
					}
		
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			});
		}
		
		function remarkData() {
			var selectRow =  $("#infoTable").bootstrapTable('getSelections');
			console.info($("#infoTable").bootstrapTable('getSelections'));
			if($("#infoTable").bootstrapTable('getSelections').length  > 0){
				$(".no-records-found").hide();
				for(var i in selectRow){
					var txt = "<tr><td>" + selectRow[i].iccid + "</td>"+
					"<td><input  name='remark' value=' ' ><input name='iccid' type='hidden' value='"+
					 selectRow[i].iccid  +"'></td></tr>" ;
					$("#remarks").append(txt);
					
				}
				$("#reamrkModal").modal("show");
			}
		}
		
		function subRemark(name){
			var path = "${basePath}/treeindex/updateRemark/" + name;
			$.ajax({
				url : path,
				type : 'post',
				data : $("#remarkForm").serialize(),
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert(data.msg);
						$("#infoTable").bootstrapTable("refresh");
						$("#reamrkModal").modal("hide");
						$("#remarks").empty();
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
			if($('#datetimepicker1')[0] != undefined){
				$('#datetimepicker1').datetimepicker({  
					minView: "month",
					format: 'yyyy-mm-dd',
				    todayBtn: true,//显示今日按钮
				    autoclose: true,
				    language:"zh-CN",
				    clearBtn: true 
				});
			}
		});
		

		function getDicDescirb(value, field) {
			
			if (dic.hasOwnProperty(field) && dic[field][value] != undefined) {
				return dic[field][value]["describ"];
			} else {
				return "-";
			}
		}
		
		//转换日期格式(时间戳转换为datetime格式)
	    function changeDateFormat(cellval) {
	        var dateVal = cellval + "";
	        if (cellval != null) {
	            var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
	            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
	            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
	            
	            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
	            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
	            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
	            
	            return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
	        }
	    }
		

</script>