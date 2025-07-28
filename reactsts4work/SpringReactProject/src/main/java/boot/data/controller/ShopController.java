package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.security.Provider.Service;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import boot.data.dto.ShopDto;
import boot.data.service.ShopService;
import jakarta.servlet.http.HttpSession;

@RestController
@CrossOrigin(origins = "http://localhost:5173")
@RequestMapping("/shop")
public class ShopController {
//@CrossOrigin : 보안때문에 원래 안됐지만 
//8090포트 외의 다른 포트로 들어오는것을 허용
	
	@Autowired
	private ShopService shopService;
	
	String photoName;
	
	//photo 업로드
	//멀티파트는 포스트형식이 기본(postmapping 타입이 아니면 업로드 자체가 X)
	@PostMapping("/upload")
	public String fileUpload(@RequestParam("uploadFile") MultipartFile uploadFile,
			HttpSession session) {
		
		String fileName=uploadFile.getOriginalFilename();
		
		//폴더명
		String path=session.getServletContext().getRealPath("/save");
		
		
		File file=new File(path+"/"+photoName);
		if(file.exists()) {
			file.delete();
		}
		
		//파일명 변경
		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmss");
		photoName=sdf.format(new Date())+"_"+uploadFile.getOriginalFilename();
		System.out.println("fileName : "+fileName+"==>"+photoName);
		
		//save에 업로드하기
		try {
			uploadFile.transferTo(new File(path+"/"+photoName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return photoName;
	}
	
	
	//insert   포워드여서 리턴 받을게없어서 void
	//modelattribute X=>requestbody
	//@requestbody: json 으로 보낸걸 자바클래스로 변환
	@PostMapping("/insert")
	public void insertShop(@RequestBody ShopDto dto) {
		dto.setPhoto(photoName);
		
		shopService.insertShop(dto);
		photoName=null;
	}
	//select
	@GetMapping("/list")
	public List<ShopDto> list(){
		return shopService.getAllShopDatas();
	}
	
	/*
	 * //detail
	 * 
	 * @GetMapping("/detail/{num}") public ShopDto detail(@PathVariable("num")
	 * Integer num) { return shopService.getOneShopProduct(num); }
	 */
	//detail
	@GetMapping("/detail")
	public ShopDto detail(@RequestParam("num") Integer num) {
		return shopService.getOneShopProduct(num);
	}
	//delete 할 때 : @DeleteMapping 
	@DeleteMapping("/delete")
	public void delete(@RequestParam("num") Integer num, HttpSession session) {
		shopService.deleteShop(num, session);
	}
}
