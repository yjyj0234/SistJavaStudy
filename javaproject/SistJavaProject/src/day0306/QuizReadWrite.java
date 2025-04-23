package day0306;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;
import java.util.StringTokenizer;

public class QuizReadWrite {
    static final String SANGPUMQUIZ="C:\\sist0217\\work\\Product.txt";
    								//"C:/sist0217/work/Product.txt"; 도 쓸 수 있다
    FileReader fr;
    BufferedReader br;
    FileWriter fw;
    Scanner sc=new Scanner(System.in);
    
    //메뉴 입력창
    public int getMenu()
    {
        int num=0;
        System.out.println("1. 상품추가  2. 상품전체입고현황  3. 파일삭제  9. 종료");
        num=Integer.parseInt(sc.nextLine());
        //1.상품추가 2.상품전체입고현황 9.종료
        return num;
    }
    
    //입력후 파일에 저장 sangpumAdd()
    //수량 단가는 옆으로 저장 : fw.write(상품명+","+수량+","+"단가"+"\n");
    public void sangpumAdd()
    {
        System.out.println("상품명 입력: ");
        String sang=sc.nextLine();

        System.out.println("수량 입력: ");
        int su=Integer.parseInt(sc.nextLine());

        System.out.println("단가 입력: ");
        int price=Integer.parseInt(sc.nextLine());
        
        //파일 메모장에 저장
        try {
            fw=new FileWriter(SANGPUMQUIZ,true);        //여기서 try catch
            fw.write(sang+","+su+","+price+"\n");

            System.out.println("상품 정보 저장");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            try {
                fw.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }
   
    //상품전체입고현황_전체 출력
    public void sangpumAllDatas()
    {
        System.out.println("번호\t상품명\t수량\t단가\t금액\t할인\t총금액");
        System.out.println("===========================================================");

        try {
        	QuizReadWrite q1=new QuizReadWrite();
            fr=new FileReader(SANGPUMQUIZ);
            br=new BufferedReader(fr);

            int num=0;
            int total=0;
            while(true)
            {
                String read=br.readLine();    //한 줄씩 읽기
                if(read==null)
                    break;
                // 김,10,1000
                StringTokenizer st= new StringTokenizer(read,",");
                
                //","로 쪼개고 나서 변수 선언
                String name = st.nextToken();
                int su=Integer.parseInt(st.nextToken());
                int price=Integer.parseInt(st.nextToken());
                
                int gmac=su*price;
                int cGmac=getSuMoney(su,price);
                int sale=gmac-cGmac;
                
                //전체 총금액
                total+=cGmac;
                //번호 상품명 수량 단가 금액 할인 총금액 
                System.out.println(++num+"\t"+name+"\t"+su+"\t"+price+
                        "\t"+gmac+"\t"+sale+"\t"+cGmac);
            }
       
            System.out.println();
            System.out.println("\t\t전체 총 금액="+total+"원");
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }catch (IOException e) {
            // TODO: handle exception
        }finally {
            try {
                br.close();
                fr.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }
    //금액, 할인 총금액 계산
    public int getSuMoney(int su,int price)
    {
        int gSM=su*price;
        int totM=gSM;
        if(su>=10)
        {
            totM=gSM*9/10;
        }
        return totM;
    }
    //수량이 10개 이상이면 금액의 10프로 할인
    
    //파일 삭제
    public void deleteSangpum() {
		//File 객체를 생성.. 만일 파일이 존재한다면 삭제
    	File file=new File(SANGPUMQUIZ);
    	
    	if(file.exists())
    		file.delete();
    	
    	System.out.println("**모든 데이터가 삭제되었습니다**");
	}
    
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        //1번이면 입력메서드 호출.. 2번이면 출력메서드 호출 9번종료
    	QuizReadWrite qrw=new QuizReadWrite();
    	
        while(true) {
            int num=qrw.getMenu(); // 2
            if(num==1) {
                System.out.println("상품 추가를 선택하셨습니다.");
                qrw.sangpumAdd();
                
            }

            if(num==2) {
                System.out.println("상품 전체 입고 현황");
                qrw.sangpumAllDatas();
                
            }
            if(num==3) {
            	System.out.println("파일을 삭제합니다");
            	qrw.deleteSangpum();
            	break;
            }
            
            if(num==9) {
                System.out.println("종료");
                break;
            }
            
        }
    }

}
