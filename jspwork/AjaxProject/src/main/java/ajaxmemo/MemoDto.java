package ajaxmemo;

import java.sql.Timestamp;

public class MemoDto {
	
	private String num;
	private String writer;
	private String content;
	private String emot;
	private Timestamp writerday;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmot() {
		return emot;
	}
	public void setEmot(String emot) {
		this.emot = emot;
	}
	public Timestamp getWriterday() {
		return writerday;
	}
	public void setWriterday(Timestamp writerday) {
		this.writerday = writerday;
	}
	
	
	
	
}
