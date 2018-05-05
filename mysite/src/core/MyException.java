package core;

public class MyException extends Exception{
	public MyException(){
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
}
