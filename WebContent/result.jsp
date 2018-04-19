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
<title>apartment</title>
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
<script>
var basePath = '<%=basePath%>';

function initpage(){
	var type = '<%=request.getParameter("type")%>';
	var district = '<%=request.getParameter("district")%>';
	var minMoney = '<%=request.getParameter("leastMoney")%>';
	var maxMoney = '<%=request.getParameter("mostMoney")%>';
	var minshi = '<%=request.getParameter("leastShi")%>';
	var maxshi = '<%=request.getParameter("mostShi")%>';
	var keywords = '<%=request.getParameter("keywords")%>';
	var json = [{"district":district},{"maxmoney":maxMoney},{"type":type},
				{"minmoney":minMoney},{"minshi":minshi},{"maxshi":maxshi},{"keywords":keywords}];
	$("#page").mypage({
		limit:json,
		perpagecount:12,
		url:basePath+"houseServlet.do?flag=queryPage",
		click:function(data){
			$("#counts").html(data.totalcount);
			showhouse.show("div_pics",data.result);
		}
	});
}

$(function(){
	new WOW().init();
	initpage();
})
</script>
<style>
.linear{ 
width:100%; 
height:600px; 
FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#b8c4cb,endColorStr=red); /*IE 6 7 8*/ 
background: -ms-linear-gradient(top, #fff,  #0000ff);        /* IE 10 */
background:-moz-linear-gradient(top,#b8c4cb,#f6f6f8);/*火狐*/ 
background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(#b8c4cb), to(#f6f6f8));/*谷歌*/ 
background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#fff), to(#0000ff));      /* Safari 4-5, Chrome 1-9*/
background: -webkit-linear-gradient(top, #fff, #0000ff);   /*Safari5.1 Chrome 10+*/
background: -o-linear-gradient(top, #fff, #0000ff);  /*Opera 11.10+*/
} 
</style>
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
								<li><a href="inquiry.jsp">Inquiry</a></li>
								<li><a href="contact.jsp">Contact us</a></li>
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
						
						<div class="col-md-9 sreen-gallery-cursual wow bounceInRight"
							 style="height:800px;margin-top:10px;margin-left: 12%;" data-wow-delay="0.4s">
							<div style="margin-left:20px;background: white;width:100%;height:100%;border:1px solid rgba(180,180,180,0.9);">
								<div style="width:100%;text-align: center;font-family: 微软雅黑;
									 margin-top:5px;margin-bottom:5px;border-bottom:1px solid rgba(180,180,180,0.9);">
								<span id="counts" style="color:red">0</span>&nbsp;results has been found for you
								</div>
								<div style="width:100%;height:100%;position: relative;" id="div_pics" style="background:black">
								</div>
								<div id="page" style="bottom: 30px;position:absolute;margin-left:30%;"></div>
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
				<h3>About<span class="opening">Crownapartment</span></h3>
				  <a href="#"><h5>The do’s and don’ts of running for fitness</h5></a>
				  <p>Sed rhoncus nulla turpis, vitae rutrum velit iaculis et. Curabitur vestibulum, erat non im</p>
				   <p class="month">April 1, 2014 , By Robert Louise</p>
				  <a href="#"><h5>The do’s and don’ts of running for fitness</h5></a>
				  <p>Sed rhoncus nulla turpis, vitae rutrum velit iaculis et. Curabitur vestibulum, erat non im</p>
				  <p class="month">April 1, 2014 , By Robert Louise</p>
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
		<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</body>
</html>