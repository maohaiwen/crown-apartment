<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Users user = (Users)session.getAttribute("user");
	String username=user.getUserName();
	String userpw=user.getPassWord();
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<meta charset="UTF-8" />
<title>管理员密码修改</title>
 <script type="text/javascript">
 function check()
 {
	 
      var userPwReal='<%=userpw%>';
      if(document.getElementById("apassword").value!=userPwReal)
      {
          alert("原密码不正确");
          return ;
      }
       
      if(document.getElementById("userPw1").value =="")
      {
          alert("新密码不能空");
          return ;
      }
      if(document.getElementById("userPw2").value =="")
      {
          alert("新密码不能空");
          return ;
      }
      if(document.getElementById("userPw1").value != document.getElementById("userPw2").value)
      {
          alert("两次输入的密码不一致");
          return ;
      }
 }
 </script>
</head>
<body style="background-color: white;font-family: 微软雅黑">
	<form action="doalter.jsp" method="post" autocomplete="on">
		<table align="center">
			<h2 align="center">修改密码</h2> 
			<tr bgcolor="#FFFFFF">
   				 <td width="25%" bgcolor="#FFFFFF" align="right"> 登录名： </td>
    			 <td width="75%" bgcolor="#FFFFFF">
        				<input type="text" value=<%= username %> name="admin.aname" size="20" readonly />
				 </td>
  			</tr>
			<tr bgcolor="#FFFFFF">
    			 <td width="25%" bgcolor="#FFFFFF" align="right">原密码：</td>
    			 <td width="75%" bgcolor="#FFFFFF">
                        <input  type="password" id="apassword" required="required" name="apassword" size="20"/>
    			 </td>
			</tr>
			<tr bgcolor="#FFFFFF">
   				 <td width="25%" bgcolor="#FFFFFF" align="right"> 新密码： </td>
			    <td width="75%" bgcolor="#FFFFFF">
			        <input  type="password" id="userPw1" required="required" name="userPw1" size="20"/>
			    </td>
			</tr>
			<tr bgcolor="#FFFFFF">
    			<td width="25%" bgcolor="#FFFFFF" align="right">确认密码： </td>
			    <td width="75%" bgcolor="#FFFFFF">
			           <input  type="password" id="userPw2" required="required" name="userPw2"size="20"/>
			    </td>
			</tr>
			<tr bgcolor="#FFFFFF">
			    <td width="25%" bgcolor="#FFFFFF" align="right">
			        &nbsp;
			    </td>
			       <td width="75%" bgcolor="#FFFFFF">
			            <input class="btn" type="submit" value="修改" />
			            &nbsp;&nbsp;&nbsp;
			            <input class="btn" type="reset" value="重置"/>
			       </td>
			</tr>
	</table>
	 <p align="center">
									<font color="red"><%String s = (String)request.getAttribute("msg");
														if(s != null){
															out.print(s);
														}
													  %></font>
								</p>
	</form>	
</body>
</html>

