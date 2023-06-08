package spring.anno.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class LogicMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app1=new ClassPathXmlApplicationContext("annoContext.xml");
		
		LogicContloller logic1=(LogicContloller)app1.getBean("logic");
		
		logic1.insert("Happy friday");
		logic1.delete("3");
		
	}

}
