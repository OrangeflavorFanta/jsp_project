package boot.mvc.start;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;

@SpringBootApplication
@ComponentScan({"boot.test","boot.hello"})

public class SpringBootEx1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootEx1Application.class, args);
		
		
	}

}
