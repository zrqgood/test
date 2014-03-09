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
    <s:head theme="xhtml"/>
    <sx:head parseContent="true"/>
  </head>
  
  <body>
  ==================使用内置校验器  表达式校验器  和  字段表达式校验器========================
  <s:fielderror/>
   <s:form action="expressionAction" method="post" theme="simple">
   min1：<s:textfield name="min1"/><br/>
   max1：<s:textfield name="max1"/><br/>
   min2：<s:textfield name="min2"/><br/>
   max2：<s:textfield name="max2"/><br/>
    <s:submit value="提交"/>
   </s:form>
  </body>
</html>
