package boot.data.service;

import java.util.List;

import boot.data.dto.ShopDto;
import jakarta.servlet.http.HttpSession;

public interface ShopServiceInter {
	public void insertShop(ShopDto dto);
	public List<ShopDto> getAllShopDatas();
	public ShopDto getOneShopProduct(Integer num);
	
	public void deleteShop(Integer num, HttpSession session);

}
