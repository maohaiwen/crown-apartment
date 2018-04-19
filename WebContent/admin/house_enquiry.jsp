<%@page import="com.db.OrderBy"%>
<%@page import="com.db.Like"%>
<%@page import="com.bean.Users"%>
<%@page import="com.bean.HouseEnquiry"%>
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
    <title>house_enquiry</title>
</head>


<body style="background-color: white;font-family: 微软雅黑">
<p style="margin-left:10%;">  
<br/>
<a href="house_enquiry_deleteall.jsp" title="全部删除" class="btn">全部删除</a></p>
<table class="table table-striped table-hover table-bordered" style="width:80%;margin-left:10%; " id="table1" >
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap align="center">姓名</td>
		<td width="10%" style='text-align: center' nowrap align="center">电话</td>
		<td width="10%" style='text-align: center' nowrap align="center">微信</td>
		<td width="10%" style='text-align: center' nowrap align="center">邮箱</td>
		<td width="10%" style='text-align: center' nowrap align="center">信息</td>
		<td width="10%" style='text-align: center' nowrap align="center">时间</td>
		<td width="10%" style='text-align: center' nowrap align="center">操作</td>
	</tr>
<%
	EasyDb<HouseEnquiry> util = new EasyDb<HouseEnquiry>();
	HouseEnquiry houseEnquiry = new HouseEnquiry();	
	List<HouseEnquiry> result = new ArrayList();	
	result=util.setTable("enquire_house_map").queryList(new HouseEnquiry(),new Like("name",""),new OrderBy("addTime",true));	
	if(result == null || result.size() == 0) {
		out.println("<font style='margin-left:10%' color='blue'>暂时无未读房屋询问消息.<br></font>");
	} else {
		for(int i = 0; result != null && i < result.size() ; i++) {
			%>
		<tr>
			<td width="10%" style="text-align: center;vertical-align:middle;" nowrap align="center"><%= result.get(i).getName()%></td>
			<td width="10%" style="text-align: center;vertical-align:middle;" nowrap align="center"><%= result.get(i).getMobile()%></td>
			<td width="10%" style="text-align: center;vertical-align:middle;" nowrap align="center"><%= result.get(i).getWechat()%></td>
			<td width="10%"  style="text-align: center;vertical-align:middle;" nowrap align="center"><%= result.get(i).getEmail()%></td>
			<td width="20%"  style="text-align: center; word-break:break-all;word-wrap:break-word;white-space: pre-wrap;"><%= result.get(i).getMessage()%></td>
			<td width="10%"  style="text-align: center;vertical-align:middle;" nowrap align="center"><%= result.get(i).getAddTime()%></td>
			<td  style="text-align: center;vertical-align:middle;" width="10%" nowrap align="center">
			<a href="housedetail.jsp?houseUuid=<%=result.get(i).getHouseUuid()%>" title="查看房源信息">查看房源</a>
			|<a href="house_enquiry_delete.jsp?id=<%=result.get(i).getId()%>"title="删除信息">删除</a>
			</td>
		</tr>
		<%
		
	}}
		%>
	
</table>
			
		
	
		
	


</body>
</html>