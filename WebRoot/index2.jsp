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
	<% 
		String uniqueId=(String)session.getAttribute("UniqueId");
		String requestId=request.getParameter("uniqueid");
		System.out.println(uniqueId);
		System.out.println(requestId);
		if(uniqueId!=null&&requestId!=null&&uniqueId.equals(requestId)){
			session.removeAttribute("UniqueId");
			request.getRequestDispatcher("index3.jsp").forward(request, response);
		}else{%>
			<script type="text/javascript">
			<%
			//System.out.println(uniqueId);
			//System.out.println(requestId);
			%>
			
			alert("已提交");
			
			</script>
	<% 	}
	%>
  </head>
  已提交
  <body>
  </body>
</html>
