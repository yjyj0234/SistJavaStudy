package boot.data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.data.dto.ShopDto;
import boot.data.mapper.ShopMapper;

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
	
}
