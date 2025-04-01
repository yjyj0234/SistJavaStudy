package day0307;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.Vector;

//ArrayList로 생성해서 할것
//MyShop은 디폴트 생성자로 생성할것
//메인에서 추가를 누르면 입력메서드 호출..
//출력모양: 번호    입고상품    수량    가격    총금액
class MyShop{
	private String sangName;
	private int su;
	private int price;
	
	//디폴트 생성자는 따로 메서드 안만들어도 존재함

	//setter & getter
	public String getSangName() {
		return sangName;
	}
	public void setSangName(String sangName) {
		this.sangName = sangName;
	}
	public int getSu() {
		return su;
	}
	public void setSu(int su) {
		this.su = su;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	/*
	 * 총액 
	 * public int getTot()
	 * {
	 * 	return su*price;
	 * }
	 */
	
}
//////////////////////////////////////
public class QuizList {
	
	List<MyShop> list=new ArrayList<MyShop>();   //ArrayList 와 차이 없음
	
	//상품 입력
	public void putProduct() {
		Scanner sc=new Scanner(System.in);
		String sangName;
		int su,price;
		System.out.println("입고된 상품명: ");
		sangName=sc.nextLine();
		System.out.println("상품 갯수: ");
		su=Integer.parseInt(sc.nextLine());
		System.out.println("상품 가격: ");
		price=Integer.parseInt(sc.nextLine());
		
		//생성자 안만들었으니까 아무것도 안뜸
		MyShop myshop=new MyShop(); 
		
		//여기서 set
		myshop.setSangName(sangName);
		myshop.setSu(su);
		myshop.setPrice(price);
		
		list.add(myshop);
		System.out.println("현재 상품 종류: "+list.size()+"종");
	}
	
	public void outProduct() {
	
		System.out.println("번호\t입고상품\t수량\t가격\t총금액");
		System.out.println("======================================");
		
		for(int i=0;i<list.size();i++) {
			MyShop ms=list.get(i);
			int tot=ms.getPrice()*ms.getSu();
			System.out.println((i+1)+"\t"+ms.getSangName() +"\t"+ms.getSu()+"\t"+ms.getPrice()+"\t"+tot);
		}
			
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		QuizList quiz=new QuizList();
		
		while(true) {
			int n=0;
			System.out.println("원하는 메뉴 선택");
			System.out.println("1. 추가   2. 현황    9. 종료");
			n=Integer.parseInt(sc.nextLine());
			if(n==1) {
				System.out.println("상품 추가");
				quiz.putProduct();
			}
			if(n==2) {
				System.out.println("현황 선택");
				quiz.outProduct();
			}
			if(n==9) {
				System.out.println("종료");
				break;
			}
		}
	}

}
