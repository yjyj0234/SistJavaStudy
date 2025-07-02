package boot.jpa.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name="jpashop")
public class ShopDto {
	//테이블 이름은 jpashop으로 만들것
	//seq없이 auto로
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int num;
	//identity 쓰려면 integer로 바꿔야함
	
	@Column	
	private String foodname;
	@Column
	private int foodprice;
	@Column
	private String foodphoto;
	@Column
	private String ipgoday;
}
