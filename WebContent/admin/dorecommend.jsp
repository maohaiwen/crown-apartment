<%@page import="com.bean.Serial"%>
<%@page import="com.util.TimeUtil"%>
<%@page import="com.bean.Img"%>
<%@page import="com.util.StringUtil"%>
<%@page import="com.bean.House"%>
<%@page import="com.db.EasyDb"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String mess="";
	String name = StringUtil.convertString(request.getParameter("name"));
	String[] array=new String[8];
	int revalue=8;
	EasyDb<House> easyDb=new EasyDb<House>();
			
	easyDb.updatere();
	array=name.split(",");
	if(array.length==8){
		for(int i=0;i<array.length;i++){
			if(StringUtil.isInt(array[i])&&Integer.parseInt(array[i])>0){				
				int id=Integer.parseInt(array[i]);
				House house=new House();	
				house.setId(id);
				house.setState(0);
				house=easyDb.setTable("house_enquire").queryOne(house);
				if(house!=null)
				{
					house.setRecommend(revalue-i);
					easyDb.setTable("house_enquire").update(house);
				}
				else{
					mess="没有房源，未成功！";
					break;
				}
			}
			
			
			else{
				mess="输入格式不正确，未成功！";
				break;
			}
		}
		mess="成功！";
	}
	else{
		mess="输入格式不正确，未成功！";
	}
	
	
%>
<body>
<%=mess%>
<a href="house0.jsp">返回房源管理界面</a>
</body>