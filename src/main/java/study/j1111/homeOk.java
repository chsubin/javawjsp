package study.j1111;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/homeOk")
public class homeOk extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String mid =request.getParameter("mid");
		String pwd= request.getParameter("pwd");
		String name=request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		String contry = request.getParameter("contry");
		String [] hobbys = request.getParameterValues("hobby");
		String [] jobs = request.getParameterValues("job");
		
		System.out.println("아이디 : " + mid);
		System.out.println("비밀번호 : "+pwd);
		System.out.println("이름 : "+mid);
		System.out.println("생일 : " +birth);
		System.out.println("성별 : "+ gender);
		System.out.println("국적 : "+contry);
		System.out.print("취미 : ");
		if(hobbys!=null) {
			for(String hobby:hobbys) {
					System.out.print(hobby+"/ ");
				}
		}
		else{System.out.print("없음");}
		System.out.println();
		System.out.print("희망직종 : ");
		for(String job:jobs) {
			System.out.print(job +"/ ");
		}
	}
}
