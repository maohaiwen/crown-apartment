<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@page import="com.bean.Uenquiry"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
<script type="text/javascript"
	src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/addhouse.css" />
<title>user_enquiry</title>


<style type="text/css">
.tb {

	font-family:Times New Roman ;
	width: 90%;
	margin-top: 10px;
}

.tb tr {
	height: 40px;
}

.tb td {
	text-align: left;
	padding-left: 10%;
}
</style>
</head>
<body style="overflow-y: auto;">
	<form id="frm" action="user_enquiry_action.jsp" method="post">
	<input type="hidden" name="arr" id="arr"/>
	<div class="new-section"
		style="position: absolute; width: 60%; margin-left: 20%;">
		<div class="container"
			style="height: 25%; width: 100%;">
			<div 
				style="height: 40px; font-size: 24px; line-height: 40px; font-family:Times New Roman ;color: black；">
				Contact</div>
			<div class="main">
				<table class='tb'>
					<tr>
						<td><span>Name*:&nbsp;&nbsp;&nbsp;</span> <span><input type="text" name="name"
								required="required" placeholder="name" style="width: 180px;" /></span></td>
						<td><span>Mobile*:</span> <span><input type="tel" name="mobile"
								placeholder="mobile" style="width: 180px;" required="required" /></span></td>
					</tr>
					
					<tr>
						<td ><span>Wechat:&nbsp;&nbsp;&nbsp;</span> <span><input type="text" name="wechat"
								placeholder="wechat" style="width: 180px;" /></span></td>
						<td><span>E-mail:&nbsp;&nbsp;</span> <span><input type="email" name="e_mail"
								placeholder="e-mail" style="width: 180px;" /></span></td>
						
					</tr>
					<tr>
						<td ><span>Company:</span> <span><input type="text" name="company"
								placeholder="company" style="width: 180px;" /></span></td>
						<td><span>Address:</span> <span><input type="text" name="address"
								placeholder="address" style="width: 180px;" /></span></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="container"
			style="height: 75%; width: 100%; margin-top: 15px;">
			<div 
				style="height: 40px; font-size: 24px; line-height: 40px; font-family:Times New Roman ;color: black；">
				Property Requirements</div>
			<div class="main">
				<table class='tb'>
					<tr>
						<td colspan="2">Property Type:
						<input name="type"  type="checkbox" checked="checked" value="Apartment" >Apartment
						<input name="type"  type="checkbox" value="Villa" >Villa
						<input name="type"  type="checkbox" value="Lane house">Lane house
						<input name="type"  type="checkbox" value="High building">High building
						<input name="type"  type="checkbox" value="Office">Office
						<input name="type"  type="checkbox" value="Other">Other
						</td>
					</tr>
					<tr>
						<td><span>Rental(RMB):</span> <span><input type="number" name="budget"
								 placeholder="RMB" style="width: 120px;" />/Month</span></td>
						<td><span>Lease Term:</span><span> <input type="number" name="year"
								style="width: 40px;" />Year<input type="number"
							    style="width: 40px;" name="month"/>Month
						</span></td>
					</tr>
					<tr>
					<td><span>Size:</span> <span><input type="number" name="size"
							placeholder="approximate area" style="width: 120px;" />Sqm</span></td>
					<td><span>Start date:</span> <span><input type="text" name="date"
					placeholder="year-month-day" style="width: 120px;" /></span></td>
	
					</tr>
					<tr>
					<td colspan="2"> 
							<span>Floor:</span>	<select name="floors" style="width: 60px;">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</option>
								<option value=4>4</option>
								<option value=5>over</option>
							</select>
					</tr>
					<tr>
						<td colspan="2"> 
						<span>Layout:</span><span> <select name="bedrooms" style="width: 60px;">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</option>
								<option value=4>4</option>
							</select>Bedrooms
								<select name="living" style="width: 60px;">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</option>
								<option value=4>4</option>
							</select>Living rooms
								<select name="bathrooms" style="width: 60px;">
								<option value=1>1</option>
								<option value=2>2</option>
								<option value=3>3</option>
								<option value=4>4</option>
							</select>Bathrooms
								<input type="text" style="width: 140px;" placeholder="other" name="otherlayout" maxlength="20"/>
						</span></td>
						
					</tr>
					
					<tr>
						<td colspan="2">Area:
						<input name="area"  type="checkbox" id ="area" checked="checked" value="AllDowntown">All Downtown
						<input name="area"  type="checkbox" id ="area" value="Anting">Anting
						<input name="area"  type="checkbox" id ="area" value="Bund area">Bund area
						<input name="area"  type="checkbox" id ="area" value="Changning">Changning
						<input name="area"  type="checkbox" id ="area" value="Tianzifang">Tianzifang
						</td>
						
					</tr>
					<tr>
						<td colspan="2">
						<input name="area"  type="checkbox" id ="area" value="Expo Area">Expo Area
						<input name="area"  type="checkbox" id ="area" value="Gubei">Gubei
						<input name="area"  type="checkbox" id ="area" value="Hongkou" style="width: 25px;">Hongkou
						<input name="area"  type="checkbox" id ="area" value="Hongqiao" style="width:25px;">Hongqiao
						<input name="area"  type="checkbox" id ="area" value="Huangpu" style="width: 25px;">Huangpu
						
						</td>
						
					</tr>
					<tr>
						<td colspan="2">
						<input name="area"  type="checkbox" id ="area" value="Jing'an" style="width: 25px;">Jing'an
						<input name="area"  type="checkbox" id ="area" value="Jinqiao" style="width: 25px;">Jinqiao
						<input name="area"  type="checkbox" id ="area" value="Minhang" style="width: 25px;">Minhang
						<input name="area"  type="checkbox" id ="area" value="Yu Garden" style="width:25px;">Yu Garden
						<input name="area"  type="checkbox" id ="area" value="People's square" style="width: 25px;">People's square
						
						</td>
						
					</tr>
					<tr>
						<td colspan="2">
						<input name="area"  type="checkbox" id ="area" value="Qingpu" style="width: 25px;">Qingpu
						<input name="area"  type="checkbox" id ="area" value="Putuo" style="width: 25px;">Putuo
						<input name="area"  type="checkbox" id ="area" value="Pudong" style="width: 25px;">Pudong
						<input name="area"  type="checkbox" id ="area" value="South Bund" style="width:25px;">South Bund
						<input name="area"  type="checkbox" id ="area" value="Suzhou Creek" style="width: 25px;">Suzhou Creek
						
						</td>
						
					</tr>
					<tr>
						<td colspan="2">
						<input name="area"  type="checkbox" id ="area" value="Xuhui" style="width: 25px;">Xuhui
						<input name="area"  type="checkbox" id ="area" value="Xujiahui" style="width: 25px;">Xujiahui
						<input name="area"  type="checkbox" id ="area" value="Yangpu" style="width: 25px;">Yangpu
						<input name="area"  type="checkbox" id ="area" value="Zhabei" style="width:25px;">Zhabei
						<input name="area"  type="checkbox" id ="area" value="FFC" style="width: 25px;">FFC
						<input name="area"  type="checkbox" id ="area" value="Other" style="width: 25px;">Other
						</td>
						
					</tr>
					<tr>
						<td colspan="2">Other Requirement：<textarea name="otherr"
								style="width: 650px; resize: none; vertical-align: top; height: 80px;"></textarea>
						</td>
					</tr>
				
					<tr>
						<td colspan="2" style="text-align: center;"><input
							class="btn" type="submit"  value="Submit" />
							&nbsp;&nbsp;&nbsp;&nbsp; <input class="btn" type="reset"
							onclick="goback()" value="Reset" /></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</form>
</body>
</html>