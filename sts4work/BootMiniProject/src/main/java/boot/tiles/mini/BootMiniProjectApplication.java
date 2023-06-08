package boot.tiles.mini;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.data.*","boot.*"}) //boot.*도 됨!!
@MapperScan({"boot.data.*"}) //mapper를 찾겠다 스캔하겠다
public class BootMiniProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMiniProjectApplication.class, args);
	}

}
