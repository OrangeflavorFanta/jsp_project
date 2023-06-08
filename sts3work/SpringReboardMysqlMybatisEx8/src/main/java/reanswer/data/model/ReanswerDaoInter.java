package reanswer.data.model;

import java.util.List;

public interface ReanswerDaoInter {
	
	public void insertOfReanswer(ReanswerDto dto);
	public List<ReanswerDto> getAnswerList(int num);
	public int getCheckPass(int idx, String pass);
	public void deleteAnswer(int idx);
	

}
