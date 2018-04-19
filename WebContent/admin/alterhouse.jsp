<%@page import="com.mysql.jdbc.EscapeTokenizer"%>
<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@page import="com.bean.House"%>
<%@page import="com.util.*" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user edit</title>
</head>
<%
	String message = "";// 信息
	String id = StringUtil.convertString(request.getParameter("id"));
	String money = StringUtil.convertString(request.getParameter("money"));
	String houseType = StringUtil.convertString(request.getParameter("type"));
	String district = StringUtil.convertString(request.getParameter("district"));
	String size = StringUtil.convertString(request.getParameter("size"));
	String floor = StringUtil.convertString(request.getParameter("floor"));
	String shi = StringUtil.convertString(request.getParameter("shi"));
	String ting = StringUtil.convertString(request.getParameter("ting"));
	String wei = StringUtil.convertString(request.getParameter("wei"));
	String year = StringUtil.convertString(request.getParameter("year"));
	String month = StringUtil.convertString(request.getParameter("month"));
	String address = StringUtil.convertString(request.getParameter("address"));
	String desc = StringUtil.convertString(request.getParameter("desc"));
	String changeState = StringUtil.convertString(request.getParameter("changeState"));
	
	String[] amen=request.getParameterValues("Amenities");
	 String amenf=new String();
	 for(int i=0;i<amen.length-1;i++)
	 {
		 //amen[i]="√"+amen[i];
		 amenf=amenf+amen[i]+" "+"|"+" ";
	 }
	 amenf=amenf+amen[amen.length-1];
	EasyDb<House> util = new EasyDb<House>();
	House house = new House();
	if(money != null && !money.equals("")){
		house.setMoney(Integer.valueOf(money));
	}
	if(district != null && !district.equals("")){
		house.setDistrict(district);
	}
	if(size != null && !size.equals("")){
		house.setSize(Integer.parseInt(size));
	}
	if(shi != null && !shi.equals("")){
		house.setShi(Integer.parseInt(shi));
	}
	if(wei != null && !wei.equals("")){
		house.setWei(Integer.parseInt(wei));
	}
	if(floor != null && !floor.equals("")){
		house.setFloor(Integer.parseInt(floor));
	}
	if(changeState.equals("1")){
		house.setState(0);
	}
	String layout = shi+"Bedroom" +" "+"|" +" "+ting + "Living room" +" "+"|" +" "+ wei + "Bathroom";	
	if(year != null && !year.equals("")){
		house.setYear(Integer.parseInt(year));
	}
	if(month != null && !month.equals("")){
		house.setMonth(Integer.parseInt(month));
	}
	house.setType(Integer.parseInt(houseType));
	house.setAddress(address);
	house.setLayout(layout);
	house.setAmenf(amenf);
	house.setDescribes(desc);
	house.setId(Integer.parseInt(id));
	util.setTable("house_enquire").update(house);
	message="修改成功！";
%>
<body>
	<%= message%>
</body>
</html>