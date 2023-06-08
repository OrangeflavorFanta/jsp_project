package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.IpgoDto;

@Mapper
public interface IpgoMapperInter {
	
	public int getTotalCount(); //메서드 명이 sql의 id
	public void insertIpgo(IpgoDto dto);
	public List<IpgoDto> getAllIpgos();//페이징 없으니까 파라미터타입 없음
	
}
