package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.MarketDto;

@Mapper //mapper 어노테이션 여기서 해준다
public interface MarketMapperInter {

	public int getTotalCount();//marketsql의 id와 맞춰줘야 한다
	public void insertMarket(MarketDto dto);
	public List<MarketDto> getAllDatas();
	public void deleteMarket(String num);
	public MarketDto getData(String num);
	public void updateMarket(MarketDto dto);
	
}
