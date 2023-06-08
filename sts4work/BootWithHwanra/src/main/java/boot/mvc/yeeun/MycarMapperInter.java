package boot.mvc.yeeun;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MycarMapperInter {
	
	public int getTotalCount();
	public List<MycarDto> getAllCars();
	public void insertMycar(MycarDto dto);
	public void deleteMycar(String num);
	public MycarDto getData(String num);
	public void updateMycar(MycarDto dto);

}
