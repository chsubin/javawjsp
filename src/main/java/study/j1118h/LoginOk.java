package study.j1118h;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/study/j1118h/LoginOk")
public class LoginOk extends HttpServlet {
//유효성검사 하고 쿠키저장 or 저장X => 다시 jsp로 넘기기
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null?"":request.getParameter("pwd");
		String check = request.getParameter("check")==null?"":request.getParameter("check");
		
		PrintWriter out = response.getWriter();
		
		if(!check.equals("y")) {
			Cookie [] cookies = request.getCookies();
			if(cookies!=null) {
				for(int i=0;i<cookies.length;i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setPath("/");
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
					else if(cookies[i].getName().equals("cPwd")) {
						cookies[i].setPath("/");
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
			}
		}
		
		if(!mid.equals("admin")||!pwd.equals("1234")) {
			out.println("<script>");
			out.println("alert('로그인 실패!');");
			out.println("history.back()");
			out.println("</script>");
		}
		else {
			//세션에저장
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sPwd", pwd);
			
			//쿠키에 저장
			if (check.equals("y")) {
				Cookie cookieMid = new Cookie("cMid", mid);
				Cookie cookiePwd = new Cookie("cPwd", pwd);
				cookieMid.setPath("/");
				cookiePwd.setPath("/");
				cookieMid.setMaxAge(60*60);
				cookiePwd.setMaxAge(60*60);
				response.addCookie(cookieMid);
				response.addCookie(cookiePwd);
			}
			
			out.println("<script>");
			out.println("alert('"+session.getAttribute("sMid")+"님 로그인 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/1118h/admin.jsp';");//
			out.println("</script>");
		}
		
		
		
	}
}
