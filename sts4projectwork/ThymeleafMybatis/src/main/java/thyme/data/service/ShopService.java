package thyme.data.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import thyme.data.dto.ShopDto;
import thyme.data.mapper.ShopMapperInter;

@Service
public class ShopService {
	
	@Autowired
	ShopMapperInter inter;
	
	public int getTotalCount() {
		int count=inter.getTotalCount();
		return count;
	}
	
	//@RequestParam("upload") 타임리프에선 넣기
	public void insertMyshop(@ModelAttribute ShopDto dto,
			@RequestParam("upload") MultipartFile upload,HttpSession session) {
		//경로설정
		String path=session.getServletContext().getRealPath("/save");
		System.out.println(path);
		//날짜
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		//파일명 지정
		String fileName=sdf.format(new Date())+"_"+upload.getOriginalFilename();
		dto.setPhoto(fileName);
		try {
			upload.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		inter.insertMyshop(dto);
	}
	
	public List<ShopDto> getAllDatas() {
		List<ShopDto> list= inter.getAllDatas();
		return list;
	}
}
