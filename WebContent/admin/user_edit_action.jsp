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
	String message = "";// 错误信息
	String id = request.getParameter("id");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String realname = request.getParameter("realname");
	String sex = request.getParameter("sex");
	if((username==null)||(password==null)||(realname==null))
	{
		message="信息不能为空，修改失败";
	}
	else{
	EasyDb<Users> util = new EasyDb<Users>();
	Users user = new Users();
	user.setId(Integer.parseInt(id));
	user.setUserName(username);
	user.setPassWord(password);
	user.setRealName(realname);
	user.setSex(Integer.parseInt(sex));
	user.setRole(0);
	util.setTable("users").update(user);
	message="修改成功";
	}
	
%>
<body>
<%=message%><br/>
	<a href="javascript:history.back();">返回上一页</a><br/>
	<a href="user_manage.jsp">返回用户管理界面</a>

</body>
</html>