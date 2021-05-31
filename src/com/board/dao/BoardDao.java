package com.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.board.beans.board;

public class BoardDao extends CommonDao {
	public static BoardDao getInstance() {
		BoardDao _instance = new BoardDao();
		return _instance;
	}
	
	public ArrayList<board> getArticleList() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board order by idx desc";
		pstmt = openConnection().prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		ArrayList<board> articleList = new ArrayList<board>();
		
		while(rs.next()) {
			board article = new board();
			
			article.setIdx(rs.getInt("idx"));
			article.setTitle(rs.getString("title"));
			article.setWriter(rs.getString("writer"));
			article.setCount(rs.getInt("count"));
			article.setContent(rs.getString("content"));
			articleList.add(article);
		}
		closeConnection();
		return articleList;
	}
}
