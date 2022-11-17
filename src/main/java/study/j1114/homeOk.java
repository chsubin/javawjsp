package study.j1114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1114_homeOk")
public class homeOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		 PrintWriter out = response.getWriter();
		 
		 
		 String name = request.getParameter("name");
		 String [] pnames = request.getParameterValues("pname");
		 String [] prices = request.getParameterValues("price");
		 String [] numbers = request.getParameterValues("number");
		 int tot=0;
		 
		 if(pnames==null) {
				out.println("<script>");
				out.println("alert('한개 이상의 상품은 등록하셔야 합니다!');");
				out.println("history.back();");
				out.println("</script>");
		 }
		 
		 out.println("<h2>등록 정보</h2><br.>");
		 out.println("구매자 : "+name+"<br/>");
		 for (int i=0;i<pnames.length;i++) {
			 int price = Integer.parseInt(prices[i]);
			 int number = Integer.parseInt(numbers[i]);
			 
			 if (price<=0||number<=0) {
				 out.println("<script>");
				 out.println("alert('음수는 입력하실 수 없습니다.');");
				 out.println("history.back();");
				 out.println("</script>");
			 }
			 out.println("상품명 : "+pnames[i]);
			 out.println("|가격 : "+prices[i]+"원");
			 out.println("|주문수량 : "+numbers[i]+"개");
			 out.println("|금액 : "+(Integer.parseInt(numbers[i])*Integer.parseInt(prices[i]))+"원</br>");
			 
			 tot+=Integer.parseInt(numbers[i])*Integer.parseInt(prices[i]);
		 }
		 out.println("<br/>총금액 : "+tot+"원</br>");		 
	}
	
}
