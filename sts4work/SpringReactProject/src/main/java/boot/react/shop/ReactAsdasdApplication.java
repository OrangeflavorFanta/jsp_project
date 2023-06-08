package boot.react.shop;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Component;

@SpringBootApplication
@ComponentScan("boot.data.*")
@MapperScan("boot.data.*")
public class ReactAsdasdApplication {

	public static void main(String[] args) {
		SpringApplication.run(ReactAsdasdApplication.class, args);
	}

}
