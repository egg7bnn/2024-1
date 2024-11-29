package proj_nt;

import java.io.IOException;

/* 2024년도 2학기 자바 프로그래밍 과목 실습과제(2/2) 
   - 제출자 이름 : 설유찬
   - 제출자 학번 : 20241510
   
   <주의> 상기 제출자 이름/학번 미기재시 감점임.
*/



public class NTmain {

    public static void main(String[] args) {
		
		
         try (NoteTaking nt = new NoteTaking("notes.txt")) 
        {
            nt.writeNT("This is the first writing in this notes");
        } 
        catch (IOException e) 
        {
            System.out.println("예외 처리: " + e.getMessage());
        }





    }

}




