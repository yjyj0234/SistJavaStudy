package boot.react.mini;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.react.mini","boot.data.*"})
@MapperScan("boot.data.mapper")
public class SpringReactProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringReactProjectApplication.class, args);
	}

}
