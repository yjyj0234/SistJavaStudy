package boot.jpa.board;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


@SpringBootApplication
@ComponentScan({"boot.board.*","boot.jpa.board"})
@EntityScan("boot.board.*")
@EnableJpaRepositories("boot.board.*")
public class BootJpaUploadApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootJpaUploadApplication.class, args);
	}

}
