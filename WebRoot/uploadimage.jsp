<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ page import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.util.*,com.util.*,java.net.*;" %>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%
   SmartUpload mySmartUpload =new SmartUpload();
   long file_size_max=4000000;
   String fileName2="",ext="",testvar="";
   String url="uploadfile/"; //�ϴ��ļ������ļ���,�����и���
   String SubPath=request.getRealPath("");
   SubPath=SubPath+"\\uploadfile";
   java.io.File createSub=new java.io.File(SubPath);
   if(!createSub.exists())
   {
       createSub.mkdir();//����ļ��в����ڣ��򴴽�
   }
   mySmartUpload.initialize(pageContext);   //��ʼ��

	String FileListType="jpg,gif,jpeg,JPEG";//ֻ�������ش����ļ�,�����и��� 
try
{
	mySmartUpload.setAllowedFilesList(FileListType);
    //�����ļ� 
    mySmartUpload.upload();
} 
catch (Exception e)
{
%>
    <SCRIPT language=javascript>
	  var filelistType="jpg,gif,jpeg,JPEG";
      alert("ֻ�����ϴ�"+filelistType+"�����ļ�");
      window.location='upload.jsp';
	</script>
<%
}
 try
 {
//ѭ�������ļ�

int count=0;
for (int i=0;i<mySmartUpload.getFiles().getCount();i++) 
{ 

	com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
    if (myFile.isMissing())
	{ continue;}
    else
	{
	  count++;
      //String myFileName=myFile.getFileName(); //ȡ�����ص��ļ����ļ���
      ext= myFile.getFileExt();      //ȡ�ú�׺��
      int file_size=myFile.getSize();     //ȡ���ļ��Ĵ�С  
      String saveurl="";
      if(file_size<file_size_max)
	  {
          //�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ
       Calendar calendar = Calendar.getInstance();
       String filename = String.valueOf(calendar.getTimeInMillis()); 

       saveurl=request.getRealPath("/")+url;

       saveurl+=filename+"."+ext;          //����·��
       myFile.saveAs(saveurl,mySmartUpload.SAVE_PHYSICAL);

//-----------------------�ϴ���ɣ���ʼ��������ͼ-------------------------    
       java.io.File file = new java.io.File(saveurl); //����ղ��ϴ����ļ�
       String newurl=request.getRealPath("/")+url+filename+"_min."+ext;
	   //�µ�����ͼ�����ַ
       Image src = javax.imageio.ImageIO.read(file);                     //����Image����
       float tagsize=150;
       int old_w=src.getWidth(null);   //�õ�Դͼ��                                  
       int old_h=src.getHeight(null);   //�õ�Դͼ��
       int new_w=0;//����ͼ��
       int new_h=0;//����ͼ��
       int tempsize;
       float tempdouble; 
       if(old_w>old_h)
	   {
          tempdouble=old_w/tagsize;
       }
	   else
	   {
          tempdouble=old_h/tagsize;
       }
       new_w=Math.round(old_w/tempdouble);
       new_h=Math.round(old_h/tempdouble);//������ͼ����
       BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
       tag.getGraphics().drawImage(src,0,0,new_w,new_h,null);       //������С���ͼ
       FileOutputStream newimage=new FileOutputStream(newurl);          //������ļ���
	   
       JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);       
       encoder.encode(tag);                                               //��JPEG����
       newimage.close(); 

////////////////���������/////////////////////////
	   //��ȡ������IP
	   java.net.InetAddress hostIp=null,myIp=null;   
       try{   
            //hostIp =java.net.InetAddress.getHostAddress(); 
			myIp   =java.net.InetAddress.getLocalHost();
       }  
       catch(UnknownHostException e)   
       {   
            e.printStackTrace();   
            out.println("��ѯ����ip");   
       } 

	   String ul=filename+"."+ext;
	   String min_ul=filename+"_min."+ext;

	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
       String dateStr = sdf.format(new java.util.Date());//��ʽ����ǰʱ��
       try
	   {
	        
   Connection con=DataBaseConnection.getConnection();
	           PreparedStatement pstmt=con.prepareStatement("insert into up_imges (wid_name,path,min_path,sizes,times,ip) values(?,?,?,?,?,?)");
		       pstmt.setString(1,ext);
		       pstmt.setString(2,url+ul);
		       pstmt.setString(3,url+min_ul);
		       pstmt.setInt(4,file_size);
		       pstmt.setString(5,dateStr);
		       pstmt.setString(6,myIp.toString());
			   pstmt.executeUpdate();
		 }
	     catch(Exception ee)
	     {
			 ee.printStackTrace();
			 out.println("<SCRIPT language='javascript'>alert('�������ݿ�ʧ�ܣ�');window.location='upload.jsp;'</script>");
		 }
////////////////���������/////////////////////////
      }
      else
      {
        out.print("<SCRIPT language='javascript'>");
        out.print("alert('�ϴ��ļ���С���ܳ���"+(file_size_max/1000)+"K');");
        out.print("window.location='upload.jsp;'");
        out.print("</SCRIPT>");
      }
    } 
}
out.println("<SCRIPT language=javascript>alert('"+count+"��ͼƬ�ϴ��ɹ���');window.location='upload.jsp';</script>");
}
catch (Exception e)
{
   e.toString();
} 

%> 

