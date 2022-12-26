package study2.api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import conn.GetConn;

public class CrimeDAO {
	// 싱글톤을 이용한 DB연결 객체 연결하기...
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	crimeVO vo = null;

	//범죄 자료 통계 등록
	public void serCrimeInputOk(crimeVO vo) {
		try {
			sql="insert into crime values (default,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getYear());
			pstmt.setString(2, vo.getPolice());
			pstmt.setInt(3, vo.getBurglar());
			pstmt.setInt(4, vo.getMurder());
			pstmt.setInt(5, vo.getTheft());
			pstmt.setInt(6, vo.getViolence());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("SQL 오류 : "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
//범죄 내역 삭제하기
	public String serCrimeDeleteOk() {
		String res ="0";
		try {
			sql = "delete from crime";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			res="1";
			
		} catch (Exception e) {
			System.out.println("SQL 오류 : "+e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	//범죄내역 가져오기
	public ArrayList<crimeVO> getCrimeList() {
		ArrayList<crimeVO> vos = new ArrayList<>();
		try {
			sql ="select * from crime order by year desc,police";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new crimeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYear(rs.getInt("year"));
				vo.setPolice(rs.getString("police"));
				vo.setBurglar(rs.getInt("burglar"));
				vo.setMurder(rs.getInt("murder"));
				vo.setTheft(rs.getInt("theft"));
				vo.setViolence(rs.getInt("violence"));
				
				vos.add(vo);
			}
		} catch (Exception e) {
			System.out.println("SQL 오류 : "+e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vos;
	}

	
}
