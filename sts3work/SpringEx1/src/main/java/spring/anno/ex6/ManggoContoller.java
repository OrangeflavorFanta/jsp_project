package spring.anno.ex6;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ManggoContoller {
	
	//@Autowired  //error:매칭한 Manggo 종류가 2개라 에러남
	//인터페이스 Manggo 구현한 클래스가 pmanggo 한개일 때는 자동주입이 되는데
	//만약 구현한 클래스가 여러개가 있을경우에는 자동주입에 문제가 발생한다
	//정확한 bean의 이름으로 주입하려면 @Resource(name="정확한 이름"
	//처럼 정확한 이름을 넣어야 한다
	
	//@Resource(name="pmanggo")
	@Resource(name="taiwanManggo")
	Manggo manggo;
	
	public void writeManggo() {
		System.out.println("내가 좋아하는 과일은 **");
		manggo.writeManggoName();
	}

}
