<%@page import="com.bean.Users"%>
<%@page import="com.db.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
        EasyDb easyDb=new EasyDb();
int count1=easyDb.setTable("user_enquire").count();
int count2=easyDb.setTable("enquire_house_map").count();
		System.out.println(count1);
		System.out.println(count2);
              		 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>CrownApartment后台管理系统</title>
    <link href="<%=basePath %>css/default.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>js/themes/icon.css" />
    <script type="text/javascript" src="<%=basePath %>js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/jQuery.easyui.js"></script>
	<script type="text/javascript" src='<%=basePath %>js/outlook2.js'> </script>

    <script type="text/javascript">
    var basePath = "<%=basePath%>";
	var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"用户模块",
							"menus":[{"menuname":"密码修改","icon":"icon-add","url":"alterpw.jsp"},
									{"menuname":"用户管理","icon":"icon-add","url":"user_manage.jsp"}							
								]
						},{"menuid":"8","icon":"icon-sys","menuname":"房源模块",
							"menus":[{"menuname":"房源管理（出租）","icon":"icon-add","url":"house0.jsp"},
									{"menuname":"业主委托（未审核）","icon":"icon-add","url":"house1.jsp"},
							{"menuname":"房源管理（已租）","icon":"icon-add","url":"house2.jsp"},
							{"menuname":"房源添加","icon":"icon-add","url":"addhouse.jsp"}
								]
						},{"menuid":"28","icon":"icon-sys","menuname":"询问模块",
							"menus":[{"menuname":"Inquiry","icon":"icon-add","url":"user_enquiry.jsp"},
									{"menuname":"House inquiry","icon":"icon-add","url":"house_enquiry.jsp"}
								]
						}
				]};
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function close() {
            $('#w').window('close');
        }

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            })
        }
        
        function checkHouse(){
        	$.ajax({
    			url:basePath+"houseServlet.do?flag=queryExpire",
    			type:"post",
    			data: null,
    			dataType:"json",
    			success:function(data){
    				if(data.length >= 1){
    					var msg = "";
    					for(var i=0;i<data.length;i++){
    						if(i != data.length - 1){
    							msg += "<a style='color:blue' href='javascript:addTab(\"修改房源\",\"doalterhouse.jsp?changestate=1&id="+data[i].id+"\")'>" + data[i].serial + "</a>" + ",";
    						}else{
    							msg += "<a style='color:blue' href='javascript:addTab(\"修改房源\",\"doalterhouse.jsp?changestate=1&id="+data[i].id+"\")'>" + data[i].serial + "</a>";
    						}
    					}
    					$.messager.show({
    		        		title: '有房源到期了',  
    		        		height:150,
    		                msg: msg,  
    		                timeout: 100000,  
    		                showType: 'slide'
    		        	});
    				}
    			},
    			error:function(){
    				alert("请求失败");
    			}
    		});
        }

        $(function() {
        	checkHouse();
            openPwd();
            //
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

           

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = 'login.jsp';
                    }
                });

            })
        });
		
		

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
<noscript>
<div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    <img src="<%=basePath %>images/noscript.gif" alt='抱歉，请开启脚本支持！' />
</div></noscript>
    <div region="north" split="true" border="false" style="overflow: hidden; height: 30px;
        background: url(<%=basePath %>images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
        <span style="float:right; padding-right:20px;" class="head">
       <span style="color: red;"> Inquiry:<%=count1%>
        House inquiry:<%=count2%></span>
        	欢迎 
        	<%
        		Users user = (Users)session.getAttribute("user");
        		System.out.print(user.getRealName());
        		
        		if(user.getRealName() != null){
        			out.print(user.getRealName());
        		}
       		 %>
        <!--   <a href="#" id="editpass">修改密码</a>--> <a href="#" id="loginOut">安全退出</a></span>
        <span style="padding-left:10px; font-size: 16px; "><img src="<%=basePath %>images/blocks.gif" width="20" height="20" align="absmiddle" /> </span>
    </div>
    <div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
        <div class="footer">_________</div>
    </div>
    <div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
<div class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->
				
			</div>

    </div>
    <div id="mainPanle" region="center" style="background: white; overflow-y:hidden">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
				
			<h1>欢迎使用Crown apartment后台管理系统！</h1>

			</div>
		</div>
    </div>
    
    
    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false"
        maximizable="false" icon="icon-save"  style="width: 300px; height: 150px; padding: 5px;
        background: #fafafa;">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >
                    确定</a> <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)"
                        onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div>

	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>

</body>
</html>