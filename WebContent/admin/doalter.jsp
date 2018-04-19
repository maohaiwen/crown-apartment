<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String passWord0 = request.getParameter("apassword");
	String passWord1 = request.getParameter("userPw1");
	String passWord2 = request.getParameter("userPw2");
	System.out.println(passWord0);
	System.out.println(passWord1);System.out.println(passWord2);
	
	EasyDb<Users> util = new EasyDb<Users>();
	Users user = new Users();
	user.setUserName("admin");
	user.setPassWord(passWord0);
	user = util.setTable("users").queryOne(user);
	if(user == null){
		request.setAttribute("msg", "原密码输入错误");
		request.getRequestDispatcher("alterpw.jsp").forward(request, response);
	}
	else{
		if(passWord1.equals(passWord2) ){
			user.setPassWord(passWord1);	
			util.setTable("users").update(user);
			request.setAttribute("msg", "修改成功，请牢记密码");
			request.getRequestDispatcher("alterpw.jsp").forward(request, response);
		}
		else{
				request.setAttribute("msg", "修改失败:两次密码输入不一致");
				request.getRequestDispatcher("alterpw.jsp").forward(request, response);
			}
	}	
%>