<%@page import="com.mysql.jdbc.EscapeTokenizer"%>
<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@page import="com.bean.House"%>
<%@page import="com.bean.Img"%>
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
	//house=util.setTable("house_enquire").queryOne(house);
	//String uuid=house.getUuid();
	util.setTable("house_enquire").delete(Integer.parseInt(id));
	/* EasyDb<Img> util1 = new EasyDb<Img>();
	Img img=new Img();
	img.setHouseId(uuid);
	util1.setTable("imgs").delete(id) */
	message="删除成功";
	
	
%>
<body>
<%=message%><br/>
	<div align="left" style="margin-left: 250px;"><input type="button" class="btn" name="return" value="返回" onclick="javascript:window.history.back(-1);"><br/></div>

</body>
</html>