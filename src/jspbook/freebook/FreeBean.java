package jspbook.freebook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import login.Membership;

public class FreeBean {

	Connection conn = null;

	PreparedStatement pstmt = null;

	// sql 연결정보
	String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
	String jdbc_url = "jdbc:oracle:thin:@localhost:1521:xe";

	// 데이터베이스 연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "madang", "madang");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {

			try {

				conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

	}

	// 수정된 도서리스트 내용갱신을 위한 메서드
	public boolean updateDB(FreeBook freebook) {

		connect();
		String sql = "update freebook set fb_bookname=?, fb_imageurl=?, fb_writer=?,fb_publisher=?, fb_memo=?, fb_kindbook=? where fb_id=?";

		try {
				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, freebook.getFb_bookname());
			pstmt.setString(2, freebook.getFb_imageurl());
			pstmt.setString(3, freebook.getFb_writer());
			pstmt.setString(4, freebook.getFb_publisher());
			pstmt.setString(5, freebook.getFb_memo());
			pstmt.setString(6, freebook.getFb_kindbook());
			pstmt.setInt(7, freebook.getFb_id());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;

		} finally {
			disconnect();
		}

		return true;
	}

	
	//도서 카운트 +1
	public Membership countplus(String gm_id) {
		connect();
		
		String sql = "update membership set m_count = m_count + 1 where m_id = ?";
		Membership membership = new Membership();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gm_id);
			ResultSet rs = pstmt.executeQuery();
			
			
			rs.next();
			membership.setM_id(rs.getString("m_id"));
			membership.setM_pwd(rs.getString("m_pwd"));
			membership.setM_email(rs.getString("m_email"));
			membership.setM_tel(rs.getString("m_tel"));
			membership.setM_count(rs.getInt("m_count"));
			rs.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return membership;
		
	}
	
	//도서 카운트 +1
	public Membership countminus(String gm_id) {
		connect();
		
		String sql = "update membership set m_count = m_count - 1 where m_id = ?";
		Membership membership = new Membership();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gm_id);
			ResultSet rs = pstmt.executeQuery();
			
			
			rs.next();
			membership.setM_id(rs.getString("m_id"));
			membership.setM_pwd(rs.getString("m_pwd"));
			membership.setM_email(rs.getString("m_email"));
			membership.setM_tel(rs.getString("m_tel"));
			membership.setM_count(rs.getInt("m_count"));
			rs.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return membership;
		
	}
	
	
	//종류별 도서 가져오는 메서드
	public int kindbook(String fb_k) {
		connect();

		String sql = "select * from freebook where fb_kindbook = '"+ fb_k +"'";
		
		int count = 0;
		
		try {
				
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
				
			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
			while(rs.next()) {
				count++;
			}
			
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return count;
	}
	
	
	
	
	// 특정 도서 등록 글 삭제 메서드
	public boolean deleteDB(int gb_id) {
		connect();

		String sql = "delete from freebook where fb_id =?";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 신규 도서 등록 메서드
	public boolean insertDB(FreeBook freebook) {
		connect();
		// sql 문자열 , gb_id는 자동 등록되므로 입력하지않는다.

		String sql = "insert into freebook(fb_bookname,fb_writer,fb_publisher,fb_publicationdate,fb_memo,fb_userid,fb_imageurl,fb_kindbook) values(?,?,?,sysdate,?,?,?,?)";
		
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, freebook.getFb_bookname());
			pstmt.setString(2, freebook.getFb_writer());
			pstmt.setString(3, freebook.getFb_publisher());
			pstmt.setString(4, freebook.getFb_memo());
			pstmt.setString(5, freebook.getFb_userid());
			pstmt.setString(6, freebook.getFb_imageurl());
			pstmt.setString(7, freebook.getFb_kindbook());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {

			e.printStackTrace();
			return false;

		} finally {
			disconnect();
		}
		return true;
	}
	

	// 특정 도서 상위 셀 가져오는 메서드
	public FreeBook getDBRow(int row) {
		connect();

		String sql = "select * from (select rownum as num, FB_ID, FB_BOOKNAME, FB_WRITER, FB_PUBLISHER, FB_PUBLICATIONDATE, FB_MEMO, FB_USERID, FB_IMAGEURL, FB_KINDBOOK from (select * from freebook order by fb_id desc))a where a.num=?";
		FreeBook freebook = new FreeBook();

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, row);
			ResultSet rs = pstmt.executeQuery();

			rs.next();
			freebook.setFb_id(rs.getInt("fb_id"));
			freebook.setFb_bookname(rs.getString("fb_bookname"));
			freebook.setFb_writer(rs.getString("fb_writer"));
			freebook.setFb_publisher(rs.getString("fb_publisher"));
			freebook.setFb_publicationdate(rs.getString("fb_publicationdate"));
			freebook.setFb_memo(rs.getString("fb_memo"));
			freebook.setFb_userid(rs.getString("fb_userid"));
			freebook.setFb_imageurl(rs.getString("fb_imageurl"));
			freebook.setFb_kindbook(rs.getString("fb_kindbook"));
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return freebook;
	}
	
	
	//유저 정보를 가져오는 메서드
	public Membership getUserInfo(String gm_id) {
		connect();
		
		String sql = "select * from membership where m_id =?";
		Membership membership = new Membership();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gm_id);
			ResultSet rs = pstmt.executeQuery();
			
			
			rs.next();
			membership.setM_id(rs.getString("m_id"));
			membership.setM_pwd(rs.getString("m_pwd"));
			membership.setM_email(rs.getString("m_email"));
			membership.setM_tel(rs.getString("m_tel"));
			membership.setM_count(rs.getInt("m_count"));
			rs.close();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return membership;
		
	}
	
	
	// 특정 도서 가져오는 메서드
	public FreeBook getDB(int gb_id) {
		connect();

		String sql = "select * from freebook where fb_id =?";
		FreeBook freebook = new FreeBook();

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gb_id);
			ResultSet rs = pstmt.executeQuery();

			// 데이터가 하나만 있으므로 rs.next()를 한번만 실행한다.
			rs.next();
			freebook.setFb_id(rs.getInt("fb_id"));
			freebook.setFb_bookname(rs.getString("fb_bookname"));
			freebook.setFb_writer(rs.getString("fb_writer"));
			freebook.setFb_publisher(rs.getString("fb_publisher"));
			freebook.setFb_publicationdate(rs.getString("fb_publicationdate"));
			freebook.setFb_memo(rs.getString("fb_memo"));
			freebook.setFb_userid(rs.getString("fb_userid"));
			freebook.setFb_imageurl(rs.getString("fb_imageurl"));
			freebook.setFb_kindbook(rs.getString("fb_kindbook"));
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return freebook;
	}

	// 도서 리스트를 가져오는 메서드
	public ArrayList<FreeBook> getDBList() {
		connect();
		ArrayList<FreeBook> datas = new ArrayList<FreeBook>();
		
		String sql = "select * from freebook order by fb_id desc";
		
		
		
		try {
	
			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				FreeBook freebook = new FreeBook();

				freebook.setFb_id(rs.getInt("fb_id"));
				freebook.setFb_bookname(rs.getString("fb_bookname"));
				freebook.setFb_writer(rs.getString("fb_writer"));
				freebook.setFb_publisher(rs.getString("fb_publisher"));
				freebook.setFb_publicationdate(rs.getString("fb_publicationdate"));
				freebook.setFb_memo(rs.getString("fb_memo"));
				freebook.setFb_userid(rs.getString("fb_userid"));
				freebook.setFb_imageurl(rs.getString("fb_imageurl"));
				freebook.setFb_kindbook(rs.getString("fb_kindbook"));
				
				datas.add(freebook);
		

			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		return datas;
	}
	
	
	
	


}
