package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MarketDto;

@Mapper
public interface MarketMapperInter {
	public int getTotalCount();
	public void InsertOfMarket(MarketDto dto);
	public List<MarketDto> getAllSangpums();
	public MarketDto getOneSangpum(int num);
	public void updateMarket(MarketDto dto);
	public void deleteMarket(int num);
}
