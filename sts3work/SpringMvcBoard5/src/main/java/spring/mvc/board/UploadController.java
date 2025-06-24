package spring.mvc.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



@Controller
//앞선 mycar에선 전부 mycar를 붙여줘서 이걸 떼고싶으면
@RequestMapping("/upload")
public class UploadController {
	@GetMapping("/form1")
	public String form1() {
		return "upload/form1";
	}
	
	//이미지 업로드 하려면 MultipartFile(photo는 name값)
	@PostMapping("/save1")
	public ModelAndView read1(@RequestParam String title,
			@RequestParam MultipartFile photo, HttpSession session) {
		ModelAndView model=new ModelAndView();
		
		//업로드할 실제경로 구하기
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		String fileName=photo.getOriginalFilename();//업로드한 파일명
		
		//현재날짜와 시간 이용해서 파일명 저장
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		if(!fileName.equals("")) {
			fileName=sdf.format(new Date())+"_"+fileName;
			
			//path에 업로드 해주기
			try {
				photo.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			fileName="no";//업로드 안했을 경우
		}
		
		model.addObject("fileName", fileName);
		model.addObject("title", title);
		model.addObject("path", path);
		
		model.setViewName("upload/result1");
		
		return model;
	}
	//폼2 띄우기
	@GetMapping("/form2")
	public String goForm2() {
		return "upload/form2";
	}
	
	//폼2 submit
	@PostMapping("/save2")
	public ModelAndView read2(@RequestParam String title,
			@RequestParam ArrayList<MultipartFile> photo,
			HttpSession session)
	//realpath 만 있으면 HttpSession써도가능 
	{
		ModelAndView model=new ModelAndView();
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		//파일명 선언
		ArrayList<String> files=new ArrayList<String>();
		
		//파일명담기(폼에있는 포토를담는다)
		for(MultipartFile f:photo) {
			 String fileName=sdf.format(new Date())+"_"+f.getOriginalFilename();
			 files.add(fileName);
			 
			 //업로드
			 try {
				f.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		}
		model.addObject("files", files);
		model.addObject("title", title);
		model.addObject("path", path);
		
		model.setViewName("upload/result2");
		
		return model;
	}
}
