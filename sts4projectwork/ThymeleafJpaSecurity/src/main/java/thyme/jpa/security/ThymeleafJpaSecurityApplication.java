package thyme.jpa.security;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"thyme.jpa.security","boot.security.*"})
@EntityScan("boot.security.dto")
@EnableJpaRepositories("boot.security.service")
public class ThymeleafJpaSecurityApplication {

	public static void main(String[] args) {
		SpringApplication.run(ThymeleafJpaSecurityApplication.class, args);
	}

}
