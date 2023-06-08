package boot.jpa.upload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

//jpa면 dto,dao,패키지 등록
@SpringBootApplication
@ComponentScan({"board.*"})
@EntityScan("board.*")//프로젝트 전체면 *(정말 프로젝트면 *.data 이런식으로도 할 수 있음)
@EnableJpaRepositories("board.*")//dto, dao 등록
public class JpaFileUploadProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(JpaFileUploadProjectApplication.class, args);
	}

}
