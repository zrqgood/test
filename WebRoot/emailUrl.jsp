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
  ==================使用内置校验器 中的字段校验器========================
  <s:fielderror/>
   <s:form action="emailUrlAction" method="post" theme="simple">
   	邮箱：<s:textfield name="email"/><br/>
   	网址：<s:textfield name="url"/><br/>
   	<s:submit value="提交"/>
   </s:form>
  </body>
</html>
