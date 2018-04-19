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
	EasyDb<Uenquiry> util = new EasyDb<Uenquiry>();
	Uenquiry uenquiry = new Uenquiry();	
	List<Uenquiry> result = new ArrayList<Uenquiry>();	
	result=util.setTable("user_enquire").queryList(uenquiry,new Like("name",""),new OrderBy("id",true));	
	for(int i = 0;i < result.size(); i ++)
	{
		util.setTable("user_enquire").delete(result.get(i).getId());
	}
	
	//out.println("<font align='center' color='red'>全部删除成功.<br></font>");
	
		
			%>
	<div align="center" style="text-align: center; ">
<font align='center' color='red'>全部删除成功.<br></font>
</div>
<br/>
		
<br/>
<div align="center"><a href="user_enquiry.jsp" title="返回信息查看主界面" class="btn">返回信息查看主界面</a><br/></div>
</body>
</html>