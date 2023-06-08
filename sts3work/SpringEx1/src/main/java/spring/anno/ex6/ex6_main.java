package spring.anno.ex6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ex6_main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext.xml");
		
		Manggo manggo=(PhilipinManggo)app.getBean("pmanggo");
		manggo.writeManggoName();
		
		Manggo mang=(TaiwanManggo)app.getBean("taiwanManggo");
		mang.writeManggoName();
		
		ManggoContoller mcon=(ManggoContoller)app.getBean("manggoController");
		mcon.writeManggo();
		
		

}
}
