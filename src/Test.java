import java.util.zip.DataFormatException;

public class Test {
	public static void main(String[] args){  
    try{  
    	System.out.println(doStuff(100));
        System.out.println(doStuff(-1));  
    }catch(Exception e){  
    	//<span style="white-space: pre;">    </span>System.out.println("��������Զ�����ᵽ���");  
    	e.printStackTrace();
    	} 
    } 
	
	
	//�÷����׳��ܼ��쳣  
	public static int doStuff(int _p)throws Exception{  
	  try{  
	      if(_p < 0){  
	          throw new DataFormatException("���ݸ�ʽ����");  
	      }else{  
	          return _p;  
	      }  
	  }catch(Exception e){  
	      //�쳣����  
	      throw e;  
	  }finally{  
	      //return -1;  
	  }  
	} 
}
