import org.junit.Before;
import org.junit.Test;

public class CommandTest {
	Command command = new Command();
	@Before
	public void setUp() throws Exception {
		
	}

	@Test
	public void testMain(){
		String[] args = {"-n","20","-m","1","100","-o","2","-b","-c"};
		command.main(args);
	}
	@Test
	public void testMain1(){
		String[] args = {"-n","20"};
		command.main(args);
	}
	@Test
	public void testMain2(){
		String[] args = {};
		command.main(args);
	}
	@Test
	public void testMain3(){
		String[] args = {"-n","20","-m","1"};
		command.main(args);
	}
	@Test
	public void testMain4(){
		String[] args = {"aaaa"};
		command.main(args);
	}
	@Test
	public void testMain5(){
		String[] args = {"-n"};
		command.main(args);
	}
	@Test
	public void testMain6(){
		String[] args = {"-o"};
		command.main(args);
	}
	@Test
	public void testMain7(){
		String[] args = {"-n","1000000","-m","1","100"};
		command.main(args);
	}
	@Test
	public void testMain8(){
		String[] args = {"-n","aaa","-m","1","100"};
		command.main(args);
	}
	@Test
	public void testMain9(){
		String[] args = {"-n","10","-m","100","50"};
		command.main(args);
	}
	@Test
	public void testMain10(){
		String[] args = {"-n","10","-m","1","100","-o","-100"};
		command.main(args);
	}

}
