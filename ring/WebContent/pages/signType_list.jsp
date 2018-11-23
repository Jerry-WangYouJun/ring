<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员约会信息</title>
<style type="text/css">
  .panel-body {
    padding: 0px !important; 
}
</style>	

</head>
<body id="a2">
	<div >
			<div >
				  <div class="panel-body" id="a3" style="display:block">
				  	    <table id="infoTable"> </table>
					<div id="toolbar" class="btn-group">  
			        </div>  
				  </div>
			</div>
		</div>
		
		<!-- /.modal -->
</body>
<script type="text/javascript">
		
		
		$(function(){
			    $('#infoTable').bootstrapTable({  
			        url : '${basePath}/invite/query?inviteStates=6', // 请求后台的URL（*）            
			        method : 'get', // 请求方式（*）  
			        toolbar : '#toolbar', // 工具按钮用哪个容器  
			        cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）  
			        sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）  
			        pagination : true, // 是否显示分页（*）  
			        pageNumber: 1,    //如果设置了分页，首页页码  
			        pageSize: 10,                       //每页的记录行数（*）  
			        pageList: [10,30,50],        //可供选择的每页的行数（*）  
			        queryParamsType:'',
			        singleSelect    : true,   
			        showRefresh : true, // 是否显示刷新按钮  
			        clickToSelect : true, // 是否启用点击选中行  
			        showToggle : false, // 是否显示详细视图和列表视图的切换按钮  
			        search:true,   //是否启用搜索框 
			        
			        columns : [ {  
			            checkbox : true 
			        },{  
			            field : 'id', visible: false 
			        },{  
			            field : 'customerFrom.chName',   title : '邀请人',  align: 'center',   valign: 'middle'  
			        },{  
			            field : 'customerJoin.chName',   title : '应邀人',  align: 'center',   valign: 'middle'  
			        },{  
			            field : 'inviteDate',   title : '约会时间',  align: 'center',   valign: 'middle',
			            	//获取日期列的值进行转换
			                formatter: function (value, row, index) {
			                    return changeDateFormat(value)
			                }
			        },{  
			            field : 'pointLocation.locName',   title : '约会地点',  align: 'center',   valign: 'middle'
			        },{  
			            field : 'inviteStates',   title : '约会状态',  align: 'center',   valign: 'middle'  ,
			            formatter : function(value, row, index, field) {
							return getDicDescirb(value, field);
						}
			        }
			       /*  ,{
                         title:"操作",align: 'center', 
                         formatter:function(value,row,index){     //把需要创建的按钮封装在函数中
                             return "<button class='btn btn-default' id='details' href='point_detail_list.jsp' data-toggle='modal' data-target='#detailModal'>积分详情</button>"
                         }
			         } */
			        ],
			        silent : true, // 刷新事件必须设置  
			    });  
			    
			    
		});
		
		
	</script>
	
		
</html>