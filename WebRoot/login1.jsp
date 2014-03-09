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
  =====================使用非字段校验器=======================
  <s:fielderror/>
   <s:form action="validatorAction" method="post" theme="simple">
   	用户名：<s:textfield name="name"/><br/>
   	年龄：<s:textfield name="age"/><br/>
   	<s:submit value="提交"/>
   </s:form>
  </body>
</html>
