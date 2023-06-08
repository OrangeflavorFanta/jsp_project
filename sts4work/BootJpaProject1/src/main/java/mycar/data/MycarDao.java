package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MycarDao {
	
	@Autowired
	MycarDaoInter carInter;
	
	//insert
	public void insertCar(MycarDto dto)
	{
		carInter.save(dto);//id유무에 따라서 자동으로  insert or update
	}
	
	//전체 출력
	public List<MycarDto> getAllDatas(){
		
		
		return carInter.findAll();//dto에 있는 모든 정보를 추출하겠다
	}
	
	//delete
	public void deletecar(Long num)
	{
		carInter.deleteById(num); //long이니까 byId
	}
	
	//num에 대한 dto반환
	public MycarDto getData(Long num) {
		
		return carInter.getReferenceById(num);
				
	}
	
	//update
	public void update(MycarDto dto) {
		
		carInter.save(dto);
	}
	
	

}
