package tableProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tea.DBConn;

public class TableProductDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public TableProductDAO() {
		try {
			con = DBConn.getConnection();
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	public ArrayList<TableProductCategoryDTO> selectTableCategory() {
		ArrayList<TableProductCategoryDTO> dtos = new ArrayList<TableProductCategoryDTO>();
		
		try {
			sql = "select * from tableProductCategory order by idx asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TableProductCategoryDTO dto = new TableProductCategoryDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setCategory(rs.getString("category"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect category error");
		}
		
		return dtos;
	}
	
	public boolean insertTableProduct(TableProductDTO dto) {
		boolean check = false;
		
		try {
			sql = "insert into tableProduct(name, price, category, stock, description, saveFilename, originalFilename) values( ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getStock());
			pstmt.setString(5, dto.getDescription());
			pstmt.setString(6, dto.getSaveFilename());
			pstmt.setString(7, dto.getOriginalFilename());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("insert TableProduct error");
		}
		
		return check;
	}
	
	public ArrayList<TableProductDTO> selectAllTableProduct() {
		ArrayList<TableProductDTO> dtos = new ArrayList<TableProductDTO>();
		
		try {
			sql = "select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from tableProduct p inner join tableProductCategory c on p.category = c.idx order by p.idx asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TableProductDTO dto = new TableProductDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setCategory(rs.getString("category"));
				dto.setStock(rs.getString("stock"));
				dto.setDescription(rs.getString("description"));
				dto.setSaveFilename(rs.getString("saveFilename"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect TableProduct error");
		}
		
		return dtos;
	}
	
	public TableProductDTO selectTableProduct(String idx) {
		TableProductDTO dto = new TableProductDTO();
		
		try {
			sql = "select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from tableProduct p inner join tableProductCategory c on p.category = c.idx where p.idx = ? order by p.idx asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			
			rs.next();
			dto.setIdx(rs.getString("idx"));
			dto.setName(rs.getString("name"));
			dto.setPrice(rs.getString("price"));
			dto.setCategory(rs.getString("category"));
			dto.setStock(rs.getString("stock"));
			dto.setDescription(rs.getString("description"));
			dto.setSaveFilename(rs.getString("saveFilename"));
			dto.setOriginalFilename(rs.getString("originalFilename"));
		}catch(SQLException e){
			System.out.println("slect product error");
		}
		
		return dto;
	}
	
	public boolean deleteTableProduct(String idx) {
		boolean check = false;
		
		try {
			sql = "delete from tableProduct where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("delete product error");
		}
		
		return check;
	}
	
	public boolean updateTableProduct(TableProductDTO dto) {
		boolean check = false;
		System.out.println(1);
		try {
			sql = "update tableProduct set name=?, price=?, category=?, stock=?, description=? where idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getStock());
			pstmt.setString(5, dto.getDescription());
			pstmt.setString(6, dto.getIdx());
			System.out.println(dto.getIdx());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("update product error");
		}
		
		return check;
	}
	// -----------------------------------------
	public boolean insertTableOrder(TableOrderDTO dto) {
		boolean check = false;
		
		try {
			sql = "insert into tableOrder(idx, userId, amount) values(?, ?, ?)";
			pstmt = con.prepareStatement(sql);	
			pstmt.setString(1, dto.getIdx());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getAmount());
			
			check = pstmt.executeUpdate() == 1 ? updateStock(dto.getIdx(), dto.getAmount()) : false;
		}catch(SQLException e){
			System.out.println("insert order error");
		}
		
		return check;
	} 
	
	public boolean updateStock(String idx, String stock) {
		boolean check = false;
		
		try {
			sql = "update tableProduct set stock=stock-? where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, stock);
			pstmt.setString(2, idx);
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("update product stock error");
		}
		
		return check;
	}
	
	public ArrayList<TableProductDTO> selectSearchTableProduct(String search) {
		ArrayList<TableProductDTO> dtos = new ArrayList<TableProductDTO>();
		
		try {
			sql = "select * from tableProduct where name like ? order by idx asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TableProductDTO dto = new TableProductDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setCategory(rs.getString("category"));
				dto.setStock(rs.getString("stock"));
				dto.setDescription(rs.getString("description"));
				dto.setSaveFilename(rs.getString("saveFilename"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect search TableProduct error");
		}
		
		return dtos;
	}
	
	public ArrayList<TableProductDTO> selectCategoryProduct(String category) {
		ArrayList<TableProductDTO> dtos = new ArrayList<TableProductDTO>();
		
		try {
			sql = "select * from tableProduct where category = ? order by idx asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TableProductDTO dto = new TableProductDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setCategory(rs.getString("category"));
				dto.setStock(rs.getString("stock"));
				dto.setDescription(rs.getString("description"));
				dto.setSaveFilename(rs.getString("saveFilename"));
				dto.setOriginalFilename(rs.getString("originalFilename"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect category TableProduct error");
		}
		
		return dtos;
	}
}
