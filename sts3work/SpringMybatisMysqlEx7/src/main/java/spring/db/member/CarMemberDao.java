package spring.db.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao {

	@Autowired
	private SqlSession session;
	
	//총갯수
	public int getTotalCount() {
		
		return session.selectOne("getTotalCountCarMember");
		
	}
	
	
	//전체 데이터
	public List<CarMemberDto> getAllDatas(){
		return session.selectList("getAllDatasOfCarMember");
	}
	
	
	//insert
	public void insertMymem(CarMemberDto dto) {
		
		session.insert("insertOfCarMember", dto); //id,파라메타
		
	}
	
	//수정폼
	public CarMemberDto getData(String num) {
		return session.selectOne("getOneDataOfCarMember", num);
	}
	
	
	//update
	public void updateMyMem(CarMemberDto dto) {
		
		session.update("updateOfCarMember", dto);
	}
	
	//delete
	public void deleteMyMem(String num) {
		
		session.delete("deleteofCarMember", num);
	}
	
	
	
}
