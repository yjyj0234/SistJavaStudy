package boot.data.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.BoardDto;

@Mapper
public interface BoardMapperInter {
	
	public int getTotalCount(Map<String, String> map);
	public void insertBoard(BoardDto dto);
	
	//페이징 하기위해서 maxNum 필수
	public int getMaxNum();
	
	//startNum perpage을 넘기기위해 map사용+검색 단어 까지 넘김
	//String, integer 한꺼번에 넘겨서 object 사용
	public List<BoardDto> getList(Map<String, Object> map);
	public BoardDto getData(int num);
	public void updateReadCount(int num);
}
