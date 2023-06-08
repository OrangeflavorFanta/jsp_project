package boot.mvc.mybatis;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*"})
@MapperScan({"data.*"})//data.mapper해도 됨
public class BootMybatisMysqlApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMybatisMysqlApplication.class, args);
	}

}
