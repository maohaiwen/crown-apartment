<%@page import="com.bean.House"%>
<%@page import="com.db.EasyDb"%>
<%@page import="com.db.OrderBy"%>
<%@page import="com.db.Like"%>
<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@page import="java.util.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user edit</title>
</head>
<%
	String message = "";// 信息
	String id = request.getParameter("id");
	EasyDb<House> util = new EasyDb<House>();
	House house = new House();
	house.setId(Integer.parseInt(id));
	house.setState(0);
	util.setTable("house_enquire").update(house);
	message="操作成功";
	
	
%>
<body>
<%=message%><br/>
	<a href="house1.jsp">返回房源管理界面</a>

</body>
</html>