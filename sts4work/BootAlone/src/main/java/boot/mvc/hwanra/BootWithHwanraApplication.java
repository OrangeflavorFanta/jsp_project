package boot.mvc.hwanra;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.mvc.*"})
@MapperScan({"boot.mvc.*"})
public class BootWithHwanraApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootWithHwanraApplication.class, args);
	}

}
