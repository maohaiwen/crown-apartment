<%@page import="com.mysql.jdbc.EscapeTokenizer"%>
<%@page import="com.bean.Users"%>
<%@page import="com.db.EasyDb"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="user" scope="session" class="com.bean.Users"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>bootstrap/css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user edit</title>
</head>
<body>
<form action="user_add_action.jsp" method="post">
				<p align="center">添加用户
				</p>
				<table class="table table-striped table-hover table-bordered" style="width:80%;margin-left:10%;" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#000000" style="border-collapse: collapse" bgcolor="#99CCFF">
					<caption align="left"></caption>
					
					<tr>
						<td height="20" align="center" nowrap>用户名 :</td>
						<td align="center" nowrap>
							<input type="text" name="username" size="10" required="required"  />
						</td>
						<td align="center" nowrap>密   码: </td>
						<td align="center" nowrap>
							<input type="text" name="password" size="10" required="required" />
						</td>
					</tr>
					<tr>
						<td align="center" nowrap>姓   名: </td>
						<td align="center" nowrap>
							<input type="text" name="realname" size="10" required="required" />
						</td>			
						<td height="23" align="center" nowrap>性   别:</td>
						<td align="center" nowrap>
							<input type="radio" name="sex" value="1" checked="checked" />男
							<input type="radio" name="sex" value="0" />女 
						</td>	
						<tr>
						<td colspan="7" align="center" style="text-align: center">
							<input type="submit" class="btn" name="submit" value="添加"/>
							&nbsp;&nbsp;<input class="btn" type="button" onclick="javascript:history.go(-1)" value="返回" />
						</td>
					</tr>		
					
				</table>
				
	</form>
</body>
</html>