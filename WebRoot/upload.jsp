<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ page import="com.util.*"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>��ѡ���ϴ���ͼƬ</title>
<style type="text/css">
	body,td,th {color: #000000;font: 12px Tahoma, "����";}
	body{margin:0px; background-color:{$UpLoadBackGroundColor};}
	form{margin:0px;}
	input{Border: 1px solid #999900;BackGround-Color: buttonface;Color: #000000;height:17px;font: 12px Tahoma, "����";}
	.red{color:#FF0000;}
</style>
<SCRIPT LANGUAGE="JavaScript">
function check()
{
    var files=document.all.file;
	var n=0;
   if(files.length!=undefined)
   {
	for(var i=0;i<files.length;i++)
	{
	      if(files[i].value!="")
		  {
		     n++;
		  }
	}
	if(n==0)
	{
	   alert("������ѡ��һ���ļ��ϴ���");
	   return false;
	}
   }
   else
   {
	  if(form1.file.value=="")
	  {
	   alert("��ѡ��Ҫ�ϴ����ļ�!");
       return false;
	  }
   }
}

function check_num(val_num)//�ж��Ƿ�Ϊint������
{
  var checkOK = "0123456789";
  var checkStr = val_num;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  var n=0;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
	   if(ch==checkOK.charAt(10))
	   {
	      n++;//�жϸ��ַ������м�����
	   }
    for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
        break;

    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
	if(n>1)//����ַ����е�ĸ���>1��,����
	{
		allValid=false;
		break;
	}
  }
  if (!allValid)
  {
    return (false);
  }
  return (true);
} 

function goto()
{
   var ss=document.form2.sum.value;
   if(!check_num(ss)){
      alert("��������ֵ�����ݣ�");
      return false;
   }
}
</SCRIPT>
<script language="javascript">
function del()
{
  var isok=true;
  isok=confirm("ȷ��Ҫɾ����?");
  return isok;
}
</script>
</head> 
<body>

<br><BR>
<div align=center>
 ��ѡ����Ҫ�ϴ����ļ����ļ���С�������4MB����!
</div>
<BR>
<fieldset style="padding: 2; width:450; height:120; " align=center>
<legend>�ϴ�ͼƬ</legend>
<form action="upload.jsp" method="post" name="form2">
<TABLE width="304" align="center">
	<TR>
		<TD width="115" height="33"><input type="text" name="sum" size=5 value="1">��
      <input type="Submit" name="go" value="�趨" id="go" onclick="return goto();">          <div align="right">      </TD>
		<TD width="177"><div align="left">(����ϴ���Ϊ10)</div></TD>
	</TR>
</TABLE>
</form>
<!-- ================================================ -->
	<form action="uploadimage.jsp" method="post" enctype="multipart/form-data" name="form1">
	<TABLE width="301" height="33" align="center">
	<TR>
		<TD width="55">�ļ�1��</TD>
		<TD width="242"><input type="file" name="file" size="30"></TD>
	</TR>
<%
    String str=request.getParameter("sum");
    int sums=0;
	try
	{
        sums=Integer.parseInt(str);
    }
	catch(Exception e)
	{
        sums = 1;
    }
    if(sums==0 || sums<0 )
	{}
	else
	{
		if( sums>10 ||sums==10)
			sums=10;
		for(int i=1;i<sums;i++)
		{
%>
	<TR>
		<TD width="55">�ļ�<%=i+1%>��</TD>
		<TD width="242"><input type="file" name="file" size="30"></TD>
	</TR>
<%
		}
	}
%>
    <TR>
		<TD></TD>
		<TD><input type="submit" name="Submit" value=" ����ϴ� " onClick="return check();" id="submit"> <input type="reset" name="reset" value=" ��� "  id="submit"></TD>
	</TR>
	</TABLE>
    </form>
</fieldset>
<BR><BR>
	<!-- ��ʾ�����ϴ���Ϣ -->
<%
	   int ipage=15;//ÿҳ��ʾ������
	   int allpage=0;//��ҳ��
	   int pages;//����ҳ�����
	   int cpage=1;//��ǰҳ
	   int spage;//��ʼҳ
	   int sum=0;//������

		   Connection con;
        try
	    {

		   con=DataBaseConnection.getConnection();
           Statement stmt=con.createStatement();
           String sql1="select count(*) from up_imges";

           ResultSet rs=stmt.executeQuery(sql1);
           rs.next();
           sum=rs.getInt(1);//��ȡ������
		}
		catch(Exception e)
		{
		  e.printStackTrace();
		}
	if(sum>=1)
	{
%>
<table border="1" align="center" cellpadding="2" cellspacing="1" bordercolordark="#FFFFFF" width="90%" align="center">
	<tr>
		<th bgcolor="#D2D3D9">���</th>
		<th bgcolor="#D2D3D9">��չ��</th>
		<th bgcolor="#D2D3D9">�ļ���ַ</th>
		<th bgcolor="#D2D3D9">����ͼ��ַ</th>
		<th bgcolor="#D2D3D9">��С</th>
		<th bgcolor="#D2D3D9">�ϴ�ʱ��</th>
		<th bgcolor="#D2D3D9">�ϴ���IP</th>
		<th bgcolor="#D2D3D9">����</th>
	</tr>
<%
		   //����������������ҳ��
		   if(sum%ipage==0)
		   {
              allpage=sum/ipage;
		   }else{
		      allpage=sum/ipage+1;
		   }
            //�жϲ���pages�Ƿ�Ϊ��
			if(request.getParameter("jumppages")==null){
			  pages=1;
			}
			else{
              pages=Integer.parseInt(request.getParameter("jumppages"));
			}
            //�жϵ�ǰҳ
			if(pages>allpage || pages==0){
			   cpage=1;
			}else{
			   cpage=pages;
			}
			spage=cpage*ipage;//�ж�Ҫ��ѯ��������
           int n=0,m=0;
        try
		{

		   con=DataBaseConnection.getConnection();
           Statement stmt=con.createStatement();

           String sql2="select * from up_imges 0,"+spage;
		   ResultSet rs2=stmt.executeQuery(sql2);

		   while(rs2.next())
		   {
			   if(n>(cpage-1)*ipage-1)
			  {
				   m++;
			      int id=rs2.getInt(1);
			      String wid_name=rs2.getString(2);
			      String path=rs2.getString(3);
			      String min_path=rs2.getString(4);
			      int size=rs2.getInt(5);
		          String time=rs2.getString(6);
				  String ip=rs2.getString(7);
%>
    <tr align=center  style="font-size:14px" height=25> 
      <td>
	  <%=m%>
	  </td>
      <td>
	  <%if(wid_name==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=wid_name%>
	  <%}%>
	  </td>
      <td>
	  <%if(path==""){%>
	  &nbsp;
	  <%}else{%>
	  <a href="<%=request.getContext %>/<%=path%>" target="_blank"><%=path%></a>
	  <%}%>
	  </td>
      <td>
	  <%if(min_path==""){%>
	  &nbsp;
	  <%}else{%>
	  <a href="http://localhost:8080/ch2/<%=min_path%>" target="_blank"><%=min_path%></a>
	  <%}%>
	  </td>
      <td>
	  <%if(String.valueOf(size)==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=size%>
	  <%}%>
	  </td>
      <td>
	  <%if(time==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=time%>
	  <%}%>
	  </td>
	  <td>
	  <%if(ip==""){%>
	  &nbsp;
	  <%}else{%>
	  <%=ip%>
	  <%}%>
	  </td>
	  <td><a href="delimg.jsp?id=<%=id%>&name=<%=path%>&min_name=<%=min_path%>" onclick="return del();">ɾ��</a></td>
    </tr>
<% 
			   }
	       n++;
	  }	  
	}
	catch(Exception e)
	{
		   e.printStackTrace();
	}
%>
  </table>
<%if(allpage!=1 && sum!=0)
	{
%>
<div align=center>
<form name="PageForm" action="upload.jsp" method="get">
ÿҳ<%=ipage%>��
 ��<%=sum%>��
 ��<%=cpage%>ҳ
 ��<%=allpage%>ҳ
������
<%if(cpage==1){ out.print(" ��ҳ ��һҳ");   }else{  %>   
<A HREF="upload.jsp?jumppages=<%=1%>">��ҳ</A>
<A HREF="upload.jsp?jumppages=<%=cpage-1%>">��һҳ</A>
<%}%>
<%if(cpage==allpage){ out.print("��һҳ βҳ");   }else{  %>   
<A HREF="upload.jsp?jumppages=<%=cpage+1%>">��һҳ</A>
<A HREF="upload.jsp?jumppages=<%=allpage%>">βҳ</A>
<%
	}
}
}
%>

</form>
</div>
<BR><BR>
</body>
</html>