<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  
  <body>
  ========================使用字段校验器==================
  <s:fielderror/>
   <s:form action="userAction" method="post" theme="simple">
   	用户名：<s:textfield name="user.name"/><br/>
   	密码：<s:textfield name="user.pwd"/><br/>
   	手机版：<s:textfield name="user.mobile"/><br/>
   	<s:submit value="提交"/>
   </s:form>
  </body>
</html>
