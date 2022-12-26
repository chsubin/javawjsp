package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		PdsDAO dao = new PdsDAO();
		
		PdsVO vo = dao.getIdxSearch(idx);
		
		String [] fNames = vo.getfName().split("/");
		String [] fSNames = vo.getfSName().split("/");
		
		// 파일 압축에 필요한 객체들을 선언한다.
		FileInputStream fis =null;
		FileOutputStream fos =null;
		ZipOutputStream zos = null;  //가져온것을 temp에 복사할예정
		ServletOutputStream sos = null; // 클라이언트에 전송하기 위해 필요함.
		
		String realPath = request.getServletContext().getRealPath("/data/pds/");
		String zipPath = request.getServletContext().getRealPath("/data/pds/temp/"); //복사해와서 임시로 저장할 곳
		String zipName = vo.getTitle()+".zip"; //집 파일 이름
	
		
		fos = new FileOutputStream(zipPath + zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] b = new byte[2048];
		int data = 0;
		
		//개별파일을 복사하기 위한 반복문
		for(int i=0;i<fNames.length;i++) {
			File file = new File(realPath+fNames[i]); //서버에 저장된 파일이름
//			File copyAndRename= new File(realPath+fSNames[i]); //복사하면서 이름을바꾼다.
//			
//			file.renameTo(copyAndRename); //copyAndRename으로 되어있는걸 file로 바꾸겠다.
//			
//			fis = new FileInputStream(copyAndRename); //인풋스트림으로 바꾸었다.
			fis = new FileInputStream(file);
			zos.putNextEntry(new ZipEntry(fNames[i]));  //zip파일에 한개의 덩어리가 들어가기위한 준비를 마침 저장하면서 저장할 이름을 지정해준다.
			 
			//실제 보내는작업
			while((data=fis.read(b,0,b.length))!=-1) { //데이터가 있으면 보내라!
				zos.write(b,0,data);
			}
			zos.flush(); //남아있는 잔여 데이터까지 처리한다.
			zos.closeEntry();
			fis.close();
		}
		zos.close();    //서버에서 zip파일로 담은것까지 완료!!
		
		//서버에서 압축작업이 완료되면, 압축파일을 클라이언트로 전송하고, 서버에 압축되어있는 파일을 삭제한다.
		//전송프로토콜인 http헤더에 필요한 정보를 알려준다.
		 String mimeType = request.getServletContext().getMimeType(zipName.toString()); //문자열로 바꾸어서 2진바이너리로 바꾼다.
		 
		 if(mimeType==null) {
			 response.setContentType("application/octet-stream"); //2진 바이너리 형식
		 }
		
		 String downLoadName = "";
		 if(request.getHeader("user-agent").indexOf("MSIE")==-1) {
			 downLoadName = new String(zipName.getBytes("UTF-8"),"8859_1");
		 }
		 else {
			 downLoadName = new String(zipName.getBytes("EUC-KR"),"8859_1");
		 }
		 //헤더 정보를 가지고 서버의 zip파일을 클라이언트에 전송처리한다.
		 response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		 //Java에 의해서 실제 파일을 클라이언트로 다운처리 시켜준다.
		 fis = new FileInputStream(zipPath+zipName);
		 sos = response.getOutputStream();
		 
		 while((data=fis.read(b,0,b.length))!=-1) { //데이터가 있으면 보내라!
			 sos.write(b,0,data);
		 }
		 sos.flush();
		 
		 sos.close();
		 fis.close();
		 //이곳까지가 클라이언트로 전송 완료됨...
		 
		 //서버에 존재하는 zip파일을 삭제처리한다.
		 new File(zipPath+zipName).delete();
		 
		 //다운로드 횟수를 증가처리한다.
		 dao.setPdsDownNum(idx);
		 
	}
}
