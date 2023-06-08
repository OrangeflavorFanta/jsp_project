package board.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public class BoardDao {
	
	@Autowired
	BoardDaoInter daoInter;
	
	//insert
	public void insert(BoardDto dto) {
		
		daoInter.save(dto);//daoInterd에 save해줄게(controller에도 있음)
	}
	
	//list출력
	public List<BoardDto> list(){
		
		List<BoardDto> list= daoInter.findAll();
		
		return list; 
	}
	
	
	/*
	 * //update public void update(BoardDto dto) {
	 * 
	 * daoInter.save(dto); }
	 */
	 
	
	
}
