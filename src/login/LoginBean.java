package login;

import java.sql.*;
import java.util.*;

import login.*;

public class LoginBean {


	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";

	//DB연결 
	void connect() {

		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url, "madang", "madang");


		}catch(Exception e)
		{
			e.printStackTrace();
		}

	}

	//DB연결 해제
	void disconnect() {

		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				pstmt.close();

			}catch(Exception e) {
				e.printStackTrace();
			}
		}


	}

	// 신규회원 등록
	public boolean insertDB(Membership membership) {
		boolean result = true;
		
		connect();
	
		
		if(checkId(membership.getM_id())) {
			result = false;
		}else {

			String sql = "insert into membership(m_id,m_pwd,m_email,m_tel,m_count) values(?,?,?,?,'0')";

			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, membership.getM_id());
				pstmt.setString(2, membership.getM_pwd());
				pstmt.setString(3, membership.getM_email());
				pstmt.setString(4, membership.getM_tel());
				pstmt.executeUpdate();
				
			} catch (SQLException e) {

				e.printStackTrace();
				result =  false;

			} finally {
				disconnect();
			}
		}

		return result;
	}
	
	//회원리스트 메서드
		public ArrayList<Membership> getMDBList() {
			connect();
			ArrayList<Membership> datas = new ArrayList<Membership>();
			
			String sql = "select * from membership order by m_id desc";
			
			
			
			try {
		
				pstmt = conn.prepareStatement(sql);
				
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					
					Membership membership = new Membership();

					membership.setM_id(rs.getString("m_id"));
					membership.setM_pwd(rs.getString("m_pwd"));
					membership.setM_email(rs.getString("m_email"));
					membership.setM_tel(rs.getString("m_tel"));
					membership.setM_count(rs.getInt("m_count"));
					datas.add(membership);
			

				}
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return datas;
		}
	
	
	
	
	
	public boolean checkId(String id) { //회원가입시 중복 아이디 비교 
		boolean check = false;
		
		

		String sql = "select * from membership where m_id = ?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();  
			
			while(rs.next()) {
				check = true;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
		
		
		
		
		return check;
	}
	
	public boolean login(Membership membership) {//입력 아이디와 비밀번호  db의 회원정보와 매치
		boolean result = false;
		
		connect();
		
		String sql = "select * from membership where m_id = ? and m_pwd = ?";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membership.getM_id());
			pstmt.setString(2, membership.getM_pwd());
			ResultSet rs = pstmt.executeQuery();  
			
			while(rs.next()) {
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			disconnect();
		}
	
		
		return result;
		
	}



}
