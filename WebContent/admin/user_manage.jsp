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
<html>
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
    <title>user_manage</title>
</head>

<body bgcolor="#EDF8FF">
<p style="margin-left:10%;">  
<br/>
<a href="user_add.jsp" title="添加用户" class="btn">添加用户</a></p>
<table class="table table-striped table-hover table-bordered" style="width:80%;margin-left:10%;" id="table1" >
	<tr bgcolor="#BFE6FF">
		<td width="10%" style='text-align: center' nowrap  align="center">用户名</td>
		<td width="10%" style='text-align: center' nowrap align="center">密码</td>
		<td width="10%" style='text-align: center' nowrap align="center">姓名</td>
		<td width="10%" style='text-align: center' nowrap align="center">性别</td>
		<td width="10%" style='text-align: center' nowrap align="center">操作</td>
	</tr>
<%
	EasyDb<Users> util = new EasyDb<Users>();
	Users user = new Users();	
	List<Users> result = new ArrayList();	
	user.setRole(0);
	result=util.setTable("users").queryList(new Users(),new Like("username",""),new OrderBy("id",true));	
	if(result == null || result.size() == 0) {
		out.println("<font style='margin-left:10%' color='blue'>暂法用户信息.<br></font>");
	} else {
		for(int i = 0; result != null && i < result.size() ; i++) {
			%>
		<tr>
			<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getUserName()%></td>
			<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getPassWord()%></td>
			<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getRealName()%></td>
			<td width="10%" style='text-align: center' nowrap align="center"><%=result.get(i).getSex()%></td>
			<td style='text-align: center' width="10%" nowrap align="center">
				<a href="user_edit.jsp?id=<%=result.get(i).getId()%>" title="修改这个用户的信息">修改</a>
			|<a href="user_delete_action.jsp?id=<%=result.get(i).getId()%>"title="删除这个用户">删除</a>
			</td>
		</tr>
		<%
		
	}}
		%>
	
</table>
			
		
	
		
	


</body>
</html>