<%@page import="java.util.Set"%>
<%@page import="com.bean.HouseBean"%>
<%@page import="java.util.Map"%>
<%@page import="com.bean.MyHousePro"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Office</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content=">Fit Pro Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />	
<script src="js/jquery-1.8.0.min.js"> </script>
<!--webfonts-->
<!--//webfonts-->
<!--Animation-->
<script src="js/wow.min.js"></script>
<link href="css/animate.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/search.css" />
<script src="<%=basePath%>js/showhouse/showhouse.js"></script>
<link href="<%=basePath%>js/showhouse/showhouse.css" rel='stylesheet' type='text/css' />
<script src="<%=basePath%>js/mypage/mypage.js"></script>
<link href="<%=basePath%>js/mypage/mypage.css" rel='stylesheet' type='text/css' />
<style type="text/css">
	.tb_detail {font-family: Times New Roman;}
	.tb_detail tr {}
	.tb_detail tr td {border:1px solid rgba(180,180,180,0.9);}
	.tb_cars {border:1px solid rgba(180,180,180,0.9);width:100%;height:300px}
</style>
<script type="text/javascript">
function  showImg(){
document.getElementById("wxImg").style.display='block';
}
function hideImg(){
document.getElementById("wxImg").style.display='none';
}
</script>
<script>

var basePath = '<%=basePath%>';

function query(){
	var district = $("#district").val();
	var minmoney = $("#between").val();
	var maxmoney = $("#and").val();
	var minshi = $("#leastShi").val();
	var maxshi = $("#mostShi").val();
	var keywords = $("#keywords").val();
	var json = [{"district":district},{"maxmoney":maxmoney},{"type":4},
				{"minmoney":minmoney},{"minshi":minshi},{"maxshi":maxshi},{"keywords":keywords}];
	$("#page").mypage("submit",json);
}

$(function(){
	new WOW().init();
})
</script>


</head>
<body style='background: white'>
<!-- 标题栏 -->
	<div
		style="width: 80%; height: 90px; padding-top: 10px; padding-left: 100px; color: white; background: white">
		<div
			style="margin-top: 20px; position: absolute; margin-left: 27%; border-radius: 6px; padding: 8px 8px 8px 8px; background: gray; font-family: 微软雅黑;">
			<img src="images/message.png;"> <a style="color: white;"
				class="emial" href="mailto:Inquiry@crownapartment.com"
				target="_blank">Inquiry@crownapartment.com
				&nbsp;&nbsp;&nbsp;&nbsp;</a> <img
				style="margin-left: 20px; width: 20px; height: 25px;"
				src="images/mobile.png;"> <span style="margin-right: 20px;">+86-181-1721-4848
			</span>
		</div>
		<div style="margin-left: 67%; position: absolute; margin-top: 20px;">
			<a href="javascript:void(0);" onMouseOut="hideImg()"
				onmouseover="showImg()" class="QR"><img
				src="<%=basePath%>images/QR_icon.png" class="QR-img"></a> <a
				href="https://www.baidu.com" target="_blank"><img
				src="<%=basePath%>images/linked_icon.png"></a> <a
				href="https://www.sina.com" target="_blank"><img
				src="<%=basePath%>images/facebook_icon.png"></a>
				
				<a href="myCartServlet.do?cartop=detail"  style="margin-top:3px;">
				  <img id="img_car" src="<%=basePath%>images/<%
				  						  MyHousePro pro1 = (MyHousePro)session.getAttribute("mycart");
				  						  if(null == pro1 || null == pro1.getcMap() || pro1.getcMap().keySet().size() == 0){
				  							  %>buycar.png
				  							  <%
				  						  }else{
				  							%>buycar_add.png
				  							  <%
				  						  }
				  						%> "
				  						style="width:32px;height:32px;">
				 </a>
		</div>
		<div id="wxImg"
			style="display: none; margin-left: 67%; top: 70px; back-ground: #f00; position: absolute; z-index: 999;">
			<img class="wx" src="<%=basePath%>images/zhujun.jpg">
		</div>
		<a href="index.jsp"><img
			style='mwidth: 11%; height: 85%; margin-left: 17%;'
			src="<%=basePath%>images/logo.jpg" alt="img00" /></a>
	</div>
	<!----- start-header---->
	<div class="banner" id="home"
		style="padding-top: 0px; background: white;">
		<div class="header-bottom"
			style="padding-top: 0px; padding-left: 0px; margin-left: 0px;">
			<div class="fixed-header" style="padding-top: 0px;">
				<div class="container" style="padding-top: 0px; padding-left: 6%;">

					<span class="menu" style="padding-top: 0px; padding-left: 0px;">
					</span>
					<div class="top-menu" style="padding-top: 0px; margin-top: 8px;">
						<nav class="navigation">
							<ul class="cl-effect-16">
								<li><a href="index.jsp">Home</a></li>
								<li><a href="apartment.jsp">Apartment</a></li>
								<li><a href="villas.jsp">Villa</a></li>
								<li><a href="lanehouse.jsp">lane house</a></li>
								<li><a href="highb.jsp">high building</a></li>
								<li><a href="office.jsp">Office</a></li>
								<li><a id="a1" href="inquiry.jsp?type=1">Inquiry</a></li>
								<li><a href="contact.jsp">About us</a></li>
								<li><a id="a2" href="inquiry.jsp?type=2">业主委托</a></li>
							</ul>
						</nav>
					</div>
					<!-- script for menu -->
					<script>
						$( "span.menu" ).click(function() {
						  $( ".top-menu" ).slideToggle( "slow", function() {
							// Animation complete.
						  });
						});
					</script>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	
	</div>
	<!----start-slide-bottom--->
				<!--tainers-section-->
			  <div class="tainers-section" style="margin-top:0px;">
	 				 <div class="container"  style="margin-top:0px;">
						<!--sreen-gallery-cursual-->
						<div class="col-md-3 tainer wow bounceInLeft"
						  data-wow-delay="0.4s">
						      <table class="table " style="font-weight: bold;font-size: 18px;">
						      	<tr>
						      		<td><span>AREA:</span> <br/> 
						      		<span>
						      <select id="district" style="width: 180px;">
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
									<option value="Former french consession">Former french consession</option>
									<option value="Other">Other</option>
										</select>
						      		</span></td>
						      	</tr>
						      	<tr>
						      		<td><span>PRICE(RMB/MONTH):</span> <br/> 
						      			<span>
						      				<input type="number" id="between" required="required" style="width: 60px;" />
											TO
											<input type="number" id="and" required="required" style="width: 60px;" />
										</span>
									</td>
						      	</tr>
						      	<tr>
						      		<td><span>BEDROOMS:</span><br/> 
						      		<span>
						      		<select id="leastShi"    >
						<option value="0" selected="selected" style="width: 45px;color: black;">Min</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						</select> TO
						<select id="mostShi" >
						<option value="10" selected="selected" style="width: 45px;color: black;">Max</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						</select>
						      		</span>
						      		</td>
						      	</tr>
						      	<tr>
						      		<td><span>KEYWORDS:</span> <span><input type="text" id="keywords"
								required="required" style="width: 200px;" /></span></td>
						      	</tr>
						      	<tr>
						      		<td style='text-align: center;'>
						      			<input type="button" value="SEARCH" onclick="query()">
						      		</td>
						      	</tr>
						      </table>
						</div>
						<div class="col-md-9 sreen-gallery-cursual wow bounceInRight"
							 style="margin-top:10px;" data-wow-delay="0.4s">
							 <div class="linearbg" style="margin-left:20px;padding-bottom:20px;width:100%;height:100%;border:1px solid rgba(180,180,180,0.9);">
								<div style="width:100%;text-align: center;font-family: 微软雅黑;
									 margin-bottom:5px;border-bottom:1px solid rgba(180,180,180,0.9);">
								&nbsp;Shopping Carts
								</div>
								<div style="width:100%;height:100%;position: relative;" id="div_pics" style="background:black">
									<%
									MyHousePro pro = (MyHousePro)session.getAttribute("mycart");
									if(null != pro){
										Map<String, HouseBean> map = pro.getcMap();
										if(null != map){
											Set<String> set = map.keySet();
											if(null != set){
												for(String str : set){
													HouseBean bean = map.get(str);
													if(null != bean){
														%>
														<div style="width:90%;height:300px;margin-left:5%;margin-top:15px;
																	border:1px solid rgba(180,180,180,0.9)">
															<div style="float:left;width:25%;height:200px;margin-top:40px;
																		border:3px solid gray;margin-left:30px;" >
																<img src="<%=path%>/upload/img/<%=bean.getImgName()%>" style="width:100%;height:100%;"/>
															</div>
															<div style="margin-left: 80px;padding-top: 5px;">
																<div style="color: red;font-family: Times New Roman;"><%=bean.getTypeDesc() %></div>
																<div>
																	<div style="width:65%;height:200px;margin-top: 14px;margin-left: 26%;">
																		<table style="width:100%;height:100%;" class="tb_detail">
																			<tr>
																				<td>Size</td>
																				<td><%=bean.getSize() %> sqm</td>
																			</tr>
																			<tr>
																				<td>Layout</td>
																				<td><%=bean.getLayout() %></td>
																			</tr>
																			<tr>
																				<td>Monthly Rental</td>
																				<td><%=bean.getMoney() %> RMB</td>
																			</tr>
																			<tr>
																				<td>Area</td>
																				<td><%=bean.getDistrict() %></td>
																			</tr>
																		</table>
																	</div>
																	<div style="margin-left: 72%;margin-top:10px;">
																		<button onclick="javascript:location.href='myCartServlet.do?cartop=delete&id=<%=bean.getUuid() %>'"
																		class="btn" 
																		style="rgba(180,180,180,0.9);
																		color:white;font-weight: bold;cursor: pointer">delete</button>
																	</div>
																</div>
															</div>
														</div>
														<%
													}
												}
											}
										}
									}
								%>
								</div>
							</div>
							</div>
						</div>
							  <div class="clearfix"></div>
						<!--//sreen-gallery-cursual-->
					</div>
				</div>
				<!-- requried-jsfiles-for owl -->
							<link href="css/owl.carousel.css" rel="stylesheet">
							    <script src="js/owl.carousel.js"></script>
							        <script>
							    $(document).ready(function() {
							      $("#owl-demo").owlCarousel({
							         items :3,
							        lazyLoad : true,
							        autoPlay : true,
							        navigation :true,
							        navigationText :  false,
							        pagination : false,
							      });
							    });
							    </script>
							 
			 <!-- //requried-jsfiles-for owl -->
  <!-- //End-team-->

		<!----footer--->
			<div class="footer">
			<div class="container">
				<div class="f-grids">
				<div class="col-md-4 footer-grid wow fadeInUpBig animated animated" data-wow-delay="0.4s">
				<h3>About<span class="opening">Crown Apartment</span></h3>
				  <p>Understand your needs</p>
				  <p>Search property </p>
				  <p>Leading viewing</p>
				  <p>Negotiate with owner</p>
				  <p>Sign the leasing contract</p>
				  <p>Check in support</p>
				  <p>After service during leasing</p>
				  <p>Check out support</p>
				</div>
				<div class="col-md-4 footer-grid wow fadeInUpBig animated animated" data-wow-delay="0.3s">
				    <div class="opening_hours">
						 <ul class="times">
							<h3>Office<span class="opening">Hours</span></h3>
							<li><i class="calender"> </i><span class="week">Monday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Tuesday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Wednesday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Thrusday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Friday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Saturday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Sunday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
	
						 </ul>
					</div>
				</div>
				<div class="col-md-4 footer-grid wow fadeInUpBig animated animated" data-wow-delay="0.2s">
						<h3>contact<span class="opening">info</span></h3>
					<ul class="address">
						 <li>Room 101,No 1,Lane 62,Yanqing road,Xuhui,Shanghai,China</li>
						 <li>0086-18117214848</li>
						 <li><a class="mail" href="mailto:Inquiry@crownapartment.com">Inquiry@crownapartment.com</a></li>
					</ul>
					<div class="support">
						   <input type="text" class="text" value="Enter email... " onfocus="this.value = '';" onblur="if (this.value == 'Enter email...') {this.value = 'Enter email...';}">
						<input type="submit" value="SUBMIT" class="botton">
						</div>


				</div>
					<div class="clearfix"></div>
				</div>
				<div class="copy">
						<p>Copyright &copy; 2016.Crown Apartment All rights reserved.</p>
		        </div>
			</div>
		</div>
	<!--start-smoth-scrolling-->
			<script type="text/javascript">
								jQuery(document).ready(function($) {
									$(".scroll").click(function(event){		
										event.preventDefault();
										$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
									});
								});
								</script>
							<!--start-smoth-scrolling-->
						<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>