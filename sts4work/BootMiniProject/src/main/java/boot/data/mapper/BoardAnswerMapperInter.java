package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.BoardAnswerDto;

@Mapper
public interface BoardAnswerMapperInter {

	public void insertAnswer(BoardAnswerDto dto);
	public List<BoardAnswerDto> getAllAnswers(String num);//몇번 글에 대한 댓글 리스트야?? 가 필요하므로
	
	//수정에 관한 메서드
	public BoardAnswerDto getAnswer(String idx);//왜 idx값을 보내지? idx가 시퀀스니까...
	public void updateAnswer(BoardAnswerDto dto);
	public void deleteAnswer(String idx);
	
	
}
