import java.util.Random;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class Formula{
		protected int num_of_operation;
		protected int[] ops;
		protected int[] num;
		protected int ans;	
		protected String str;

		
		public Formula(int num_of_operation){
			this.num_of_operation = num_of_operation;
			this.ops = new int[num_of_operation+2];
			this.num = new int[num_of_operation+2];
		}
		


		public void setOps() {
			Random r = new Random();
			for(int i=1;i<=this.num_of_operation;i++){
				this.ops[i] = r.nextInt(Main.kind_of_operation);
				if(this.ops[i]==3&&this.ops[i-1]==3){
					this.ops[i-1]=r.nextInt(2);
				}
			}
			/*//排除符号单一情况
			boolean flag = true;
			for(int i=2;i<=this.num_of_operation;i++){
				if(this.ops[i]!=this.ops[i-1]){
					flag = false;
				}
			}
			if(flag){
				do{
					this.ops[2] = r.nextInt(3);
				}
				while(this.ops[2]==this.ops[1]);			
			}*/
		}

		public int[] getOps() {
			return ops;
		}
		
		public void createString(int x, String b, int addBracket)
		{
			if(addBracket==0){
				if(x==0){
					this.str+=" + "+b;
				}	
				else if(x==1){
					this.str+=" - "+b;
				}		
				else if (x==2){
					this.str+=" * "+b;
				}	
				else if (x==3){
					this.str+=" / "+b;
				}
			}
			else{
				if(x==0){
					this.str+=" + ("+b;
				}	
				else if(x==1){
					this.str+=" - ("+b;
				}		
				else if (x==2){
					this.str+=" * ("+b;
				}	
				else if (x==3){
					this.str+=" / "+b;
				}
			}
		}

		public void setAns() //算术表达式结果计算函数
		{
			try{
				ScriptEngineManager manager = new ScriptEngineManager();
				ScriptEngine se = manager.getEngineByName("js");
				this.ans = (Integer) se.eval(this.str);
			}catch(ScriptException e){
				e.printStackTrace();
			}
			
		}
		public int getAns(){
			return ans;
		}
	}