package pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import conn.SecurityUtil;

public class PdsDeleteCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		String pwd = request.getParameter("pwd")==null?"":request.getParameter("pwd");
		String fsName_ = request.getParameter("fsName")==null?"":request.getParameter("fsName");
		String [] fsNames = fsName_.split("/");
		
		// 비밀번호를 암호화 한후 DB의 비밀번호와 같으면 작업을 계속 수행처리한다.
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		PdsDAO dao = new PdsDAO();
		
		PdsVO vo = dao.getIdxSearch(idx);
		
		if(vo.getPwd().equals(pwd)) {
			//파일이 저장되어있는 서버의 실제경로를 찾아온다.
			String realPath = request.getServletContext().getRealPath("/data/pds/");
			
			//서버파일시스템에 실제로 존재하는 파일들을 찾아서 삭제처리한다.
			for(String fsName: fsNames) {
//				File file = new File(realPath+ fsName);
//				file.delete();
				new File(realPath+ fsName).delete();
			}
		}
		
		//파일 삭제 완료후 DB에 저장된 자료파일을 삭제한다.
		String res = dao.setPdsDelete(idx);
		
		response.getWriter().write(res);
		
		
	}
}
