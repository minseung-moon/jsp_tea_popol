package tea.teaCommunity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tea.DBConn;

public class CommunityDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public CommunityDAO() {
		try {
			con = DBConn.getConnection();
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	public ArrayList<CommunityDTO> selectAllCommunity() {
		ArrayList<CommunityDTO> dtos = new ArrayList<CommunityDTO>();
		
		try {
			sql = "select idx, userId, title, content,  date_format(regdate, '%Y년%m월%d일') as regdate, count from teaCommunity order by idx desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommunityDTO dto = new CommunityDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCount(rs.getString("count"));
				
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("select community error");
		}
		return dtos;
	}
	
	public ArrayList<CommunityDTO> selectAllCommunity(String search) {
		ArrayList<CommunityDTO> dtos = new ArrayList<CommunityDTO>();
		
		try {
			sql = "select idx, userId, title, content, date_format(regdate, '%Y년%m월%d일') as regdate, count from teaCommunity where title like ?  order by idx desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommunityDTO dto = new CommunityDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setUserId(rs.getString("userId"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCount(rs.getString("count"));
				
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("select community error");
		}
		return dtos;
	}
	
	public boolean insertCommunity(CommunityDTO dto) {
		boolean check = false;
		
		try {
			sql = "insert into teaCommunity(userId, title, content) values(?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("insert community error");
		}
		
		return check;
	}
	
	public CommunityDTO selectCommunity(String idx) {
		CommunityDTO dto = new CommunityDTO();
		
		try {
			sql = "select idx, userId, title, content, date_format(regdate, '%Y년%m월%d일') as regdate, count from teaCommunity where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			dto.setIdx(rs.getString("idx"));
			dto.setUserId(rs.getString("userId"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setRegdate(rs.getString("regdate"));
			dto.setCount(rs.getString("count"));
		}catch(SQLException e){
			System.out.println("select community error");
		}
		return dto;
		
	}
	
	public boolean updateCount(String idx) {
		boolean check = false;
		try {
			sql = "UPDATE teaCommunity SET count = count+1 WHERE idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			check = pstmt.executeUpdate() == 1 ? true : false;
			
		}catch(SQLException e){
			System.out.println("select community error");
		}
		return check;
	}
	
	public boolean deleteCommunity(String idx) {
		boolean check = false;
		try {
			sql = "delete from teaCommunity WHERE idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			check = pstmt.executeUpdate() == 1 ? true : false;
			
		}catch(SQLException e){
			System.out.println("delete community error");
		}
		return check;
	}
	
	public boolean updateCommunity(CommunityDTO dto) {
		boolean check = false;
		try {
			sql = "update teaCommunity set title = ?, content = ? where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			System.out.println(dto.getTitle());
			pstmt.setString(2, dto.getContent());
			System.out.println(dto.getContent());
			pstmt.setString(3, dto.getIdx());
			System.out.println(dto.getIdx());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
			
		}catch(SQLException e){
			System.out.println("update community error");
		}
		return check;
	}
}
