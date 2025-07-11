package thyme.my.mini;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"thyme.my.mini","thyme.data.*"})
@MapperScan("thyme.data.mapper")
public class ThymeleafMybatisApplication {

	public static void main(String[] args) {
		SpringApplication.run(ThymeleafMybatisApplication.class, args);
	}

}
