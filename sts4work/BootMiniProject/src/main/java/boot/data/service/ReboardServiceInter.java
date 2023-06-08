package boot.data.service;

import java.util.List;
import java.util.Map;

import boot.data.dto.ReboardDto;

public interface ReboardServiceInter {

	public int getMaxNum();
	public int getTotalCount(String searchcolum, String searchword);//검색 시 검색된 글의 갯수. 컬럼과 word를 넘겨야 해서 map, 파라미터 값에 대한 댓글 수
	public List<ReboardDto> getPagingList(String searchcolumn, String searchword, int start, int perpage);
	public void insertReboard(ReboardDto dto);
	public void updateRestep(int regroup, int restep);//스텝을 업데이트 시켜줌 
	public void updateReadCount(int num);
	public ReboardDto getData(int num);
	public void updateReboard (ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
}
