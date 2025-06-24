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
//�ռ� mycar���� ���� mycar�� �ٿ��༭ �̰� ���������
@RequestMapping("/upload")
public class UploadController {
	@GetMapping("/form1")
	public String form1() {
		return "upload/form1";
	}
	
	//�̹��� ���ε� �Ϸ��� MultipartFile(photo�� name��)
	@PostMapping("/save1")
	public ModelAndView read1(@RequestParam String title,
			@RequestParam MultipartFile photo, HttpSession session) {
		ModelAndView model=new ModelAndView();
		
		//���ε��� ������� ���ϱ�
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		String fileName=photo.getOriginalFilename();//���ε��� ���ϸ�
		
		//���糯¥�� �ð� �̿��ؼ� ���ϸ� ����
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		if(!fileName.equals("")) {
			fileName=sdf.format(new Date())+"_"+fileName;
			
			//path�� ���ε� ���ֱ�
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
			fileName="no";//���ε� ������ ���
		}
		
		model.addObject("fileName", fileName);
		model.addObject("title", title);
		model.addObject("path", path);
		
		model.setViewName("upload/result1");
		
		return model;
	}
	//��2 ����
	@GetMapping("/form2")
	public String goForm2() {
		return "upload/form2";
	}
	
	//��2 submit
	@PostMapping("/save2")
	public ModelAndView read2(@RequestParam String title,
			@RequestParam ArrayList<MultipartFile> photo,
			HttpSession session)
	//realpath �� ������ HttpSession�ᵵ���� 
	{
		ModelAndView model=new ModelAndView();
		String path=session.getServletContext().getRealPath("/WEB-INF/photo");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		//���ϸ� ����
		ArrayList<String> files=new ArrayList<String>();
		
		//���ϸ���(�����ִ� ���並��´�)
		for(MultipartFile f:photo) {
			 String fileName=sdf.format(new Date())+"_"+f.getOriginalFilename();
			 files.add(fileName);
			 
			 //���ε�
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
