package boot.data.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.SmartDto;

@Mapper
public interface SmartMapperInter {
	
	public void insertShop(SmartDto dto);
	public List<SmartDto> getShopList(Map<String, Integer> map);//얘 쓰려면 필수로 페이징 2개 해줘야 함
	public SmartDto getSangpum(int num);
	public void deleteShop(int num);
	public int getTotalCount();
}
