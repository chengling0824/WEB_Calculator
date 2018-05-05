import java.util.*;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
public class Main {
	public static String text = "";
	public static int maxmum_of_operation = 1;
	public static int low=1;
	public static int high=100;
	public static int isBracket=0;
	public static int kind_of_operation = 2;
	public static int num_of_formula;
	
	
	public static void main(String[] args){
		    createFormula(num_of_formula);
		    text = text.replace('/', '÷');
			createFile();
	}
	
	public static void createFormula(int nf) 
	{
		for(int i=0;i<nf;i++){
			Random r = new Random();
			Formula f = new Formula(r.nextInt(maxmum_of_operation)+1);
			f.num[0] = r.nextInt(high)+low;
			f.setOps();
			
			for(int j=1;j<=f.num_of_operation;j++){//make single formula
				f.num[j] = r.nextInt(high)+low;
				if(f.ops[j]==3){//specialize divide 
					f.num[j] = r.nextInt(10)+1;
					for(;;){
						int t = r.nextInt(high)+low;
						if(t*f.num[j]<=high){
							f.num[j-1] = t*f.num[j];
							break;
						}
					}
				}
				
			}
			//添加括号
			int pos = 0;
			int change = 0;
			if(f.num_of_operation==1&&isBracket==1){
				change = 1;
				 isBracket=0;
			}
			if(isBracket==1){
				do{
					pos = r.nextInt(f.num_of_operation)+1;
				}
				while(f.ops[pos-1]==3||f.ops[pos+1]==3);
			}
			if(change==1) isBracket = 1;
			
			if(pos==1) f.str = "(" + f.num[0];
			else f.str= f.num[0]+"";
			for(int j=1;j<=f.num_of_operation;j++){
				if(pos==j+1) f.createString(f.ops[j], f.num[j]+"", 1);
				else f.createString(f.ops[j], f.num[j]+"", 0);
				if(j==pos) f.str+=")";
			}
			f.setAns();
			f.ans = f.getAns();
			if(f.ans<low||f.ans>high){
				i = i-1;
				continue;
			}
			//f.str+=" = " + f.ans + "\r\n";
			f.str+=" = \r\n";
			text += f.str;
			
			//System.out.println(f.str);//temp
		}
	}
	
	public static void createFile()
	{
		try{
	        File file = new File("result.txt");
	        if(file.createNewFile()){
	        	Writer out = new FileWriter(file);
	            out.write(text);
	            out.close();
	            System.out.println("文件创建成功！");
	        }
	        else{
	            System.out.println("出错了，该文件已经存在。");
	        }
	    }
	    catch(IOException ioe) {
	        ioe.printStackTrace();
	    }
	}
}
