<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
  =======================使用action验证方法validator()和validatorXxxx()=================
     <s:fielderror/>
   <s:form action="validateLoginAction" method="post" theme="simple">
   	用户名：<s:textfield name="name"/><br/>
   	密码：<s:textfield name="pwd"/><br/>
   	出生日期:<sx:datetimepicker name="date" label="Format (yyyy-MM-dd)" displayFormat="yyyy-MM-dd hh:mm:ss"/><br/>
   	<s:submit value="提交"/>
   </s:form>
  </body>
</html>
