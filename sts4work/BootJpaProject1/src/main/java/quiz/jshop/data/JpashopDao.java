package quiz.jshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mycar.data.MycarDaoInter;

@Repository
public class JpashopDao {
	
	@Autowired
	JpashopDaoInter shopInter;
	
	//insert
	public void insert(JpashopDto dto) {//insert란ㄴ 함수를 controller에 호출하자 마자 
		
		shopInter.save(dto);
	}
	
	//select
	public List<JpashopDto > list(){
		
		
		return shopInter.findAll();
		
		}
	

}
