package spring.db.car;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mysql.cj.Session;

@Repository//DAO¸¦ ºó¿¡ µî·ÏÇÏ´Â°Å
public class MycarDao {

	@Autowired
	private SqlSession session;
	
	//ÃÑ°¹¼ö
	public int getTotalCount() {
		
		return session.selectOne("getTotalCountofMycar");//mycar.~ÇØÁàµµ µÊ
		
	}
	
	//ÀüÃ¼ µ¥ÀÌÅÍ
	public List<MycarDto> getAllDatas(){
		return session.selectList("getAllDatasofMycar");
	}
	
	//insert
	public void insertMyCar(MycarDto dto) {
			session.insert("insertofMycar", dto);//id,ÆÄ¶ó¸ÞÅ¸
			
	}
		
		
	//¼öÁ¤Æû
	public MycarDto getData(String num){
		
		return session.selectOne("getOneDataOfMyCar", num);
	}
	
	//update
	public void  updateMyCar(MycarDto dto) {
		
		session.update("updateOfMyCar", dto);
	}
	
	//delete
	public void deleteMyCar(String num) {
		
		session.delete("deleteOfMyCar", num);
	}
	
	
}
