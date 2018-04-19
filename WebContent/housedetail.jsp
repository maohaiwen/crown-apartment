<%@page import="com.bean.Img"%>
<%@page import="com.bean.House"%>
<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
					String id = request.getParameter("id");
					House house = new House();
					if(id != null && !id.equals("") ){
						house.setId(Integer.parseInt(id));
					}
					EasyDb<House> util = new EasyDb<House>();
					house = util.setTable("house_enquire").queryOne(house);
%>
<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <title>House detail</title>
		<meta charset="UTF-8" />
		<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jqPhoto/css/shou.css">
		<script type="text/javascript" src="<%=basePath %>js/jquery.js"></script>
		<script src="<%=basePath %>js/jqPhoto/js/jqueryPhoto.js" type="text/javascript"></script>
        <%-- <link rel="stylesheet" type="text/css" href="<%=basePath %>js/slide/flexslider.css" />
        <script type="text/javascript" src="<%=basePath %>js/slide/jquery.flexslider.js"></script> --%>
        
	<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=a6cb4fdedc6bc6bcf1945cf35ba7a207&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Driving
	,AMap.Transfer,AMap.Walking"></script>
	<script type="text/javascript">

	var map = null;

	var placeSearch = null;

	var infowindow = null;
	
	var xy = [<%=house.getX()%>,<%=house.getY()%>];

	function initMap(){
		map = new AMap.Map('maparea',{
			lang:"en",
			zoom: 13,
			center: xy
		});
		initToolBar(map);
		var marker = new AMap.Marker({
             icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
             position: xy
         });
         marker.setMap(map);
	}
	
	function listchange(){
		var railway="<%=house.getRailwayNo1()%>";
		if(railway=="线路"){
			document.getElementById("metro").style.display="none";
			//document.getElementById("metro1").style.display="inline";
		}
		
		
	}
	function initWindowStr(){
		var str = "<div class='infoWindow'>";
		str += "<div style='font-size:13px;'>how can i get there?input your position:<div>";
		str += "<div><input type='text' id='infoInput'/></div>";
		str += "<div>";
		str += "<input type='button' value='by car' onclick='bycar()'/>" 
		str += "<input type='button' value='by traffic' onclick='bytraffic()'/>"
		str += "<input type='button' value='by walk' onclick='bywalk()'/>"
		str += "</div>"
		str += "</div>";
		return str;
	}

	function initInfoWindow(){
		var content = initWindowStr();
		infowindow = new AMap.InfoWindow({
		  isCustom: true,
		  content: content
		});
		//infowindow.open(map, [116.480983, 39.989628]);
	}

	function bycar(){
		var driving = new AMap.Driving({
			map: map,
			panel: "panel"
		}); 
		driving.search([
        {keyword: $("#infoInput").val()},
        {keyword: $("#keywords").val()}
		]);
	}

	function bywalk(){
		var walking = new AMap.Walking({
		 map: map,
         panel: "panel"
		}); 
		walking.search([
			{keyword: $("#infoInput").val()},
        {keyword: $("#keywords").val()}
		]);
	}

	function bytraffic(){
		var transOptions = {
			map: map,
			panel: 'panel',
			policy: AMap.TransferPolicy.LEAST_TIME //乘车策略
		};
		//构造公交换乘类
		var transfer = new AMap.Transfer(transOptions);
		transfer.search([
        {keyword: $("#infoInput").val()},
        {keyword: $("#keywords").val()}
		]);
	}

	function initToolBar(map){
		AMap.plugin(['AMap.ToolBar','AMap.Scale'],function(){
			var toolBar = new AMap.ToolBar();
			var scale = new AMap.Scale();
			map.addControl(toolBar);
			map.addControl(scale);
		})
	}
    
	function initSearch(){
		var placeSearchOptions = { //构造地点查询类
			pageSize: 5,
			pageIndex: 1,
			lang:"en"
		};
		placeSearch = new AMap.PlaceSearch(placeSearchOptions);
	}

	function search(){
		var keywords = $("#keywords").val();
		placeSearch.search(keywords,function(status,result){
			if (status === 'complete' && result.info === 'OK') {
				var list = result.poiList.pois;
				for(var i=0;i<list.length;i++){
					var position = [list[i].location.lng,list[i].location.lat];
					var marker = new AMap.Marker({
						position: position,
						title: list[i].name
					});
					marker.setMap(map);
					AMap.event.addListener(marker, 'click', function(e){
						infowindow.open(map, e.lnglat);
					});
				}
				map.setZoomAndCenter(14, [list[0].location.lng,list[0].location.lat]);
			}
		});
	}
	
	var successmsg = 
		'<%
			String success = (String)session.getAttribute("success");
			out.print(success);
			session.removeAttribute("success");
		%>';
	
	function enquire(){
		if($("#tb_enquiry").is(":hidden")){
			$("#tb_enquiry").slideDown(300);
		}else{
			$("#tb_enquiry").slideUp(300);
		}
	}
	

	function enquiryHouse(){
		var name = $("#name").val();
		var email = $("#email").val();
		var mobile = $("#mobile").val();
		var message = $("#message").val();
		if(name == ""){
			alert("plase input your name");
			return ;
		}
		if(email == ""){
			alert("plase input your email");
			return ;
		}
		if(mobile == ""){
			alert("plase input your mobile");
			return ;
		}
		if(message == ""){
			alert("plase input your message");
			return ;
		}
		var uuid = $("#uuid").val();
		var id = $("#id").val();
		$("#house_id").val(id);
		$("#house_uuid").val(uuid);
		$("#frm_enquiry").submit();
	}
	
	function addCart(){
		location.href = "myCartServlet.do?cartop=add&id="+$("#uuid").val();
	}

	$(function(){
	 	initMap();
	  	initInfoWindow();
	 	initSearch();
	 	listchange();
		
		if(successmsg != "null"){
			alert(successmsg);
		}
	 })		
	</script>

	<style type="text/css">
	.infoWindow {width:280px;height:90px;background:white;text-align:center;padding-top:12px;}
	.infoWindow div {margin-top:5px;}
	.infoWindow input[type=button] {margin-left:8px;}
	.maparea {width:70%; height: 600px;margin-left:16%;}
	.searcharea {}
	  #panel {
            position: fixed;
            background-color: white;
            max-height: 90%;
            overflow-y: auto;
            top: 10px;
            right: 10px;
            width: 280px;
        }
	</style>
	<style>
		table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
}




/*----------------------*/

.zebra td, .zebra th {
    padding: 5px;
    border-bottom: 1px solid #f2f2f2;    
}

.zebra tbody tr:nth-child(even) {
    background: #f5f5f5;
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
}

.zebra th {
    text-align: left;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
    border-bottom: 1px solid #ccc;
    background-color: #eee;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#f5f5f5), to(#eee));
    background-image: -webkit-linear-gradient(top, #f5f5f5, #eee);
    background-image:    -moz-linear-gradient(top, #f5f5f5, #eee);
    background-image:     -ms-linear-gradient(top, #f5f5f5, #eee);
    background-image:      -o-linear-gradient(top, #f5f5f5, #eee); 
    background-image:         linear-gradient(top, #f5f5f5, #eee);
}

.zebra th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;  
}

.zebra th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.zebra th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.zebra tfoot td {
    border-bottom: 0;
    border-top: 1px solid #fff;
    background-color: #f1f1f1;  
}

.zebra tfoot td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.zebra tfoot td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}

.zebra tfoot td:only-child{
    -moz-border-radius: 0 0 6px 6px;
    -webkit-border-radius: 0 0 6px 6px
    border-radius: 0 0 6px 6px
}
  
</style>
		<style>
		.top-banner {
			background-color: rgba(255, 255, 255, 0.55);
		}
		.top-banner a {
			color: #019135;
		}
			.tb_detail{
			background:white;
			width:100%;			
			border:1px solid rgb(200,200,200);
			font-size: 18px;
		}
		.tb_detail tr {height:35px;}
		.tb_detail tr td:nth-child(odd) {width:30%;padding-left: 10px;}
		.tb_detail tr td:nth-child(even) {width:70%;padding-left: 10px;}
		h1 {
			margin-top: 100px;
			font-family: 'Microsoft Yahei';
			font-size: 36px;
			color: #019157;
		}
		.img {width:60%;height:30%;}
		</style>			
	</head>
	<body>
	<div class="container">
	<div
			style="width: 90%; float: left; margin-left: 7%; margin-right: 5%;">
		<div class="mod18" style="width: 70%; float: left;">
			<span id="prev" class="btn prev"></span> 
			<span id="next" class="btn next"></span>
			<span id="prevTop" class="btn prev"></span>
			<span id="nextTop" class="btn next"></span>
			<div id="picBox" class="picBox">
				<ul class="cf">
					<%
					EasyDb<Img> imgUtil = new EasyDb<Img>();
					List<Img> imgs = null;
					if(house != null){
						Img img = new Img();
						img.setHouseId(house.getUuid());
						imgs = imgUtil.setTable("imgs").queryList(img, null, null);
					}
					if(imgs != null && imgs.size() > 0){
						for(Img img : imgs){
							%>
					<li><a href="javascript:void(0)"> <img
							src="<%=basePath + "upload/img/" + img.getFileName() %>"
							alt="<%=img.getFileName()%>"
							style="width: 100%; height: 400px; " />
					</a></li>
					<%
				}
            %>
				</ul>
			</div>
			<div id="listBox" class="listBox">
				<ul style="width: 1792px; left: -512px;" class="cf">
					<%
            if(imgs != null && imgs.size() > 0){
				for(Img img : imgs){
					%>
					<li class=""><i class="arr2"></i> <img
						src="<%=basePath + "upload/img/" + img.getFileName() %>"
						style="width: 150px; height: 77px;" alt=""></li>
					<%
				}
            }
            %>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
<div style="float: right;width: 25%;margin-top:20px;margin-bottom: 10px;margin-right: 50px;">
		<table class="zebra"
					style="font-family: 'trebuchet MS', 'Lucida sans', Arial; font-size: 14px; color: #444;">
			<tr>
				<td>Id</td>
				<td> <%=house.getSerial() %>
				</td>
			</tr>
			<tr>
				<td>Area</td>
				<td><input type="hidden" id="id" value='<%=house.getId() %>' />
					<input type="hidden" id="uuid" value='<%=house.getUuid() %>' /> <%=house.getDistrict() %>
				</td>
			</tr>
			<tr>
				<td>Address</td>
				<td><%=house.getAddress() %></td>
			</tr>
			<tr>
				<td>Type</td>
				<td>
					<%
								Integer type = house.getType();
								if(type == 0){
									out.print("Apartment");
								}
								if(type == 1){
									out.print("Villa");
								}
								if(type == 2){
									out.print("Lane House");
								}
								if(type == 3){
									out.print("HighBuliding");
								}
								if(type==4){
									out.print("Office");
								}
							%>
				</td>
			</tr>
			<tr>
				<td>Size(Sqm)</td>
				<td><%=house.getSize() %></td>
			</tr>
			<tr>
				<td>Rental(Rmb/month)</td>
				<td><%=house.getMoney()  %></td>
			</tr>
			<tr>
				<td>Floor</td>
				<td><%=house.getFloor() %></td>
			</tr>
			<tr>
				<td>Layout</td>
				<td><%=house.getLayout() %></td>
			</tr>
			<tr>
				<td>Amenities</td>
				<td><%=house.getAmenf()%></td>
			</tr>
			<tr>
				<td>Metro</td>
				<td><%="Line" + house.getRailwayNo() +" " + house.getRailwayAddress() + " " +house.getRailwayTime() + " minutes walk." %>

				</td>
			</tr>
			<tr id="metro">
				<td id="metro1">Metro</td>
				<td id="metro2"><%="Line" + house.getRailwayNo1() +" " + house.getRailwayAddress1() + " " +house.getRailwayTime1() + " minutes walk." %>
				</td>
			</tr>
			<tr>
				<td>Describe</td>
				<td><%=house.getDescribes()%></td>
			</tr>
		</table>
		<%
						
					}
					%>
							<div style="margin-top: 5%;">
					<button  onclick="javascript:enquire()"
				style="margin-left: 2%;font-size: 17px;
						color:black;background: #f5f5f5;padding:4px 2px 2px 10px;border-radius:5px;float: left;">
					Enquiry this house				
				</button>
				<form id="addcart" action="mycartServlet.do" method="post">
				
				<input type="button"  value="Add to cart" 
						style="margin-left: 2%;margin-right:6%;font-size: 17px;
						color:black;background: #f5f5f5;padding:4px 2px 2px 4px;
						border-radius:5px;float: right;" onclick="addCart()"/>				
				<input type="hidden" id="cartop" name="cartop" value="add"/>
				<input type="hidden" id="id" name="id" value="<%=id%>"/>
				</form>
			</div>
			<div id="tb_enquiry" style="width:100%;border:1px solid #4169E1;
		height:300px;background:white;margin-top:16%;display:none;">
			
			<form id="frm_enquiry" action="doenquiry.jsp" method="post">
				<table class="tb_detail" style="border:0;">
					<tr>
						<td style="text-align: center;">Name</td>
						<td>
						<input type="hidden" id="house_id" name="house_id" />
						<input type="hidden" id="house_uuid" name="house_uuid"/>
						<input type="text" id="name" name="name" style="width:70%;height:9%;" required="required"/>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">Email</td>
						<td><input name="email" id="email" type="email" style="width:70%;height:9%;" required="required"/></td>
					</tr>
					<tr>
						<td style="text-align: center;">Mobile</td>
						<td><input name="mobile" id="mobile" type="text" style="width:70%;height:9%;" required="required"/></td>
					</tr>
					<tr>
						<td style="text-align: center;">Wechat</td>
						<td><input name="wechat" id="wechat" type="text" style="width:70%;height:9%;" required="required"/></td>
					</tr>
					<tr >
						<td style="text-align: center;">Message</td>
						<td >
							<br/>
							<textarea name="message" id="message" required="required" style="width:70%;height:80px;resize:none;"></textarea>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="2">
							<input type="button" style="width:80px;height:30px;border:0;border-radius:5px;
							background:#4169E1;color:white;font-size: 18px;cursor: pointer;"
							 onclick="enquiryHouse()" value="Submit"/>
						</td>
					</tr>
				</table>
			</form>
			</div>
					</div></div>
		<div class="maparea" id="maparea"></div>
		<div id="panel"></div>
		<div class="footer-banner" style="width: 728px; margin: 30px auto"></div>
	</div>

	<!-- 	<div class="searcharea" id="searcharea">
		<ul>
			<li><input type="text" id="keywords" /><input type="button" value="search" onclick="search()" /></li>
		</ul>
	</div> 
	-->

	
	</body>
</html>	
