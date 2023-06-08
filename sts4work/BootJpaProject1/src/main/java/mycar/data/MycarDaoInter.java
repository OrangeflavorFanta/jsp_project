package mycar.data;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MycarDaoInter extends JpaRepository<MycarDto, Long>{
	//mycarinter를 인식해주는...? 여기서 레포지터리 해준다는 것을 알려주는 것임
	
	

}
