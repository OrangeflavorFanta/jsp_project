package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.MemberDto;

public interface MemberServiceInter {

	public List<MemberDto> getAllMembers();
	public void insertMember(MemberDto dto);
	public int getSearchId(String id);
	public String getName(String id);
	public int loginIdPassCheck(String id, String pass);//map으로 안하고 풀어서 써주면 서비스에서 받기 쉬움
	public MemberDto getDataById(String id);
	public void deleteMember(String num);
	public void updatephoto(String num, String photo);
	public void updateMember(MemberDto dto);
	public MemberDto getDataByNum(String num);
	
}
