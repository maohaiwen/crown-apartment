<%@page import="com.mysql.jdbc.EscapeTokenizer"%>
<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@page import="com.bean.House"%>
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
	String changeState = request.getParameter("changestate");
	EasyDb<House> util = new EasyDb<House>();
	House house = new House();
	house.setId(Integer.parseInt(id));
	house=util.setTable("house_enquire").queryOne(house);
	int money=house.getMoney();
	String address=house.getAddress();
	String describes=house.getDescribes();
	int size=house.getSize();
	int shi=house.getShi();
	int wei=house.getWei();
	int floor=house.getFloor();
	int year=house.getYear();
	int month=house.getMonth();	
%>
<body>
<div align="left" style="margin-left: 250px;"><input type="button" class="btn" name="return" value="返回" onclick="javascript:window.history.back(-1);"><br/></div>
<form id="alterfrm"  action="alterhouse.jsp?changeState=<%=changeState %>" method="post">
<div class="main">
<input type="hidden" name="id" value="<%=id%>">
				<table class='tb'>
					<tr>
						<td><span>租金*:</span> <span><input type="number" name="money"
								required="required" placeholder="Price" style="width: 120px;" value="<%=money%>"/>人民币/月</span></td>
						<td><span>地区*:</span> <span> 
							<select name="district" style="width: 180px;">
									<option value="Anting" selected>Anting</option>
									<option value="Bund area" >Bund area</option>
									<option value="Changning">Changning</option>
									<option value="Expo Area">Expo Area</option>
									<option value="Gubei">Gubei</option>
									<option value="Hongkou">Hongkou</option>
									<option value="Hongqiao">Hongqiao</option>
									<option value="Huangpu">Huangpu</option>
									<option value="Jing'an">Jing'an</option>
									<option value="Jinqiao" >Jinqiao</option>
									<option value="Minhang">Minhang</option>
									<option value="Yun Garden">Yun Garden</option>
									<option value="People's square">People's square</option>
									<option value="Qingpu">Qingpu</option>
									<option value="Putuo">Putuo</option>
									<option value="Pudong">Pudong</option>
									<option value="South Bund">South Bund</option>
									<option value="Suzhou Creek">Suzhou Creek</option>
									<option value="Xuhui">Xuhui</option>
									<option value="Xujiahui">Xujiahui</option>
									<option value="Yangpu">Yangpu</option>
									<option value="Zhabei">Zhabei</option>
									<option value="Tianzifang">Tianzifang</option>
									<option value="Former french consession">Former french consession</option>
									<option value="Other">Other</option>
							</select>
						</span></td>
					</tr>
					<tr>
						<td><span>类型:</span> <span> 
							<select name="type">
								<option value=0>公寓</option>
								<option value=1>别墅</option>
								<option value=2>里弄</option>
								<option value=3>高层</option>
								<option value=4>办公室</option>
							</select>
						</span></td>
						<td><span>面积*:</span> <span><input type="number" name="size"
								required="required" placeholder="Size" style="width: 120px;" value="<%=size%>"/>平方</span></td>
						
					</tr>
				
					<tr>
						<td colspan="2">地址（用英文表述）：<input type="text" required="required" name="address"
							style="width: 500px;" value="<%=address%>"/>
							</td>	
						
					</tr>
					<tr>
						<td colspan=2><span>布局*:</span> <span> 							
							<select name="shi" style="width: 60px;">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</option>
								<option value=4>4</option>
							</select>室
							<select name="ting" style="width: 60px;">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</option>
								<option value=4>4</option>								
							</select>厅
							<select name="wei" style="width: 60px;">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</option>
								<option value=4>4</option>
								
							</select>卫 &nbsp;&nbsp;&nbsp;
							
						</span>
						</td>
					</tr>
					<tr>
				<td colspan="2"><span>	楼层：</span><input type="number"
								required="required" style="width: 40px;" name="floor" value="<%=floor%>"/>
							层&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span>最短租期*:</span><span> <input type="number" name="year"
								required="required" style="width: 40px;" value="<%=year%>"/>年<input type="number"
								required="required" style="width: 40px;" name="month" value="<%=month%>"/>月
						</span>
						</td>
					</tr>
					<tr>
					<td colspan="2">设施:
					<input name="Amenities"  type="checkbox" checked="checked" value="Common Garden">公用绿地 
					<input name="Amenities"  type="checkbox" value="Security">保安
					<input name="Amenities"  type="checkbox" value="Parking">停车场 
					<input name="Amenities"  type="checkbox" value="Gym">健身房
					<input name="Amenities"  type="checkbox" value="Pool">游泳池 
					
					</td>					
					</tr>
					<tr>
					<td colspan="2" style="padding-left:86px;"> 
					<input name="Amenities"  type="checkbox" value="Elevator">电梯
					<input name="Amenities"  type="checkbox"  value="Outdoor Space">户外空间
					<input name="Amenities"  type="checkbox" value="veranda">露台
					<input name="Amenities"  type="checkbox" value="Balcony">阳台													 														
					</td>					
					</tr>
					<tr>
					<td colspan="2" style="padding-left:86px;">
					<input name="Amenities"  type="checkbox" value="Furniture">家具
					<input name="Amenities"  type="checkbox" value="Wall heating">墙暖
					<input name="Amenities"  type="checkbox" value="Floor heating">地暖
					<input name="Amenities"  type="checkbox" value="Bathtub">浴缸
				 
					</td>					
					</tr>
					<tr>
					<td colspan="2" style="padding-left:86px;">
					<input name="Amenities"  type="checkbox" value="Water Filter">净水器
					<input name="Amenities"  type="checkbox" value="Air Filter">空气净化器  
					<input name="Amenities"  type="checkbox" value="Washing machine">洗衣机		
					<input name="Amenities"  type="checkbox" value="Dryer">烘干器 
					<input name="Amenities"  type="checkbox" value="Aircon">空调
					
					</td>					
					</tr>
					<tr>
					<td colspan="2" style="padding-left:86px;">
				
					<input name="Amenities"  type="checkbox" value="Boiler">热水器
					<input name="Amenities"  type="checkbox" value="TV">电视机 
					<input name="Amenities"  type="checkbox" value="Oven">烤箱
					 <input name="Amenities"  type="checkbox" value="Microwave Oven">微波炉 
					<input name="Amenities"  type="checkbox" value="Refrigerator">冰箱
					</td>					
					</tr>
					<tr><td colspan="2">原描述：<input type="text" value="<%=describes%>"></td></tr>
					<tr>
					
						<td colspan="2">描述：<textarea name="desc" 
								style="width: 550px; resize: none; vertical-align: top; height: 80px;"></textarea>
						</td>
					</tr>
			
					<tr>
						<td colspan="2" style="text-align: center;"><input
							class="btn" type="submit" value="修改" />
							&nbsp;&nbsp;&nbsp;&nbsp; <input class="btn" type="Reset"
							 value="重置" /></td>
					</tr>
				</table>
			</div>
				</form>
	

</body>
</html>