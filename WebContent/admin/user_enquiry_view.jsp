<%@page import="com.db.OrderBy"%>
<%@page import="com.db.Like"%>
<%@page import="com.bean.Users"%>
<%@page import="com.bean.Uenquiry"%>
<%@page import="com.db.EasyDb"%>
<%@page import="java.util.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<style>
a:hover{color:red}
</style>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<style>
a:hover{color:red}
</style>
    <title>user_enquiry</title>
</head>


<body style="background-color: white;font-family: 微软雅黑">
<p style="margin-left:10%;">  
<br/>
<%
	String id = request.getParameter("id");
	EasyDb<Uenquiry> util = new EasyDb<Uenquiry>();
	Uenquiry uenquiry = new Uenquiry();	
	uenquiry.setId(Integer.parseInt(id));
	uenquiry=util.setTable("user_enquire").queryOne(uenquiry);
	String Decorate=null;
	
	if(uenquiry == null ) {
		out.println("<font style='margin-left:10%' color='blue'>无用户信息读取.<br></font>");
	} else {
		
			%>
			<table class="table table-striped table-hover table-bordered" style="width:80%;margin-left:10%; table-layout:fixed; " id="table1" >
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">姓名</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getName() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">手机</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getMobile()%></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">微信</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getWechat()%></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">电子邮箱</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getEmail() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">地址</td>
		<td width="10%" style=" text-align: center;word-break:break-all;word-wrap:break-word;white-space: pre-wrap;"  align="center"><%=uenquiry.getAddress() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">公司</td>
		<td width="10%" style=" text-align: center;word-break:break-all;word-wrap:break-word;white-space: pre-wrap;"  align="center"><%=uenquiry.getCompany() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">房屋类型</td>
		<td width="10%" style=" text-align: center;word-break:break-all;word-wrap:break-word;white-space: pre-wrap;"  align="center"><%=uenquiry.getType() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">预算</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getBudget() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">租期</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getTerm() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">楼层</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getFloor() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">房型</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getLayout() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">面积</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getSize() %>sqm</td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">入住时间</td>
		<td width="10%" style='text-align: center'nowrap align="center"><%=uenquiry.getDate() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center ' nowrap  align="center">区域</td>
		<td width="10%" style=" text-align: center "  nowrap align="center"><%=uenquiry.getArea() %></td>
	</tr>
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center ' nowrap  align="center" >其他需求</td>
		<td width="10%" style=" text-align: center; word-break:break-all;word-wrap:break-word;white-space: pre-wrap;"  align="center"><%=uenquiry.getOtherr()%></td>
	</tr>
		<%
		
	}
	
		%>
		
</table><br/>
<div align="center"><a href="user_enquiry.jsp" title="返回信息查看主界面" class="btn">返回信息查看主界面</a><br/></div>
		
		
		
	
		
	


</body>
</html>