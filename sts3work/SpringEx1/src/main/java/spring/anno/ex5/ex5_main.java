package spring.anno.ex5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ex5_main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		//어노테이션 만으로 출력해주세요..
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext.xml");
		
		MysqlContoller cont=(MysqlContoller)app.getBean("mysqlcont");
		
		cont.insert("장환라");
		cont.delete("2");
		cont.selete("성한경");
		
	}

}
