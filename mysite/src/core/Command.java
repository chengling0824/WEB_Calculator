package core;
import java.util.*;
import javax.script.ScriptException;

public class Command {
	public Command(){}
	static Core core = new Core();
	public static void main(String[] args){
		try{
			boolean[] flag = new boolean[2];
			flag[0]=flag[1]=false;
			for(int i=0;i<args.length;i++){
				if(args[i].equals("-n")){
					if(i+1>=args.length){
						System.out.println("-n�����ʽ����\n");
						throw new MyException();
					}
					
					flag[0]=true;
					Core.num_of_formula = Integer.parseInt(args[i+1]);
					if(Core.num_of_formula>10000||Core.num_of_formula<=0){
						System.out.println("-n��ֵ��Χ����\n");
				    	throw new MyException();
					}
					i++;
				}
				else if(args[i].equals("-m")){
					if(i+2>=args.length){
						System.out.println("-m�����ʽ����\n");
						throw new MyException();
					}
					
					flag[1]=true;
					Core.low = Integer.parseInt(args[i+1]);
					Core.high = Integer.parseInt(args[i+2]);
					
					if(Core.low<0||Core.low>100||Core.high<50||Core.high>1000||Core.low>Core.high){
						System.out.println("-m��ֵ��Χ����\n");
						throw new MyException();
					}
					i+=2;
				}
				else if(args[i].equals("-o")){
					if(i+1>=args.length){
						System.out.println("-o�����ʽ����\n");
						throw new MyException();
					}
					
					Core.maxmum_of_operation = Integer.parseInt(args[i+1]);
					
					if(Core.maxmum_of_operation<0||Core.maxmum_of_operation>10){
						System.out.println("-o��ֵ��Χ����\n");
						throw new MyException();
					}
					i++;
				}
				else if(args[i].equals("-c")){
					Core.kind_of_operation = 4;
				}
				else if(args[i].equals("-b")){
					Core.isBracket = 1;
				}
				else{
					System.out.println("�����ʽ����\n");
					throw new MyException();
				}
			}
			if((flag[0]&&flag[1])==false||args.length==0){
				System.out.println("�����ʽ����\n");
				throw new MyException();
			}
			
			core.main(null);
			
		
		}
		catch (NumberFormatException nfe) {
			System.out.println(""+
					"   1. -n �趨��Ŀ���� �����롿\n"+
					"    ʹ��ʾ����java Command -n 20\n"	+
					"    ������-n ������ΧΪ 1 ~ 10000\n\n"+
					"   2. -m [lower] [upper] �趨��Ŀ��ֵ�ķ�Χ �����롿\n"+
					"    ʹ��ʾ����java Command -m 1 100\n"+
					"    ������-m �½������ΧΪ 1��100���Ͻ������ΧΪ 50��1000\n\n"+
					"   3. -o �趨��Ŀ����༸������� ���Ǳ��룬Ĭ��Ϊ1��\n"+
					"    ʹ��ʾ����java Command -o 5\n"+
					"    ������-o ������ΧΪ 1 ~ 10\n\n"+
					"   4. -c �趨��Ŀ���Ƿ��г˳��� ���Ǳ��룬Ĭ��û�С�\n"+
					"    ʹ��ʾ��������г˳��������-c������java Command -c ��������Ϊ���ɲ����˳�����\n\n"+
					"   5. -b �趨��Ŀ���Ƿ������� ���Ǳ��룬Ĭ��û�С�\n"+
					"    ʹ��ʾ������������ţ����-b������java Command -b��������Ϊ���ɲ������š�\n"+
					"    ������ɵ���ʽ�����ţ�������������С�ڵ�����ʽ�������������\n");
		}
		catch(MyException e){
			//e.printStackTrace();
		}
	
	}
	public static void clear(){
		core.text="";
	}
	public static String getString(){
		return core.text;
	}
	public static int[] getAns(){
		return core.ans;
	}
}