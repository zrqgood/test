<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.util.*"%>

<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>

<BODY>
<%
   String ids=request.getParameter("id");
   String name1=request.getParameter("name");
   String name2=request.getParameter("min_name");

   int s1=name1.indexOf("/");
   String n1=name1.substring(s1+1,name1.length()); //Ҫɾ�����ļ���
   String subPath=name1.substring(0,s1);   //��ȡ�ļ�����
   int s2=name2.indexOf("/");
   String n2=name2.substring(s2+1,name2.length());//Ҫɾ���������ļ���

   String FilePath=request.getRealPath("");
   String allPath=FilePath+"\\"+subPath+"\\"; //��ȡ��������·��
   
   java.io.File delFile=new java.io.File(allPath,n1);
   if(delFile.exists())
      delFile.delete(); //������ļ����ڣ���ɾ��
   java.io.File min_delFile=new java.io.File(allPath,n2);
   if(min_delFile.exists())
      min_delFile.delete(); //������ļ����ڣ���ɾ��
   try
   {
	   String sql="delete up_imges where id="+ids;
       Connection con=DataBaseConnection.getConnection();
	   PreparedStatement pstmt=con.prepareStatement(sql);
	   pstmt.executeUpdate();
       out.println("<SCRIPT language=javascript>alert('ɾ���ɹ���');window.location='upload.jsp';</script>");
   }
   catch(Exception e)
   {
      e.printStackTrace();
   }

%>
</BODY>
</HTML>
