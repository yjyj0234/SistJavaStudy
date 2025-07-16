package thyme.my.mini;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"thyme.my.mini","thyme.data.*"})
@MapperScan("thyme.data.mapper")
@EntityScan("thyme.data.dto")  //dto가 들어있는 곳
@EnableJpaRepositories("thyme.data.repository")   //dao 등록
public class ThymeleafMybatisApplication {

	public static void main(String[] args) {
		SpringApplication.run(ThymeleafMybatisApplication.class, args);
	}

}
