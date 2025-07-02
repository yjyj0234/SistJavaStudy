package boot.jpa.data;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity //자동으로 테이블이 mysql에 만들어짐,변수 변경되도 자동 수정
@Table(name = "mycar") //테이블명
@Data
public class MycarDto {
	@Id // 각 아이디를 구별할수 있는 값(시퀀스)
	@GeneratedValue(strategy = GenerationType.AUTO)  //.identity(원래 알던 시퀀스 증가방식) 
	private long num;
	//자동으로 기본 키(Primary Key) 값을 자동으로 생성
	
	@Column(name = "carname")
	private String carname;
	
	@Column //이름이 같으면 생략가능
	private int carprice;
	
	@Column
	private String carcolor;
	
	@Column
	private String guipday;
	
	@CreationTimestamp  	//엔티티 생성시점의 시간(now()와 같은 의미)
	@Column(updatable = false) //수정을 해도 이 컬럼은 변하지 않음
	private Timestamp writeday;
}
