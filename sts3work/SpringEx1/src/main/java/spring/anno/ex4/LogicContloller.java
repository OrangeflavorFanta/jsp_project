package spring.anno.ex4;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic")//logicContoller 이름으로 등록 @Component("name")을 주어도 된다
public class LogicContloller {
	
	//@Autowired
	@Resource(name="myDao")//정확한 빈의 아이디로 주입_모호성이 있을 떄
	DaoInter daoInter;
	
	public LogicContloller(MyDao dao) {
		this.daoInter=dao;
	}
	
	//insert
	public void insert(String str) {
		daoInter.insertData(str);
		
	}
	
	public void delete(String num) {
		daoInter.deleteData(num);
	}

}
