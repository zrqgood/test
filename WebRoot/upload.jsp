<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ page import="com.util.*"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>请选择上传的图片</title>
<style type="text/css">
	body,td,th {color: #000000;font: 12px Tahoma, "宋体";}
	body{margin:0px; background-color:{$UpLoadBackGroundColor};}
	form{margin:0px;}
	input{Border: 1px solid #999900;BackGround-Color: buttonface;Color: #000000;height:17px;font: 12px Tahoma, "宋体";}
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
	   alert("请至少选择一个文件上传！");
	   return false;
	}
   }
   else
   {
	  if(form1.file.value=="")
	  {
	   alert("请选择要上传的文件!");
       return false;
	  }
   }
}

function check_num(val_num)//判断是否为int型数据
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
	      n++;//判断该字符串中有几个点
	   }
    for (j = 0;  j < checkOK.length;  j++)
	  if (ch == checkOK.charAt(j))
        break;

    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
	if(n>1)//如果字符串中点的个数>1的,错误
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
      alert("请输入数值型数据！");
      return false;
   }
}
</SCRIPT>
<script language="javascript">
function del()
{
  var isok=true;
  isok=confirm("确信要删除吗?");
  return isok;
}
</script>
</head> 
<body>

<br><BR>
<div align=center>
 请选择您要上传的文件，文件大小请控制在4MB以内!
</div>
<BR>
<fieldset style="padding: 2; width:450; height:120; " align=center>
<legend>上传图片</legend>
<form action="upload.jsp" method="post" name="form2">
<TABLE width="304" align="center">
	<TR>
		<TD width="115" height="33"><input type="text" name="sum" size=5 value="1">　
      <input type="Submit" name="go" value="设定" id="go" onclick="return goto();">          <div align="right">      </TD>
		<TD width="177"><div align="left">(最大上传数为10)</div></TD>
	</TR>
</TABLE>
</form>
<!-- ================================================ -->
	<form action="uploadimage.jsp" method="post" enctype="multipart/form-data" name="form1">
	<TABLE width="301" height="33" align="center">
	<TR>
		<TD width="55">文件1：</TD>
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
		<TD width="55">文件<%=i+1%>：</TD>
		<TD width="242"><input type="file" name="file" size="30"></TD>
	</TR>
<%
		}
	}
%>
    <TR>
		<TD></TD>
		<TD><input type="submit" name="Submit" value=" 点击上传 " onClick="return check();" id="submit"> <input type="reset" name="reset" value=" 清空 "  id="submit"></TD>
	</TR>
	</TABLE>
    </form>
</fieldset>
<BR><BR>
	<!-- 显示所有上传信息 -->
<%
	   int ipage=15;//每页显示的行数
	   int allpage=0;//总页数
	   int pages;//接受页码变量
	   int cpage=1;//当前页
	   int spage;//开始页
	   int sum=0;//总行数

		   Connection con;
        try
	    {

		   con=DataBaseConnection.getConnection();
           Statement stmt=con.createStatement();
           String sql1="select count(*) from up_imges";

           ResultSet rs=stmt.executeQuery(sql1);
           rs.next();
           sum=rs.getInt(1);//获取总行数
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
		<th bgcolor="#D2D3D9">编号</th>
		<th bgcolor="#D2D3D9">扩展名</th>
		<th bgcolor="#D2D3D9">文件地址</th>
		<th bgcolor="#D2D3D9">缩略图地址</th>
		<th bgcolor="#D2D3D9">大小</th>
		<th bgcolor="#D2D3D9">上传时间</th>
		<th bgcolor="#D2D3D9">上传人IP</th>
		<th bgcolor="#D2D3D9">操作</th>
	</tr>
<%
		   //根据总行数计算总页数
		   if(sum%ipage==0)
		   {
              allpage=sum/ipage;
		   }else{
		      allpage=sum/ipage+1;
		   }
            //判断参数pages是否为空
			if(request.getParameter("jumppages")==null){
			  pages=1;
			}
			else{
              pages=Integer.parseInt(request.getParameter("jumppages"));
			}
            //判断当前页
			if(pages>allpage || pages==0){
			   cpage=1;
			}else{
			   cpage=pages;
			}
			spage=cpage*ipage;//判断要查询的总行数
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
	  <td><a href="delimg.jsp?id=<%=id%>&name=<%=path%>&min_name=<%=min_path%>" onclick="return del();">删除</a></td>
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
每页<%=ipage%>行
 共<%=sum%>行
 第<%=cpage%>页
 共<%=allpage%>页
　　　
<%if(cpage==1){ out.print(" 首页 上一页");   }else{  %>   
<A HREF="upload.jsp?jumppages=<%=1%>">首页</A>
<A HREF="upload.jsp?jumppages=<%=cpage-1%>">上一页</A>
<%}%>
<%if(cpage==allpage){ out.print("下一页 尾页");   }else{  %>   
<A HREF="upload.jsp?jumppages=<%=cpage+1%>">下一页</A>
<A HREF="upload.jsp?jumppages=<%=allpage%>">尾页</A>
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