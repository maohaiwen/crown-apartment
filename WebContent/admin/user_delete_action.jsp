<%@page import="com.mysql.jdbc.EscapeTokenizer"%>
<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
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
	EasyDb<Users> util = new EasyDb<Users>();
	Users user = new Users();
	user.setId(Integer.parseInt(id));
	util.setTable("users").delete(Integer.parseInt(id));
	message="删除成功";
	
	
%>
<body>
<%=message%><br/>
	<a href="user_manage.jsp">返回用户管理界面</a>

</body>
</html>