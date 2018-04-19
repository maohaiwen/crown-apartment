<%@page import="com.bean.Uenquiry"%>
<%@page import="javax.xml.transform.Templates"%>
<%@page import="com.bean.Img"%>
<%@page import="com.util.StringUtil"%>
<%@page import="com.bean.House"%>
<%@page import="com.db.EasyDb"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	 String name=request.getParameter("name");
	 String mobile=request.getParameter("mobile");
	 String wechat=request.getParameter("wechat");
	 String email=request.getParameter("e_mail");
	 String address=request.getParameter("address");
	 String company=request.getParameter("company");
	
	 String[] type_tem=request.getParameterValues("type");
	 String type=new String();
	 for(int i=0;i<type_tem.length-1;i++)
	 {
		
		 type=type+type_tem[i]+" "+"|"+" ";
	 } 
	 type=type+type_tem[type_tem.length-1];
	 Integer budget=Integer.parseInt(request.getParameter("budget"));
	 
	 String year=request.getParameter("year");
	 String month=request.getParameter("month");
	 String term=year+"年"+month+"月";
	 
	 
	 String bathrooms=request.getParameter("bathrooms");
	 String bedrooms=request.getParameter("bedrooms");
	 String living=request.getParameter("living");
	 String otherlayout=request.getParameter("otherlayout");
	 
	 String layout = bedrooms + "bedrooms"+" "+"|"+" "+ living+"living room"+" "+"|"+" "+bathrooms+"bathrooms"+" "+"|"+" "+otherlayout;
	 Integer size=Integer.parseInt(request.getParameter("floors"));
	 Integer floor=Integer.parseInt(request.getParameter("size"));
	 String date=request.getParameter("date");
	 
	 String[] area_tem=request.getParameterValues("area");
	 String area=new String();
	
	 for(int i=0;i<area_tem.length-1;i++)
	 {
		
		 area=area+area_tem[i]+" "+"|"+" ";
	 } 
	 area=area+area_tem[area_tem.length-1];
	 String otherr=request.getParameter("otherr");
	EasyDb<Uenquiry> util = new EasyDb<Uenquiry>();
	Uenquiry uenquiry = new Uenquiry();
	uenquiry.setName(name);
	uenquiry.setWechat(wechat);
	uenquiry.setAddress(address);
	uenquiry.setArea(area);
	uenquiry.setBudget(budget);
	uenquiry.setCompany(company);
	uenquiry.setDate(date);
	uenquiry.setEmail(email);
	uenquiry.setLayout(layout);
	uenquiry.setMobile(mobile);
	uenquiry.setOtherr(otherr);
	uenquiry.setSize(size);
	uenquiry.setTerm(term);
	uenquiry.setType(type);	
	uenquiry.setFloor(floor);
	util.setTable("user_enquire").insert(uenquiry);	
	out.print("<script>alert('提交成功')</script>");
	out.print("<script>location.href='user_enquiry.jsp'</script>");

	

%>