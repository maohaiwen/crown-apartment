<%@page import="com.util.TimeUtil"%>
<%@page import="com.bean.HouseEnquiry"%>
<%@page import="com.db.EasyDb"%>
<%@page import="com.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String houseid = StringUtil.convertString(request.getParameter("house_id"));
	String houseUuid = StringUtil.convertString(request.getParameter("house_uuid"));
	String name = StringUtil.convertString(request.getParameter("name"));
	String wechat = StringUtil.convertString(request.getParameter("wechat"));
	String email = StringUtil.convertString(request.getParameter("email"));
	String mobile = StringUtil.convertString(request.getParameter("mobile"));
	String message = StringUtil.convertString(request.getParameter("message"));
	
	HouseEnquiry enq = new HouseEnquiry();
	enq.setHouseUuid(houseUuid);
	enq.setName(name);
	enq.setWechat(wechat);
	enq.setEmail(email);
	enq.setMobile(mobile);
	enq.setMessage(message);
	enq.setAddTime(TimeUtil.getCurrentTime());
	
	EasyDb<HouseEnquiry> util = new EasyDb<HouseEnquiry>();
	util.setTable("enquire_house_map").insert(enq);
	
	session.setAttribute("success", "enquire successfully!");
	request.setAttribute("id", houseid);
	response.sendRedirect("housedetail.jsp");
%>