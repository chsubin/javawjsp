package j1117;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1117/Test1Ok")
public class Test1Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Null 체크... 공백과 null check
		String name= request.getParameter("name");
		String gender= request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String job= request.getParameter("job");
		String address= request.getParameter("address");
		
		/*
		PrintWriter out = response.getWriter();
		
		out.print("<p>성명 : "+ name + "</p><br/>");
		out.print("<p>성별 : "+ gender + "</p><br/>");
		out.print("<p>나이 : "+ age + "</p><br/>");
		out.print("<p>직업 : "+ job + "</p><br/>");
		out.print("<p>주소 : "+ address + "</p><br/>");
		out.print("<p><a href='"+request.getContextPath()+"/study/1117/jspaction/test1.jsp'>돌아가기</ㅁ></p><br/>");
		*/
		
		//정상처리된 Data를 vo에 넣어준다.
		
		Test1VO vo = new Test1VO();
		
		vo.setName(name);
		vo.setGender(gender);
		vo.setAge(age);
		vo.setJob(job);
		vo.setAddress(address);
		
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/study/1117/jspaction/test1Ok.jsp").forward(request, response);
	}
}
