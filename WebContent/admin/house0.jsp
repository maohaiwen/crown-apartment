<%@page import="com.bean.House"%>
<%@page import="com.db.EasyDb"%>
<%@page import="com.db.OrderBy"%>
<%@page import="com.db.Like"%>
<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@page import="java.util.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6 lt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7 lt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8 lt8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->
<title>房源管理</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"> 
	function reload() {
		location.reload(); 
	}
	function recommend() {
		if($("#recommend").is(":hidden")){
			$("#recommend").slideDown(300);
		}else{
			$("#recommend").slideUp(300);
		}
	}
	function dorecommend() {
		var frm = document.getElementById("recommendform");
		frm.submit();
	}
	function rent(id){
		$("#house_id").val(id);
		$("#myModal").modal('show')
	}
	function dorent(){
		var houseId = $("#house_id").val();
		var expire_date = $("#expire_date").val();
		if(expire_date == ''){
			alert("请输入到期时间！");
			return;
		}
		location.href = "dorent.jsp?id="+parseInt(houseId)+"&expire_date="+expire_date;		
	}
	
</script> 

<style type="text/css">
.d_contain {
	width: 100%;
	height: 100%;
	position: absolute;
}

.d_head {
	width: 100%;
	height: 10%;
	text-align: center;
	padding-top: 2%;
}

.d_main {
	width: 95%;
	height: 70%;
	text-align: center;
	padding-left: 2.5%
}

.d_foot {
	width: 100%;
	text-align: center;
}

.d_search{
	margin-top: 40px;
}

.d_search input[type=text] {
	margin-left:10px;
}
</style>
</head>
<body > 
	<div class="d_contain">
		<div class="d_main">
			<input type="hidden" id="house_id"/>
			<div id="d_data" class="d_search" style="text-align: left;">				
					<button type="button" style="margin-left: 8%;margin-bottom: 10px;" class="btn" onclick="reload()">刷新</button>		
					<button type="button" style="margin-left: 1%;margin-bottom: 10px;" class="btn" onclick="recommend()">推荐</button>			
			</div>
			<div id="recommend" style="width:60%;background:white;padding-top:20px;display:none;">
			<form id="recommendform" action="dorecommend.jsp" method="post">
				<table class="tb_detail" style="border:0;">
				请依次填写推荐的房源ID，中间以","(英文)隔开（如1,2,3,4,5,6,7,8）。
					<tr>
					<td>
					<input type="text" id="name" name="name" style="width:400px;height:30px;" required="required"/>						
					</td>	
					<td style="text-align: center;" >
							<input type="button" style="width:80px;height:30px;border:0;border-radius:5px;
							background:#4169E1;color:white;font-size: 18px;cursor: pointer;"
							 onclick="dorecommend()" value="Submit"/>
						</td>	
					</tr>
					
				</table>
			</form>
			</div>
			<div id="d_goods" style=" text-align: left;margin-top:5%;margin-left:5%;">
				
				<table id="t_goods"
					class="table table-striped table-hover table-bordered" style="width:90%;">
					<tr align="center">
						<td align="center" style="width:30px;text-align: center;">编号</td>
						<td align="center" style="width:30px;text-align: center;">房东姓名</td>
						<td  align="center" style="width:30px;text-align: center;">手机号码</td>
						<td  align="center" style="width:30px;text-align: center;">固定电话</td>
						<td  align="center" style="width:30px;text-align: center;">邮箱地址</td>
						<td  align="center" style="width:50px;text-align: center;">操作</td>
					<%
	EasyDb<House> util = new EasyDb<House>();
	House house = new House();	
	house.setState(0);
	List<House> result = new ArrayList();	
	result=util.setTable("house_enquire").queryList(house,new Like("owner",""),new OrderBy("addTime",true));	
	if(result == null || result.size() == 0) {
		out.println("<font style='margin-left:10%' color='blue'>暂无房源信息.<br></font>");
	} else {
		for(int i = 0; result != null && i < result.size() ; i++) {
			%>
		<tr>
		<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getId()%></td>
			<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getOwner()%></td>
			<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getMobile()%></td>
			<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getPhone()%></td>
			<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getEmail()%></td>
			<td style='text-align: center' width="10%" nowrap align="center">
			<a href="housedetail.jsp?id=<%=result.get(i).getId()%>" title="详情">详情</a>
			|<a href="doalterhouse.jsp?id=<%=result.get(i).getId()%>"title="修改">修改</a>
			|<a href="javascript:void(0)" onclick="rent(<%=result.get(i).getId()%>)" data-toggle="modal" title="租出">租出</a>
			|<a href="dodelete.jsp?id=<%=result.get(i).getId()%>"title="删除">删除</a>
			</td>
		</tr>
		<%
		
	}}
		%>
				</table>
			</div>
		</div>
		
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">请输入到期日期</h4>
				</div>
				<div class="modal-body">
					<input type = "date" id="expire_date"/>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" 
					onclick="dorent()">租出</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
</body>
</html>