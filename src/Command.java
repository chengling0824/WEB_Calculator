import java.util.*;
import javax.script.ScriptException;

public class Command {
	public static void main(String[] args){
		try{
			boolean[] flag = new boolean[2];
			flag[0]=flag[1]=false;
			for(int i=0;i<args.length;i++){
				if(args[i].equals("-n")){
					if(i+1>=args.length){
						System.out.println("输入格式有误\n");
						throw new MyException();
					}
					
					flag[0]=true;
					Main.num_of_formula = Integer.parseInt(args[i+1]);
					if(Main.num_of_formula>10000||Main.num_of_formula<=0){
						System.out.println("数值范围错误\n");
				    	throw new MyException();
					}
					i++;
				}
				else if(args[i].equals("-m")){
					if(i+2>=args.length){
						System.out.println("输入格式有误\n");
						throw new MyException();
					}
					
					flag[1]=true;
					Main.low = Integer.parseInt(args[i+1]);
					Main.high = Integer.parseInt(args[i+2]);
					
					if(Main.low<0||Main.low>100||Main.high<50||Main.high>1000||Main.low>Main.high){
						System.out.println("数值范围错误\n");
						throw new MyException();
					}
					i+=2;
				}
				else if(args[i].equals("-o")){
					if(i+1>=args.length){
						System.out.println("输入格式有误\n");
						throw new MyException();
					}
					
					Main.maxmum_of_operation = Integer.parseInt(args[i+1]);
					
					if(Main.maxmum_of_operation<0||Main.maxmum_of_operation>10){
						System.out.println("数值范围错误\n");
						throw new MyException();
					}
					i++;
				}
				else if(args[i].equals("-c")){
					Main.kind_of_operation = 4;
				}
				else if(args[i].equals("-b")){
					Main.isBracket = 1;
				}
				else{
					System.out.println("输入格式有误\n");
					throw new MyException();
				}
			}
			if((flag[0]&&flag[1])==false){
				System.out.println("输入格式有误\n");
				throw new MyException();
			}
			new Main().main(null);
		
		}
		catch (NumberFormatException nfe) {
			System.out.println(""+
					"   1. -n 设定题目数量 【必须】\n"+
					"    使用示例：java Command -n 20\n"	+
					"    正常的-n 参数范围为 1 ~ 10000\n\n"+
					"   2. -m [lower] [upper] 设定题目数值的范围 【必须】\n"+
					"    使用示例：java Command -m 1 100\n"+
					"    正常的-m 下界参数范围为 1到100，上界参数范围为 50到1000\n\n"+
					"   3. -o 设定题目中最多几个运算符 【非必须，默认为1】\n"+
					"    使用示例：java Command -o 5\n"+
					"    正常的-o 参数范围为 1 ~ 10\n\n"+
					"   4. -c 设定题目中是否有乘除法 【非必须，默认没有】\n"+
					"    使用示例：如果有乘除法，则带-c参数：java Command -c ；否则视为不可产生乘除法。\n\n"+
					"   5. -b 设定题目中是否有括号 【非必须，默认没有】\n"+
					"    使用示例：如果有括号，则带-b参数：java Command -b；否则视为不可产生括号。\n"+
					"    如果生成的算式有括号，括号数量必须小于等于算式的运算符个数。\n");
			
		}
		catch(MyException e){
			//e.printStackTrace();
		}
	
	}
	
}