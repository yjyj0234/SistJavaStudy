package day0225;

import java.util.Arrays;

public class RndSortLotto_05 {

	public static void main(String[] args) {
		
		int [] lotto=new int[6];
		
		//임의의 수를 로또변수에 발생 시켜서 넣어준다
		for(int i=0;i<lotto.length;i++)
		{
			lotto[i]=(int)(Math.random()*45)+1;  //1~45중의 랜덤수 발생
			//System.out.println("뽑은 값: "+lotto[i]);
			
			//중복처리 로직:현재 index(i)와 (0~i-1) 비교해서 중복된 숫자가 존재하면 i--
			for(int j=0;j<i;j++)
			{
				if(lotto[i]==lotto[j])
				{
					//System.out.println("중복");
					i--; //같은 번지에 다시 값을 구하기 위해서
					break; //현재 반복문 빠져나와서 i++로 이동
					
				}
			}
				
		}
		//오름차순 정렬
		for(int i=0;i<lotto.length-1;i++)
		{
			for(int j=i+1;j<lotto.length;j++)
			{
				//System.out.println(lotto[i]+"=="+lotto[j]);
				if(lotto[i]>lotto[j])
				{
					int temp=lotto[i];
					lotto[i]=lotto[j];
					lotto[j]=temp;
				}
			}
		}
		
		// Arrays.sort(lotto);  //오름차순 정렬
		
		
		System.out.println("로또 당첨번호: ");
		for(int i=0;i<lotto.length;i++)
		{
			System.out.printf("%5d",lotto[i]);
			//System.out.print(lotto[i]+"  ");
		}
	}

}
