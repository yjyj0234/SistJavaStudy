package shop.data;

import java.sql.Timestamp;

public class ShopDto {
	private String shopnum;
	private String category;
	private String sangpum;
	private String photo;
	private int price;
	private Timestamp ipgoday;
	
	public String getShopnum() {
		return shopnum;
	}
	public void setShopnum(String shopnum) {
		this.shopnum = shopnum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSangpum() {
		return sangpum;
	}
	public void setSangpum(String sangpum) {
		this.sangpum = sangpum;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getIpgoday() {
		return ipgoday;
	}
	public void setIpgoday(Timestamp ipgoday) {
		this.ipgoday = ipgoday;
	}
}
