package spring.anno.ex5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mysqlcont")
public class MysqlContoller {
	@Autowired
	TestDao testDao;
	
	public void insert(String num) {
		testDao.insert(num);
		
	}
	
	public void delete(String num) {
		testDao.delete(num);
	}
	
	public void selete(String name) {
		testDao.selete(name);
	}
}
