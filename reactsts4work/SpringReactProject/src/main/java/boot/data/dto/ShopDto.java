package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Alias("shop")
@Data
public class ShopDto {
	private Integer num;
	private String sangpum;
	private String photo;
	private Integer su;
	private Integer dan;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp ipgoday;
	

}
