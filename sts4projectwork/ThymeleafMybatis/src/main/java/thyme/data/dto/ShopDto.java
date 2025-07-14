package thyme.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("shop")
@AllArgsConstructor
@NoArgsConstructor
public class ShopDto {
	private int num;
	private String sangpum;
	private String photo;
	private int price;
	private String color;;
	private String ipgoday;
	private Timestamp writeday;
	
}
