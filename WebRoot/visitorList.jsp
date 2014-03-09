<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'visitorList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    ====================集合属性校验器===================
    <s:fielderror/>
 	<form action="${pageContext.request.contextPath}/visitorListAction.action" method="post">
		<ul style="list-style:none; text-align: center;">
		  	<li style="float: left;width: 155px">用户名</li>
		  	<li style="float: left;width: 155px">密码</li>
		  	<li style="float: left;width: 155px">年龄</li>
		  	<li style="float: left;width: 155px">生日</li>
		  	<li style="float: left;width: 155px">地址</li>
		  	<li style="float: left;width: 155px">薪水</li>
		  	<li style="float: left;width: 155px">邮编</li>
		  </ul>
		  <div style="clear: both;"></div>
		<c:forEach items="new int[]{0,0,0,0}" varStatus="st">
		  <ul style="list-style:none;">
		  	<li style="float: left">
		  		<input name="userlist[${st.index}].name"/>
		  	</li>
		  	<li style="float: left">
		  		<input name="userlist[${st.index}].pwd" />
		  	</li>
		  	<li style="float: left">
		  		<input name="userlist[${st.index}].age"/>
		  	</li>
		  	<li style="float: left">
		  		<input name="userlist[${st.index}].birthday" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});"/>
		  	</li>
		  	<li>
		  		<input name="userlist[${st.index}].address" />
		  	</li>
		  	<li>
		  		<input name="userlist[${st.index}].sal" />
		  	</li>
		  	<li>
		  		<input name="userlist[${st.index}].myCode" />
		  	</li>
		  </ul>
		</c:forEach>
	   <div><input type="submit"/></div>
  </body>
</html>
