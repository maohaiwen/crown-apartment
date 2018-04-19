<%@page import="com.bean.Serial"%>
<%@page import="com.util.TimeUtil"%>
<%@page import="com.bean.Img"%>
<%@page import="com.util.StringUtil"%>
<%@page import="com.bean.House"%>
<%@page import="com.db.EasyDb"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String owner = StringUtil.convertString(request.getParameter("owner"));
	String mobile = StringUtil.convertString(request.getParameter("mobile"));
	String phone = StringUtil.convertString(request.getParameter("phone"));
	String email = StringUtil.convertString(request.getParameter("email"));
	String money = StringUtil.convertString(request.getParameter("money"));
	String houseType = StringUtil.convertString(request.getParameter("type"));
	String pro=StringUtil.convertString(request.getParameter("province"));
	String city=StringUtil.convertString(request.getParameter("city"));
	String railwayTime=StringUtil.convertString(request.getParameter("railwayTime"));
	String pro1=StringUtil.convertString(request.getParameter("province1"));
	String city1=StringUtil.convertString(request.getParameter("city1"));
	String railwayTime1=StringUtil.convertString(request.getParameter("railwayTime1"));
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
	
	String[] amen=request.getParameterValues("Amenities");
	 String amenf=new String();
	 for(int i=0;i<amen.length-1;i++)
	 {
		 //amen[i]="√"+amen[i];
		 amenf=amenf+amen[i]+" "+"/"+" ";
	 }
	 amenf=amenf+amen[amen.length-1];
	EasyDb<House> util = new EasyDb<House>();
	House house = new House();
	String uuid = UUID.randomUUID().toString();
	
	house.setUuid(uuid);
	house.setOwner(owner);
	house.setMobile(mobile);
	house.setPhone(phone);
	house.setEmail(email);
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
	String layout = shi+"Bedroom" +" "+"/" +" "+ting + "Living room" +" "+"/" +" "+ wei + "Bathroom";	
	if(year != null && !year.equals("")){
		house.setYear(Integer.parseInt(year));
	}
	if(month != null && !month.equals("")){
		house.setMonth(Integer.parseInt(month));
	}
	
	if(railwayTime != null && !railwayTime.equals("")){
		house.setRailwayTime(Integer.parseInt(railwayTime));
	}
	if(railwayTime1 != null && !railwayTime1.equals("")){
		house.setRailwayTime1(Integer.parseInt(railwayTime1));
	}
	Integer hType = Integer.parseInt(houseType);
	EasyDb<Serial> serialUtil = new EasyDb<Serial>();
	Serial serial = new Serial();
	serial.setId(1);
	serial = serialUtil.setTable("serial").queryOne(serial);
	String serialStr = "";
	if(hType == 0){
		Integer ap = serial.getAp() + 1;
		serialStr = "AP" + String.format("%04d", ap); 
		serial.setAp(ap);
		serialUtil.setTable("serial").update(serial);
	}
	if(hType == 1){
		Integer va = serial.getVa() + 1;
		serialStr = "VA" + String.format("%04d", va); 
		serial.setVa(va);
		serialUtil.setTable("serial").update(serial);
	}
	if(hType == 2){
		Integer lh = serial.getLh() + 1;
		serialStr = "LH" + String.format("%04d", lh); 
		serial.setLh(lh);
		serialUtil.setTable("serial").update(serial);
	}
	if(hType == 3){
		Integer hb = serial.getHb() + 1;
		serialStr = "HB" + String.format("%04d", hb); 
		serial.setHb(hb);
		serialUtil.setTable("serial").update(serial);
	}
	if(hType == 4){
		Integer of = serial.getOf() + 1;
		serialStr = "OF" + String.format("%04d", of); 
		serial.setVa(of);
		serialUtil.setTable("serial").update(serial);
	}
	
	house.setType(hType);
	house.setSerial(serialStr);
	house.setRailwayAddress(city);
	house.setRailwayNo(pro);
	house.setRailwayAddress1(city1);
	house.setRailwayNo1(pro1);
	house.setAddress(address);
	house.setLayout(layout);
	house.setAddTime(TimeUtil.getCurrentTime());
	house.setAmenf(amenf);
	house.setRecommend(0);
	house.setMark(0);
	house.setDescribes(desc);
	house.setState(1);
	util.setTable("house_enquire").insert(house);
	String uuid1=house.getUuid();
	response.sendRedirect("addxy.jsp?uuid="+uuid1+""); 
	String arr = request.getParameter("arr");
	if(arr.equals("[]")){
		return;
	}
	String[] arrs = StringUtil.jsArrayToStringArray(arr);
	EasyDb<Img> imgUtil = new EasyDb<Img>();
	Img img = null;
	for(int i=0;i<arrs.length;i++){
		img = new Img();
		img.setHouseId(uuid);
		img.setFileName(arrs[i].substring(1,arrs[i].length() - 1));
		imgUtil.setTable("imgs").insert(img);
	}
	
%>