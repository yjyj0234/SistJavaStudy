package boot.data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("mbanswer")
public class BoardAnswerDto{
	private int idx;
	private int num;
	private String name;
	private String myid;
	private String content;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm")
	private Timestamp writeday;
	
}
