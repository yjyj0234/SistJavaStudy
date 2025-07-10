package boot.board.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.board.dto.BoardDto;
import jakarta.servlet.http.HttpSession;

public interface BoardServiceInter {
	//컨트롤러의 로직을 서비스에서 분담해주기 위해 생성
	
	public void insertBoard(BoardDto dto,MultipartFile upload,HttpSession session);
	public List<BoardDto> getAll();
	public BoardDto getOne(Long num);
	public void updateBoard(BoardDto dto,MultipartFile upload,HttpSession session);
	public void deleteBoard(Long num,HttpSession session); 
	
	//파일삭제하는 메서드
	public void deleteFile(String path,String oldFileName); 
}
