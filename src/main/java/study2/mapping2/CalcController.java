package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.calc")
public class CalcController extends HttpServlet {
	MappingInterface command = null; /*1. httpservlet을 구현한 인터페이스를 만든다. command 변수 사용*/
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewPage ="/WEB-INF/study2/mapping2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		if (com.equals("/Calc")) {
			viewPage += "/calc.jsp";
		}
		else if (com.equals("/CalcOk")) {
			command =new CalcOkCommand();  /*인터페이스를 상속한 클래스를 만들고 변수 conn에 담음*/
			command.execute(request, response); /*excute 명령어실행하면 request에 새로운 정보가 담긴다.*/
			viewPage += "/calcOk.jsp";
			
		}
		else if (com.equals("/JuList")) {
			command =new JuListCommand();  /*인터페이스를 상속한 클래스를 만들고 변수 conn에 담음*/
			command.execute(request, response); /*excute 명령어실행하면 request에 새로운 정보가 담긴다.*/
			viewPage += "/juList.jsp";
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
