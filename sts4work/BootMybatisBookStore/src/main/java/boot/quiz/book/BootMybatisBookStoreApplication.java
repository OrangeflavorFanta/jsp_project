package boot.quiz.book;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.quiz.*"})
@MapperScan({"boot.quiz.*"})
public class BootMybatisBookStoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMybatisBookStoreApplication.class, args);
	}

}
