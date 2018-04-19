<%@page import="com.util.TimeUtil"%>
<%@page import="com.bean.Img"%>
<%@page import="com.util.StringUtil"%>
<%@page import="com.bean.House"%>
<%@page import="com.db.EasyDb"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	
	String x = StringUtil.convertString(request.getParameter("x"));
	String y = StringUtil.convertString(request.getParameter("y"));
	String uuid = StringUtil.convertString(request.getParameter("uuid"));
	System.out.println(uuid);
	EasyDb<House> util = new EasyDb<House>();
	House house = new House();
	house.setUuid(uuid);
	house=util.setTable("house_enquire").queryOne(house);
	house.setX(x);
	house.setY(y);	
	util.setTable("house_enquire").update(house);
	out.print("<script>alert('提交成功')</script>");	
	out.print("<script>location.href='addhouse.jsp'</script>");
%>