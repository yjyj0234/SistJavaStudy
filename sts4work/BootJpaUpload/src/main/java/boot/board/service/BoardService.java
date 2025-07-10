package boot.board.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.board.dao.BoardDao;
import boot.board.dao.BoardDaoInter;
import boot.board.dto.BoardDto;
import jakarta.servlet.http.HttpSession;

@Service
public class BoardService implements BoardServiceInter {

	@Autowired
	BoardDao dao;
	
	@Override
	public void insertBoard(BoardDto dto, MultipartFile upload, HttpSession session) {
		// TODO Auto-generated method stub
		
		//업로드 경로
		String path=session.getServletContext().getRealPath("/save");
		System.out.println(path);
		
		//파일명 생성
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+upload.getOriginalFilename();
		
		//dto파일명 저장
		if(upload.isEmpty()) {
			dto.setPhoto("no");
		}else {
			dto.setPhoto(fileName);
			
			//실제 파일 업로드
			try {
				upload.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		dao.insertBoard(dto);
	}

	@Override
	public List<BoardDto> getAll() {
		// TODO Auto-generated method stub
		List<BoardDto> list=dao.getAllDatas();
				
		return list;
	}
	@Override
	public BoardDto getOne(Long num) {
		// TODO Auto-generated method stub
		
		BoardDto dto=dao.getOne(num);

		return dto;
	}

	@Override
	public void updateBoard(BoardDto dto,MultipartFile upload,HttpSession session) {
		// TODO Auto-generated method stub

		//업로드 경로
		String path=session.getServletContext().getRealPath("/save");
		System.out.println(path);
		
		//파일명 생성
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+upload.getOriginalFilename();
		
		String oldImg=dao.getOne(dto.getNum()).getPhoto();
		//dto파일명 저장
		if(upload.isEmpty()) {
			dto.setPhoto("no");
		}else {
			deleteFile(path, oldImg);

			dto.setPhoto(fileName);
			
			//실제 파일 업로드
			try {
				upload.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		dao.updateBoard(dto);
	}

	@Override
	public void deleteBoard(Long num,HttpSession session) {
		// TODO Auto-generated method stub
		String path=session.getServletContext().getRealPath("/save");
		String fileName=dao.getOne(num).getPhoto();
		//파일삭제
		deleteFile(path, fileName);
		
		dao.deleteBoard(num);
		
	}

	@Override
	public void deleteFile(String path, String oldFileName) {
		// TODO Auto-generated method stub
		File file=new File(path+"\\"+oldFileName);
		if(file.exists()) {
			file.delete();
		}
	}

}
