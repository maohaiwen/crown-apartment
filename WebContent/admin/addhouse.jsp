<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/addhouse.css" />
<script type="text/javascript"
	src="<%=basePath %>js/jquery-1.8.0.min.js"></script>
<link href="<%=basePath%>js/uploadify/css/uploadify.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="<%=basePath%>js/uploadify/jquery.uploadify.min.js"></script>
<title>Add house</title>

<!--get station ajax  -->
 
 <!--get station ajax  -->
<!--  -->
<style type="text/css">
.tb {
	font-family:  Times New Roman ;
	width: 100%;
	margin-top: 10px;
}

.tb tr {
	height: 40px;
}

.tb td {
	width:50%;
	text-align: left;
	padding-left: 10%;
}
</style>
<script type="text/javascript">
	var basePath = "<%=basePath%>";
	var names = new Array();
	var map, geolocation;
	var marker = null;
	var x,y;
	
	function addhouse() {
		$("#arr").val(JSON.stringify(names));
		var arr = $("#frm input[type=text]");
		for(var i=0;i<arr.length;i++){
			if(arr[i].value == "" || arr[i].value == null){
				alert("请填写完整！");
				return;
			}
		}
		var frm = document.getElementById("frm");
		frm.submit();
	}
	
	function openfile(){
		$("#dlg_pic").slideDown();
		addPics();
	}
	
	function picok(){
		$('#file').uploadify('upload','*');
	}

	function addPics() {
		$('#file').uploadify({
			//'width':100,
			'multi':true,
			'auto':false,                   //阻止他立即上传
			'buttonText':'please choose file',
			'fileSizeLimit':'8MB',
			'fileTypeExts':'*.jpg;*.jpge;*.gif;*.png',
			//'queueID': 'fileQueue',
			'queueSizeLimit' : 9,  //同时上传文件的个数  
			//'removeCompleted' : false,//上传完成后自动删除队列  
			'fileObjName':'file',
			'method':'post',
			'formData': {'filepath':'files/cateprice4'},
			'swf' : basePath+'js/uploadify/swf/uploadify.swf',  
	        'uploader' : basePath+'uploadPic.do',
			'onUploadSuccess' : function(file, data, response) {
				names.push(data);  
	        },
	        'onSelect':function(event,queueID,fileObj){
	        	
	        }
		});
	}
	

	$(function() {       
		addPics();
    });
</script>
<script type="text/javascript">
var where = new Array(12);
function comefrom(loca,locacity) { this.loca = loca; this.locacity = locacity; }
where[0]= new comefrom("线路","站名");
where[1] = new comefrom("1","|Bao'an Highway|Caobao Road|Changshu Road|Fujin Road|Gongfu Xincun|Gongkang Road|Hanzhong Road|Hengshan Road|Hulan Road|Jinjiang Park|Lianhua Road|North Zhongshan Road|Pengpu Xincun|People's Square|Shanghai Circus World|Shanghai Indoor Stadium|Shanghai Railway Station|Shanghai South Railway Station|South Huangpi Road|South Shaanxi Road|Tonghe Xincun|Waihuanlu|Wenshui Road|West Youyi Road|Xinzha Rd|Xinzhuang|Xujiahui|Yanchang Road|");
where[2] = new comefrom("2","|Beixinjing|Century Avenue|Century Park|Chuansha|Dongchang Road|East Huaxia Road|East Nanjing Road|East Xujing|Guanglan Road|Haitiansan Road|Hongqiao Airport Terminal 2|Hongqiao Railway Station|Jiangsu Road|Jing'an Temple|Jinke Road|Lingkong Road|Longyang Road|Loushanguan Road|Lujiazui|Middle Chuangxin Road|People's Square|Pudong International Airport|Shanghai Science & Technology Museum|Songhong Road|Tangzhen|Weining Road|West Nanjing Road|Yuandong Avenue|Zhangjiang High Technology Park|Zhongshan Park");
where[3] = new comefrom("3","|Baoshan Road|Baoyang Road|Caoxi Road|Caoyang Road|Chifeng Road|Dabaishu|Dongbaoxing Road|Hongkou Football Stadium|Hongqiao Road|Jiangwan Town|Jinshajiang Road|Longcao Road|North Jiangyang Road|Shanghai Railway Station|Shanghai South Railway Station|Shilong Road|Shuichan Road|Songbin Road|Songfa Road|South Changjiang Road|Tieli Road|West Yan'an Road|West Yingao Road|Yishan Road|Youyi Road|Zhanghuabang|Zhenping Road|Zhongshan Park|Zhongtan Road");
where[4] = new comefrom("4","|Baoshan Road|Caoyang Road|Century Avenue|Dalian Road|Damuqiao Road|Dong'an Road|Hailun Road|Hongqiao Road|Jinshajiang Road|Lancun Road|Linping Road|Luban Road|Nanpu Bridge|Pudian Road|Pudong Avenue|Shanghai Indoor Stadium|Shanghai Railway Station|Shanghai Stadium|South Xizhang Road|Tangqiao|West Yan'an Road|Yangshupu Road|Yishan Road|Zhenping Road|Zhongshan Park|Zhongtan Road");
where[5] = new comefrom("5","|Beiqiao|Chunshen Road|Dongchuan Road|Huaning Road|Jianchuan Road|Jinping Road|Minhang Development Zone|Wenjing Road|Xinzhuang|Yindu Road|Zhuanqiao");
where[6] = new comefrom("6","|Beiyangjing Road|Boxing Road|Century Avenue|Deping Road|Dongjing Road|Dongming Road|Gangcheng Road|Gaoqing Road|Hangjin Road|Jinqiao Road|Jufeng Road|Lancun Road|Linyi Xincun|Minsheng Road|North Waigaoqiao Free Trade Zone|Oriental Sports Center|Pudian Road|Shanghai Children's Medical Center|Shangnan Road|South Lingyan Road|South Waigaoqiao Free Trade Zone|West Gaoke Road|West Huaxia Road|Wulian Road|Wuzhou Avenue|Yuanshen Stadium|Yunshan Road|Zhouhai Road");
where[7] = new comefrom("7","|Changping Road|Changqing Road|Changshou Road|Changshu Road|Changzhong Road|Chuanchang Road|Dachang Town|Dahuasan Road|Dong'an Road|Fanghua Road|Gucun Park|Houtan|Huamu Road|Jing'an Temple|Jinxiu Road|Langao Road|Longyang Road|Luonan Xincun|Meilan Lake|Nanchen Road|Shangda Road|Shanghai University|South Yanggao Road|West Gaoke Road|Xincun Road|Xingzhi Road|Yaohua Road|Yuntai Road|Zhaojiabang Road|Zhenping Road");
where[8] = new comefrom("8","|Aerospace Museum|Anshan Xincun|Chengshan Road|Dashijie|Hongkou Football Stadium|Huangxin Road|Huangxing Park|Jiangpu Road|Jiangyue Road|Laoximen|Lianhang Road|Lingzhao Xincun|Luheng Road|Lujiabang Road|Middle Yanji Road|Nenjiang Road|North Xizang Road|Oriental Sports Center|People's Square|Pujiang Town|Qufu Road|Quyang Road|Shiguang Road|Siping Road|South Xizang Road|Xiangyin Road|Yangsi|Yaohua Road|Zhongxing Road");
where[9] = new comefrom("9","|Caohejing Hi-Tech Park|Century Avenue|Dapuqiao|Dongjing|Guilin Road|Hechuan Road|Jiashan Road|Jiuting|Lujiabang Road|Madang Road|Middle Yanggao Road|Qibao|Shangcheng Road|Sheshan|Sijing|Songjiang University Town|Songjiang Xincheng|Xiaonanmen|Xingzhong Road|Xujiahui|Yishan Road|Zhaojiabang Road|Zhongchun Road");
where[10] = new comefrom("10","|East Nanjing Road|East Yingao Road|Guoquan Road|Hailun Road|Hongqiao Airport Terminal|Hongqiao Road|Jiangwan Stadium|Jiaotong University|Laoximen|Longxi Road|North Sichuan Road|Sanmen Road|Shanghai Library|Shanghai Zoo|Shuicheng Road|Siping Road|Songyuan Road|South Shanxi Road|Tiantong Road|Tongji University|Wujiaochang|Xinjiangwancheng|Xintiandi|Yili Road|Youdian Xincun|Yuyuan Garden");
where[11] = new comefrom("11","|Anting|Baiyin Road|Caoyang Road|East Changji Road|Fengqiao Road|Hangzhong Road11|Hongqiao Airport Terminal 2|Hongqiao Railway Station|Jiading Xincheng|Jiangsu Road|Liziyuan|Longbai Xincun|Longde Road|Malu|Nanxiang|North Jiading|Qilianshan Road|Shanghai Automobile City|Shanghai Circuit|Taopu Xincun|West Jiading|West Shanghai Railway Station|Wuwei Road|Zhenru|Ziteng Road");
function select() {
with(document.creator.province) { var loca2 = options[selectedIndex].value; }
for(i = 0;i < where.length;i ++) {
if (where[i].loca == loca2) {
loca3 = (where[i].locacity).split("|");
for(j = 0;j < loca3.length;j++) { with(document.creator.city) { length = loca3.length; options[j].text = loca3[j]; options[j].value = loca3[j]; var loca4=options[selectedIndex].value;}}
break;
}}
with(document.creator.province1) { var loca2 = options[selectedIndex].value; }
for(i = 0;i < where.length;i ++) {
if (where[i].loca == loca2) {
loca3 = (where[i].locacity).split("|");
for(j = 0;j < loca3.length;j++) { with(document.creator.city1) { length = loca3.length; options[j].text = loca3[j]; options[j].value = loca3[j]; var loca4=options[selectedIndex].value;}}
break;
}}
}
function init() {
with(document.creator.province) {
length = where.length;
for(k=0;k<where.length;k++) { options[k].text = where[k].loca; options[k].value = where[k].loca; }
options[selectedIndex].text = where[0].loca; options[selectedIndex].value = where[0].loca;
}
with(document.creator.city) {
loca3 = (where[0].locacity).split("|");
length = loca3.length;
for(l=0;l<length;l++) { options[l].text = loca3[l]; options[l].value = loca3[l]; }
options[selectedIndex].text = loca3[0]; options[selectedIndex].value = loca3[0];
}
with(document.creator.province1) {
	length = where.length;
	for(k=0;k<where.length;k++) { options[k].text = where[k].loca; options[k].value = where[k].loca; }
	options[selectedIndex].text = where[0].loca; options[selectedIndex].value = where[0].loca;
	}
with(document.creator.city1) {
	loca3 = (where[0].locacity).split("|");
	length = loca3.length;
	for(l=0;l<length;l++) { options[l].text = loca3[l]; options[l].value = loca3[l]; }
	options[selectedIndex].text = loca3[0]; options[selectedIndex].value = loca3[0];
	}

} 
</script>
</head>
<body onLoad="init()" style="overflow-y: auto; ">

   
	<form id="frm" name="creator" action="doaddhouse.jsp" method="post">
	<input type="hidden" name="arr" id="arr"/>
	<div  class="new-section"
		style="position: absolute; width: 60%; margin-left: 20%;margin-top: 10px;"
		>
		<div class="container"
			style="height: 23%; width: 100%; ">
			<div 
				style="height: 40px; font-size: 24px; line-height: 40px;color:black;">
				业主信息</div>
			<div class="main">
				<table class='tb'>
					<tr>
						<td><span>姓名*:</span> <span><input type="text" name="owner"
								required="required" placeholder="Name" style="width: 180px;" /></span></td>
						<td><span>手机*:</span> <span><input type="tel" name="mobile"
								placeholder="Mobile" style="width: 180px;" required="required" /></span></td>
					</tr>
					<tr>
						<td><span>电话&nbsp;:</span> <span><input type="text" name="phone"
								placeholder="Phone" style="width: 180px;" /></span></td>
						<td><span>邮箱&nbsp;:</span> <span><input type="email" name="email"
								placeholder="E-mail" style="width: 180px;" /></span></td>
					</tr>

				</table>
			</div>
		</div>
		<div class="container"
			style="height: 65%; width: 100%; margin-top: 15px;">
			<div style="height: 40px; font-size: 24px; line-height: 40px;color:black;">
				物业信息</div>
			<div class="main">
				<table class='tb'>
					<tr>
						<td><span>租金*:</span> <span><input type="number" name="money"
								required="required" placeholder="Price" style="width: 120px;" />人民币/月</span></td>
						<td><span>地区*:</span> <span> 
							<select name="district" style="width: 180px;">
									<option value="Former french consession" selected>Former french consession</option>
									<option value="Anting" >Anting</option>
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
								required="required" placeholder="Size" style="width: 120px;" />平方</span></td>
						
					</tr>
				
					<tr>
						<td colspan="2">地址（用英文表述）：<input type="text" required="required" name="address"
							style="width: 500px;" />
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
								<option value=0>0</option>
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
								required="required" style="width: 40px;" name="floor"/>
							层&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span>最短租期*:</span><span> <input type="number" name="year"
								required="required" style="width: 40px;" />年<input type="number"
								required="required" style="width: 40px;" name="month"/>月
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
					<input name="Amenities"  type="checkbox"  value="Outdoor">户外空间
					<input name="Amenities"  type="checkbox" value="Terrace">露台
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
					 <input name="Amenities"  type="checkbox" value="Microwave">微波炉 
					<input name="Amenities"  type="checkbox" value="Refrige">冰箱
					</td>					
					</tr>
					<tr>
						<td colspan="2">
						<span>附近地铁</span> <span>
							<select name="province" style="width: 50px;" onChange = "select()"></select>　
							<select name="city" style="width:120px;" onChange = "select()"></select>								
							<input type="number" name = "railwayTime" style="width: 30px;" />分钟（步行）.
							</span>
						</td>
					</tr>
						<tr>
						<td colspan="2">
						<span>附近地铁</span> <span>
							<select name="province1" style="width: 50px;" onChange = "select()"></select>　
							<select name="city1" style="width:120px;" onChange = "select()"></select>								
							<input type="number" name = "railwayTime1" style="width: 30px;" />分钟（步行）.
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">描述：<textarea name="desc"
								style="width: 550px; resize: none; vertical-align: top; height: 80px;"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">照片：<a href="javascript:void(0)" onclick="openfile()">点击这里上传照片</a>
						&nbsp;&nbsp;<span id="amounts"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							class="btn" type="button" onclick="addhouse()" value="下一步" />
							&nbsp;&nbsp;&nbsp;&nbsp; <input class="btn" type="Reset"
							onclick="goback()" value="重置" /></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</form>

	<div id="dlg_pic" class="container" 
		style="width: 450px; height: 400px;margin-left:30%;margin-top:28%; background: white;z-index: 50;position: absolute;display:none;">
		<div class="title">请上传照片</div>
		<div style="height:280px;margin-top:20px;margin-left:10px;overflow-y:auto;">
			<input type="file" id="file" style="vertical-align: top;" />
		</div>
		<div style="float: right;">
			<button onclick="picok()" style="margin-right: 10px;"
				class="btn" iconCls="icon-ok">上传
			</button>
			<button onclick="javascript:$('#dlg_pic').slideUp();$('#file').uploadify('cancel', '*')" style="margin-right: 10px;"
				class="btn" iconCls="icon-ok">关闭
			</button>
		</div>
	</div>
	
	<div id="mapdiv" style="width:400px;height:400px;margin-left:45%;background:white;z-index:99999;display:none;
							margin-top:30%;position:absolute;border:5px solid rgba(180,180,180,0.5);">
		<div style="height:10%;width:100%;text-align: center;padding-top:3%;">
			<input id="tipinput"/>
			<input type="button" value="search" onclick="search()"/>
			<img alt="get your location" src="<%=basePath%>images/setposition.png" 
				style="width:20px;height:20px;cursor: pointer;" onclick="getposition()">
				&nbsp;&nbsp;&nbsp;
			<input type="button" value="choose" onclick="choose()"/>
		</div>
		<div id="amap" style="height:88%;width:100%">
			
		</div>
		
	</div>
</body>
</html>