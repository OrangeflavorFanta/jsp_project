package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.ReboardDto;

@Mapper
public interface ReboardMapperInter {
	
	//maxnum을 구하는 이유: 새 글 일 때 모르기 때문에...?
	public int getMaxNum();
	public int getTotalCount(Map<String, String> map);//검색 시 검색된 글의 갯수. 컬럼과 word를 넘겨야 해서 map, 파라미터 값에 대한 댓글 수
	public List<ReboardDto> getPagingList(Map<String, Object> map);
	public void insertReboard(ReboardDto dto);
	public void updateRestep(Map<String, Integer>map);//스텝을 업데이트 시켜줌 
	public void updateReadCount(int num);
	public ReboardDto getData(int num);
	public void updateReboard (ReboardDto dto);
	public void deleteReboard(int num);
	public void updateLikes(int num);
	
}
