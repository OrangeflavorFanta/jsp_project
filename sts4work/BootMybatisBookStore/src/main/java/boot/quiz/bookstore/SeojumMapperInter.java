package boot.quiz.bookstore;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeojumMapperInter {
		
	public int getTotalCount();
	public void insertSeojum(SeojumDto dto);
	public List<SeojumDto> getAllData();
	public SeojumDto getData(String num);
	public void updateSeojum(SeojumDto dto);
	public void deleteSeojum(SeojumDto dto);
	
	

}
