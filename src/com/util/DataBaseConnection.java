package com.util;
import java.sql.*;
import java.util.*;

//�������ݿ⹤����
public class DataBaseConnection
{
	/**
	  *һ����̬����������һ�����ݿ�����
	  *�����ﵽ�˶����ݿ�ͳһ���Ƶ�Ŀ��
	  */
	  

//#MySQL ���ݿ�������Ϣ
//#MySQL ���ݿ���������
//String MySQLDriver="org.gjt.mm.mysql.Driver"

//#MySQL���ݿ������ַ�����
//#upload Ϊ���ݿ�����userΪ��¼�û���,passwordΪ��¼���롣�����и��ġ�
//String MySQLURL="jdbc:mysql://localhost:3306/upload?user=sa&password=&useUnicode=true&characterEncoding=GBK"

//#SQL Server ���ݿ�������Ϣ
//#SQL Server ��������
//String SQLDriver="net.sourceforge.jtds.jdbc.Driver";

//#SQL Server ���ݿ������ַ���
//#upload Ϊ���ݿ�����user Ϊ��¼�û�����password Ϊ��¼���롣�����и��ġ�
//String SQLURL="jdbc:jtds:sqlserver://localhost:1433/upload;user=sa;password=";


	  
	  public static  Connection getConnection()
	  {
          Connection con=null;
         /* String SQLDriver="net.sourceforge.jtds.jdbc.Driver";
          String SQLURL="jdbc:jtds:sqlserver://localhost:1433/upload;user=sa;password=";*/
          String MySQLDriver="org.gjt.mm.mysql.Driver";
          String MySQLURL="jdbc:mysql://localhost:3306/upload?user=root&password=root&useUnicode=true&characterEncoding=GBK";
		  try
		  {
		  Class.forName(MySQLDriver).newInstance();
		  con=DriverManager.getConnection(MySQLURL);
		  }
		  catch(Exception e)
		  {
		     e.printStackTrace();
		  }
		  return con;
	}
};

//�Ժ��������ļ�����Ϳ���ֱ�ӵ���Connection con=DataBaseConnection.getConnection();��������ݿ������