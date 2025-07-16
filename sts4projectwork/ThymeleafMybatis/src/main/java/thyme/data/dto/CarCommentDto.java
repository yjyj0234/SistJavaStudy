package thyme.data.dto;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "jpacar_comment")
public class CarCommentDto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idx;
	
	@ManyToOne
	@JoinColumn(name = "num")
	@OnDelete(action = OnDeleteAction.CASCADE)  //부모데이터 지우면 자식데이터도 같이 지워짐
	private CarDto car;
	
	private String comment;
	
	@CreationTimestamp
	@Column(name = "writeday",updatable = false)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "Asia/Seoul")
	private Timestamp writeday;
}
