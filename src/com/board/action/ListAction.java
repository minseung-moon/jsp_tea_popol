package com.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.control.CommandAction;

import java.sql.*;
import java.util.ArrayList;

import com.board.beans.board;
import com.board.control.CommandAction;
import com.board.dao.BoardDao;

public class ListAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		ArrayList<board> articleList = BoardDao.getInstance().getArticleList();
		request.setAttribute("articleList", articleList);
		return "list.jsp";
	}

}
