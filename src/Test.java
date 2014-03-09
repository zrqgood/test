import java.util.zip.DataFormatException;

public class Test {
	public static void main(String[] args){  
    try{  
    	System.out.println(doStuff(100));
        System.out.println(doStuff(-1));  
    }catch(Exception e){  
    	//<span style="white-space: pre;">    </span>System.out.println("这里是永远都不会到达的");  
    	e.printStackTrace();
    	} 
    } 
	
	
	//该方法抛出受检异常  
	public static int doStuff(int _p)throws Exception{  
	  try{  
	      if(_p < 0){  
	          throw new DataFormatException("数据格式错误");  
	      }else{  
	          return _p;  
	      }  
	  }catch(Exception e){  
	      //异常处理  
	      throw e;  
	  }finally{  
	      //return -1;  
	  }  
	} 
}
