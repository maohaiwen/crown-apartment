<!doctype html>
<%@page import="com.util.StringUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String uuid = StringUtil.convertString(request.getParameter("uuid"));
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>鼠标拾取地图坐标</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/addhouse.css" />
    <script type="text/javascript"
	src="<%=basePath %>js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript"
            src="http://webapi.amap.com/maps?v=1.3&key=a6cb4fdedc6bc6bcf1945cf35ba7a207&plugin=AMap.Autocomplete"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>
<body>


<div id="container" style="width: 100%;height: 100%;margin-top: 14px;"></div>
<div id="myPageTop" >
<form id="Form1" name="Form1" action="doaddxy.jsp">
    <table>
      <tr>
      <td colspan="2" style="background-color:rgba(180, 180, 180, 0.74);color:white; ">
      按关键字搜索到目标位置后，选择房屋位置，获取房屋<br/>
      经纬度，依次点击Choose按钮、Submit按钮完成定位。
      </td>
       </tr>
        <tr>
            <td>
                <label>按关键字搜索：</label>
            </td>
            <td class="column2">
                <label>左击获取经纬度：</label>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" placeholder="请输入关键字进行搜索" id="tipinput">
            </td>
            <td class="column2">
                <input type="text" readonly="true" id="lnglat">
            </td>
        </tr>
        <tr>
            <td>
            <input type="hidden" id="x" name="x"/>
			<input type="hidden" id="y" name="y"/>
			<input type="hidden" id="uuid" name="uuid" value=<%=uuid%> />
            <input class="btn" type="button" value="Choose" onclick="choose()"/>
            </td>
            <td class="column2">
                <input class="btn" type="button" value="Submit" onclick="xysubmit()" >
            </td>
        </tr>
        
    </table></form>
</div>
<script type="text/javascript">
	var marker = null;
	var x,y;
    var map = new AMap.Map("container", {
        resizeEnable: true
    });
    //为地图注册click事件获取鼠标点击出的经纬度坐标
    var clickEventListener = map.on('click', function(e) {
        document.getElementById("lnglat").value = e.lnglat.getLng() + ',' + e.lnglat.getLat();
        x = e.lnglat.getLng();
        y = e.lnglat.getLat();
        if(marker != null){
       	 marker.setMap(null);
        }
        marker = new AMap.Marker({
            icon: "http://webapi.amap.com/theme/v1.3/markers/n/mark_b.png",
            position: [x, y]
        });
        marker.setMap(map);
    });
    var auto = new AMap.Autocomplete({
        input: "tipinput"
    });
    AMap.event.addListener(auto, "select", select);//注册监听，当选中某条记录时会触发
    function select(e) {
        if (e.poi && e.poi.location) {
            map.setZoom(15);
            map.setCenter(e.poi.location);
        }
    }
	function choose(){
		if(x == null || y == null){
			alert("please click the map to choose a point!");
			return;
		}
		$("#x").val(x);
		$("#y").val(y);
		alert("Location selection success!please continue submitting!");
	}
	function xysubmit(){
		document.Form1.submit();
	}
</script>
</body>
</html>	