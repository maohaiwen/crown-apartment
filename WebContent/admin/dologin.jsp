<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String userName = request.getParameter("username");
	String passWord = request.getParameter("password");
	EasyDb<Users> util = new EasyDb<Users>();
	Users user = new Users();
	user.setUserName(userName);
	user.setPassWord(passWord);
	Users user1 = util.setTable("users").queryOne(user);
	if(userName.equals("") || passWord.equals("")){
		request.setAttribute("fail", "请填写完整的登录信息");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}else if(user1 == null){
		request.setAttribute("fail", "登录失败，请检查用户名或密码");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}else{
		session.setAttribute("user", user1);
		response.sendRedirect("index.jsp");
		//request.getRequestDispatcher("index.jsp").forward(request, response);
	}
%>