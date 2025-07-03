package data.thyme.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor			//명시적 생성자 하나하나 만들어줌<->//@NoArgsConstructor:디폴트 생성자 만들어줌
@Builder //생성할때 순서 헷갈리지 않고 알아서 생성할수 있게끔 해줌
public class ShopDto {
	
	
	private int num;
	private String sangpum;
	private int su;
	private int dan;
	private String color;
}
