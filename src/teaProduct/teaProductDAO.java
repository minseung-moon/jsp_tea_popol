package teaProduct;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import tableProduct.TableOrderDTO;
import tea.DBConn;

public class teaProductDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public teaProductDAO() {
		try {
			con = DBConn.getConnection();
		} catch (Exception e) {
			System.out.println("DB연결 오류");
		}
	}
	
	public ArrayList<teaProductCategoryDTO> selectCategory() {
		ArrayList<teaProductCategoryDTO> dtos = new ArrayList<teaProductCategoryDTO>();
		
		try {
			sql = "select * from productCategory order by idx asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				teaProductCategoryDTO dto = new teaProductCategoryDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setCategory(rs.getString("category"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect category error");
		}
		
		return dtos;
	}
	
	public boolean insertProduct(teaProductDTO dto) {
		boolean check = false;
		
		try {
			sql = "insert into Product(name, price, category, stock, description, saveFilename, originalFilename) values( ?, ?, ?, ?, ?, ?, ?)";
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
			System.out.println("insert product error");
		}
		
		return check;
	}
	
	public ArrayList<teaProductDTO> selectAllProduct() {
		ArrayList<teaProductDTO> dtos = new ArrayList<teaProductDTO>();
		
		try {
			sql = "select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from product p inner join productCategory c on p.category = c.idx order by p.idx asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				teaProductDTO dto = new teaProductDTO();
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
			System.out.println("slect product error");
		}
		
		return dtos;
	}
	
	public teaProductDTO selectProduct(String idx) {
		teaProductDTO dto = new teaProductDTO();
		
		try {
			sql = "select p.idx, p.name, p.price, c.category, p.stock, p.description, p.saveFilename, p.originalFilename from product p inner join productCategory c on p.category = c.idx where p.idx = ? order by p.idx asc";
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
	
	public boolean deleteProduct(String idx) {
		boolean check = false;
		
		try {
			sql = "delete from product where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, idx);
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("delete product error");
		}
		
		return check;
	}
	
	public boolean updateProduct(teaProductDTO dto) {
		boolean check = false;
		
		try {
			sql = "update product set name=?, price=?, category=?, stock=?, description=? where idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPrice());
			pstmt.setString(3, dto.getCategory());
			pstmt.setString(4, dto.getStock());
			pstmt.setString(5, dto.getDescription());
			pstmt.setString(6, dto.getIdx());
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("update product error");
		}
		
		return check;
	}
	
	public boolean insertOrder(teaOrderDTO dto) {
		boolean check = false;
		
		try {
			sql = "insert into teaOrder(idx, userId, amount) values(?, ?, ?)";
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
			sql = "update product set stock=stock-? where idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, stock);
			pstmt.setString(2, idx);
			
			check = pstmt.executeUpdate() == 1 ? true : false;
		}catch(SQLException e){
			System.out.println("update product stock error");
		}
		
		return check;
	}
	
	public ArrayList<teaProductDTO> selectSearchProduct(String search) {
		ArrayList<teaProductDTO> dtos = new ArrayList<teaProductDTO>();
		
		try {
			sql = "select * from product where name like ? order by idx asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				teaProductDTO dto = new teaProductDTO();
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
			System.out.println("slect search product error");
		}
		
		return dtos;
	}
	
	public ArrayList<teaProductDTO> selectCategoryProduct(String category) {
		ArrayList<teaProductDTO> dtos = new ArrayList<teaProductDTO>();
		
		try {
			sql = "select * from product where category = ? order by idx asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				teaProductDTO dto = new teaProductDTO();
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
			System.out.println("slect category product error");
		}
		
		return dtos;
	}
	
	public ArrayList<teaOrderDTO> selectAllProductOrder() {
		ArrayList<teaOrderDTO> dtos = new ArrayList<teaOrderDTO>();
		
		try {
			sql = "select p.idx, p.name, o.userId, o.amount, date_format(regdate, '%Y년%m월%d') as regdate, date_format(date_add(regdate, INTERVAL 7 DAY), '%Y년%m월%d일') as enddate from teaOrder o inner join product p on p.idx = o.idx order by regdate asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				teaOrderDTO dto = new teaOrderDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setUserId(rs.getString("userId"));
				dto.setAmount(rs.getString("amount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEnddate(rs.getString("enddate"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect category product error");
		}
		
		return dtos;
	}
	
	public ArrayList<teaOrderDTO> selectProductOrder(String userId) {
		ArrayList<teaOrderDTO> dtos = new ArrayList<teaOrderDTO>();
		
		try {
			sql = "select p.idx, p.name, o.userId, o.amount, date_format(regdate, '%Y년%m월%d') as regdate, date_format(date_add(regdate, INTERVAL 7 DAY), '%Y년%m월%d일') as enddate from teaOrder o inner join product p on p.idx = o.idx where userId = ? order by regdate asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				teaOrderDTO dto = new teaOrderDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setUserId(rs.getString("userId"));
				dto.setAmount(rs.getString("amount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEnddate(rs.getString("enddate"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect category product error");
		}
		
		return dtos;
	}
	
	public ArrayList<TableOrderDTO> selectAllTableProductOrder() {
		ArrayList<TableOrderDTO> dtos = new ArrayList<TableOrderDTO>();
		
		try {
			sql = "select p.idx, p.name, o.userId, o.amount, date_format(regdate, '%Y년%m월%d일') as regdate, date_format(date_add(regdate, interval 7 day), '%Y년%m월%d일') as enddate from tableOrder o inner join tableProduct p on p.idx = o.idx order by regdate asc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TableOrderDTO dto = new TableOrderDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setUserId(rs.getString("userId"));
				dto.setAmount(rs.getString("amount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEnddate(rs.getString("enddate"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect category product error");
		}
		
		return dtos;
	}
	
	public ArrayList<TableOrderDTO> selectTableProductOrder(String userId) {
		ArrayList<TableOrderDTO> dtos = new ArrayList<TableOrderDTO>();
		
		try {
			sql = "select p.idx, p.name, o.userId, o.amount, date_format(regdate, '%Y년%m월%d') as regdate, date_format(date_add(regdate, INTERVAL 7 DAY), '%Y년%m월%d일') as enddate from tableOrder o inner join tableProduct p on p.idx = o.idx where userId = ? order by regdate asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TableOrderDTO dto = new TableOrderDTO();
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setUserId(rs.getString("userId"));
				dto.setAmount(rs.getString("amount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setEnddate(rs.getString("enddate"));
				dtos.add(dto);
			}
		}catch(SQLException e){
			System.out.println("slect category product error");
		}
		
		return dtos;
	}
	
//	public static void main(String[] args) {
//		teaProductDAO dao = new teaProductDAO();
//		teaProductDTO dto = dao.selectProduct("2");
//		System.out.println(dto.getStock());
//	}
}
