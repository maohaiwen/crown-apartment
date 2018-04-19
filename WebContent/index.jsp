<%@page import="com.bean.MyHousePro"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>welcome to crown apartment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%=basePath%>css/style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript">
function  showImg(){
document.getElementById("wxImg").style.display='block';
}
function hideImg(){
document.getElementById("wxImg").style.display='none';
}
</script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/slide/flexslider.css" />
<script src="<%=basePath%>js/jquery-1.8.0.min.js"> </script>
<script src="<%=basePath%>js/wow.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/slide/jquery.flexslider.js"></script>
<link href="<%=basePath%>css/animate.css" rel='stylesheet'
	type='text/css' />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/search_index.css" />
<script src="<%=basePath%>js/showhouse/showhouse.js"></script>
<link href="<%=basePath%>js/showhouse/showhouse_index.css"
	rel='stylesheet' type='text/css' />
<script>
	var basePath = '<%=basePath%>';
	//当前页码，最新
	var curpage_new = 1;
	//当前页码，推荐
	var curpage_recom = 1;
	//总页码，最新
	var total_new = 1;
	//总页码，推荐
	var total_recom = 1;
	function getHousePage(orderby){
		var params = null;
		if(orderby == "addTime"){
			params = {"curpage":curpage_new,"perpagecount":8,"orderby":orderby};
		}else{
			params = {"curpage":curpage_recom,"perpagecount":8,"orderby":orderby};
		}
		$.ajax({
			url:basePath+"houseServlet.do?flag=queryPage",
			type:"post",
			data:params,
			dataType:"json",
			success:function(data){
				if(orderby == "addTime"){
					total_new = data.pagecount;
					showhouse.show("pics_div_new",data.result);
				}else{
					total_recom = data.pagecount;
					showhouse.show("pics_div_recom",data.result);
				}
			},
			error:function(){
				alert("请求失败");
			}
		});
	}
	
	function newNext(){
		if(curpage_new < total_new){
			curpage_new += 1;
			queryNew();
		}
	}
	
	function newPrev(){
		if(curpage_new > 1){
			curpage_new -= 1;
			queryNew();
		}
	}
	
	function recomNext(){
		if(curpage_recom < total_recom){
			curpage_recom += 1;
			queryRecom();
		}
	}
	
	function recomPrev(){
		if(curpage_recom > 1){
			curpage_recom -= 1;
			queryRecom();
		}
	}
	
	function queryNew(){
		getHousePage("addTime");
	}
	
	function queryRecom(){
		getHousePage("recommend");
	}
	
	$(function(){
		new WOW().init();
		queryNew();
		queryRecom();
		$(".flexslider").flexslider({
			controlNav: false,
			slideshowSpeed:4500
		});
	})
	
</script>

<style type="text/css">
.pagee {
	position: absolute;
	margin-left: 85%;
	margin-top: 8%;
	font-size: 60px;
	color: #EE3A8C;
	cursor: pointer;
	z-index: 100;
}
.btnn {font-weight: bold;font-size: 19px;border:0}
.btnn:hover {color:red;}
</style>
</head>
<body style='background: white;overflow-x: hidden;'>
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
				  						  MyHousePro pro = (MyHousePro)session.getAttribute("mycart");
				  						  if(null == pro || null == pro.getcMap() || pro.getcMap().keySet().size() == 0){
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
								<li><a class="active" href="index.jsp">Home</a></li>
								<li><a href="apartment.jsp">Apartment</a></li>
								<li><a href="villas.jsp">Villa</a></li>
								<li><a href="lanehouse.jsp">Lane house</a></li>
								<li><a href="highb.jsp">High building</a></li>
								<li><a href="office.jsp">Office</a></li>
								<li><a href="inquiry.jsp?type=1">Inquiry</a></li>
								<li><a href="contact.jsp">About us</a></li>
								<li><a href="inquiry.jsp?type=2">业主委托</a></li>
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
		<div class="flexslider" style="height:500px;margin-top:10px;margin-bottom:0px;padding:0;">
			<ul class="slides" style="margin-bottom:0px;padding-bottom: 0px;">
				<li>
		        	<img style="width: 100%;height: 500px;" src="<%=basePath %>images/slide0.jpg" alt="img01" />
				</li>
				<li>
					<img style="width: 100%;height: 500px;" src="<%=basePath %>images/slide1.jpg" alt="img02" />
				</li>
				<li>
					<img style="width: 100%;height: 500px;" src="<%=basePath %>images/slide2.jpg" alt="img03" />
				</li>
				<li>
					<img style="width: 100%;height: 500px;" src="<%=basePath %>images/slide3.jpg" alt="img04" />
				</li>
			</ul>
		</div>
		<%-- <div class="slider">
			<div id="cbp-fwslider" class="cbp-fwslider"
				style="margin-top: 20px; padding: 0px;">
				<ul>
					<li><img src="<%=basePath %>images/slide0.jpg" alt="img01" /></li>
					<li><img src="<%=basePath %>images/slide1.jpg" alt="img02" /></li>
					<li><img src="<%=basePath %>images/slide2.jpg" alt="img03" /></li>
					<li><img src="<%=basePath %>images/slide3.jpg" alt="img04" /></li>				
				</ul>
			</div>
		</div> --%>
	</div>
	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<script src="js/modernizr.custom.js"></script>

	<!--start-slide-bottom-->
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
<div class="new-section" style="margin-top: 0px; height: 200px; border-radius: 10px;">
		<div class="linearbg" style="width: 100%; padding-left:12%;padding-right:12%;">		
			<h3 align="center" style="font-weight:bold;margin-top:10px;">PROPERTY SEARCH</h3>	
			<form action="result.jsp" method="post">
				<table class="table " style="margin-top: 10px;color:black;font-weight: bold;">
					<tr>
						<td><span> TYPE: </span> <span>
						 <select style="color:black;" name="type">
									<option value=0>Apartment</option>
									<option value=1>Villa</option>
									<option value=2>Lane house</option>
									<option value=3>High building</option>
									<option value=4>Office</option>
							</select>
						</span></td>
						<td><span>AREA:</span> <span > <select style="color:black;width:180px;" id="district" name="district">
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
						<td><span>PRICE(RMB/MONTH):</span> <span> <input
								style="color:black;width:60px;" type="number" name="leastMoney" id="between"
								 /> TO <input type="number" id="and" name="mostMoney"
								style="width:60px;" />
						</span></td>
					</tr>
					<tr>
						<td><span>BEDROOMS:</span> <span> <select name="leastShi"  >
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
						<select name="mostShi">
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
						</span></td>
						<td><span>KEYWORDS:</span> <span><input type="text"
								name="keywords" style="width: 200px;" /></span></td>
						<td style='text-align: center;'><input type="submit"
							 value="SEARCH"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<div class="linearbg" style="padding-top: 0px;">		
			<div class="container">
			<h3 style="font-weight: bold;margin-top:30px;">recommend house</h3>
			<div style="border-radius: 5px;">
				<div id="pics_div_recom" data-wow-delay="0.4s">
				</div>
			</div>
		
	</div>
	</div>
	<div class="linearbg" style="padding-bottom:1%; padding-top: 0px;">
		<div class="container">
			<h3 style="margin-top: 5px; font-weight: bold;">new house</h3>
			<div style="border-radius: 10px;">
				<div id="pics_div_new" data-wow-delay="0.4s"></div>
			</div>
		</div>
	</div>
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
								<li><i class="calender"> </i><span class="week">Sunday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Monday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Tuesday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Wednesday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Thrusday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Friday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
							<li><i class="calender"> </i><span class="week">Saturday</span><div class="hours">9:30am-7:30pm</div>  <div class="clearfix"></div></li>
						
	
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
	<a href="#home" id="toTop" class="scroll" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>
</body>
</html>