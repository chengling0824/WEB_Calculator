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
						System.out.println("�����ʽ����\n");
						throw new MyException();
					}
					
					flag[0]=true;
					Main.num_of_formula = Integer.parseInt(args[i+1]);
					if(Main.num_of_formula>10000||Main.num_of_formula<=0){
						System.out.println("��ֵ��Χ����\n");
				    	throw new MyException();
					}
					i++;
				}
				else if(args[i].equals("-m")){
					if(i+2>=args.length){
						System.out.println("�����ʽ����\n");
						throw new MyException();
					}
					
					flag[1]=true;
					Main.low = Integer.parseInt(args[i+1]);
					Main.high = Integer.parseInt(args[i+2]);
					
					if(Main.low<0||Main.low>100||Main.high<50||Main.high>1000||Main.low>Main.high){
						System.out.println("��ֵ��Χ����\n");
						throw new MyException();
					}
					i+=2;
				}
				else if(args[i].equals("-o")){
					if(i+1>=args.length){
						System.out.println("�����ʽ����\n");
						throw new MyException();
					}
					
					Main.maxmum_of_operation = Integer.parseInt(args[i+1]);
					
					if(Main.maxmum_of_operation<0||Main.maxmum_of_operation>10){
						System.out.println("��ֵ��Χ����\n");
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
					System.out.println("�����ʽ����\n");
					throw new MyException();
				}
			}
			if((flag[0]&&flag[1])==false){
				System.out.println("�����ʽ����\n");
				throw new MyException();
			}
			new Main().main(null);
		
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
	
}