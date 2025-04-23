package day0305;

import java.io.IOException;
import java.io.InputStream;

public class Ex12IoException {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*		IO Stream

		문자스트림: Reader,Writer 붙게되면 대부분 문자단위로 처리
		바이트스트림: InputStrem,OutputStream 이 붙으면 대부분 바이트 단위로처리,원시데이터를 그대로 주고받음

		BufferReader클래스: 데이터를 읽어올때 한줄씩 읽을수 있는 
		      readline()

		BufferWriter : flush()메서드를 호출해서 버퍼의 내용을 스트림으로 전송한다
*/
		
		InputStream is=System.in;  //콘솔에서 입력받기 위한 노트스트림
		int a=0;
		
		System.out.println("한글자를 입력: ");
		try {
			a=is.read();   //read()는 1바이트 ㅇ므로 한글 못읽음
		} catch (IOException e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
	
		System.out.println("***3초 뒤에 출력합니다***");
		
		try {
			Thread.sleep(3000); //3초
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		System.out.println("입력값: "+(char)a);
	}

}
