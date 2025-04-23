package day0307;

import java.util.List;
import java.util.Vector;

public class Ex5List {

	public static void write(String title,List<String> list) {
		System.out.println("***"+title+"***");
		for(int i=0;i<list.size();i++) {
			System.out.println(i+":"+list.get(i));
		}
		System.out.println();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String [] data= {"피자","햄버거","비빔밥","초밥","된장찌개"};
		
		//배열 data를 list에 담기
		List<String> list=new Vector<String>();
		
		for(String d:data) {
			list.add(d);
		}
			write("초기데이터 전체출력", list);
			
		System.out.println("1번 인덱스 삭제");
		list.remove(1);
		write("삭제 후 결과", list);
		
		//그냥 add: 마지막에 추가
		System.out.println("한우 추가");
		list.add("한우");
		write("추가 후 결과", list);
		
		System.out.println("1번 인덱스의 비빔밥을 육회비빔밥으로 변경");
		list.set(1, "육회비빔밥");
		write("수정 후 결과", list);
		
		System.out.println("전체 삭제");
		list.clear();
		System.out.println("결과: "+list.size());
		
	}

}
