package reboard.data.model;

import java.util.List;

public interface ReboardDaoInter {

	public int getTotalCount();
	public int getMaxNum();
	public void updateRestep(int regroup, int restep);
	public void insertReboard(ReboardDto dto);
	public List<ReboardDto> getList(int start, int perpage);
	public void updateReadCount(int num);
	public ReboardDto getData(int num);
	public int getCheckPass(int num, int pass);
	public void deleteReboard(int num);
	public void updatereboard(ReboardDto dto);
	
	
}
