package thyme.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("shop")
public class ShopDto {
	private int num;
	private String sangpum;
	private String photo;
	private int price;
	private String color;;
	private String ipgoday;
	private Timestamp writeday;
	
}
