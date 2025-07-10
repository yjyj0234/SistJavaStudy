package boot.board.dto;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Table(name="jpaboard")
@Entity
public class BoardDto {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)  //auto increment
	private long num;
	
	@Column(name="writer",updatable=false)
	private String writer;
	
	@Column
	private String subject;
	
	@Column
	private String content;
	
	@Column
	private String photo;
	
	@CreationTimestamp
	@Column(name="writeday",updatable=false)
	private Timestamp writeday;
	
}
