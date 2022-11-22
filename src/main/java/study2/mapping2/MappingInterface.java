package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*서비스 객체에서 구현하기 위한 인터페이스*/
public interface MappingInterface {
	public void execute(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException;
	
}
