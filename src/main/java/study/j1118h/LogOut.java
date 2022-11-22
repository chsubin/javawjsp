package study.j1118h;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/j1118h/LogOut")
public class LogOut extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		session.removeAttribute("sMid");
		session.removeAttribute("sPwd");
		
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+mid+"님 로그아웃 되셨습니다.');");
		out.println("location.href='"+request.getContextPath()+"/study/1118h/Login.jsp';");
		out.println("</script>");
	}
}
