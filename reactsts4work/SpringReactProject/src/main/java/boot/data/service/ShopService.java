package boot.data.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ShopDto;
import boot.data.mapper.ShopMapper;
import jakarta.servlet.http.HttpSession;

@Service
public class ShopService implements ShopServiceInter{
	@Autowired
	private ShopMapper shopMapper;

	@Override
	public void insertShop(ShopDto dto) {
		// TODO Auto-generated method stub
		shopMapper.insertShop(dto);
	}

	@Override
	public List<ShopDto> getAllShopDatas() {
		// TODO Auto-generated method stub
		return shopMapper.getAllShopDatas();
	}

	@Override
	public ShopDto getOneShopProduct(Integer num) {
		// TODO Auto-generated method stub
		return shopMapper.getOneShopProduct(num);
	}

	@Override
	public void deleteShop(Integer num,HttpSession session) {
		String path=session.getServletContext().getRealPath("/save");
		//num 에 해당하는 이미지 가져오기
		String photo=shopMapper.getOneShopProduct(num).getPhoto();
		File file=new File(path+"/"+photo);
		if(file.exists()) {
			file.delete();
		}
		shopMapper.deleteShop(num);
	}

	

	
}
