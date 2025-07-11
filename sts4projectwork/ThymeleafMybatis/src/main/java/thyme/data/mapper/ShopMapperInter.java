package thyme.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import thyme.data.dto.ShopDto;

@Mapper
public interface ShopMapperInter {
	
	public int getTotalCount();
	public void insertMyshop(ShopDto dto);
	public List<ShopDto> getAllDatas();
}
