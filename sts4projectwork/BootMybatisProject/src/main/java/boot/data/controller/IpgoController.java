package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.eclipse.tags.shaded.org.apache.bcel.classfile.Field;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;
import jakarta.servlet.http.HttpSession;

@Controller
public class IpgoController {
	
	@Autowired
	IpgoMapperInter mapper;
	
	
	
	@GetMapping("/ipgo/list")
	public ModelAndView list(@ModelAttribute IpgoDto dto) {
		ModelAndView model=new ModelAndView();
		
		List<IpgoDto> list=mapper.getIpgoList();
		
		int totalCount=mapper.getTotalCount();
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		model.setViewName("ipgo/ipgolist");
		
		return model;
	}
	@GetMapping("/ipgo/form")
	public String form() {
		return "ipgo/ipgoform";
	}
	@PostMapping("/ipgo/insert")
	public String insert(@ModelAttribute IpgoDto dto,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session) {
		String path=session.getServletContext().getRealPath("/save");
		System.out.println(path);
		String uploadname="";
		//이미지 안넣어줬을때
		if(upload.get(0).getOriginalFilename().equals("")) {
			uploadname="no";
		}else {
			//이미지 넣어줬을때
			for(MultipartFile f:upload) {
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadname+=fName+",";
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//마지막 , 제거
			uploadname=uploadname.substring(0,uploadname.length()-1);
		}
		dto.setPhotoname(uploadname);
		
		mapper.insertIpgo(dto);
		return "redirect:list";
	}
}
