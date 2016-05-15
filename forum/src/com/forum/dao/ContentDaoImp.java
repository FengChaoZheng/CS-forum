package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.forum.database.DBConnect;
import com.forum.model.Content;

public class ContentDaoImp implements ContentDao {

	private SectionDao sd;

	public void setSd(SectionDao sd) {
		this.sd = sd;
	}

	private Connection con = null;
	private PreparedStatement prepStmt = null;
	private ResultSet rs = null;

	public int pageSize = 5;

	// id,title,content,user_name,post_time,section_id
	protected static String INSERT_SQL = "insert into forum_content values(?,?,?,?,?,?)";
	protected static String SELECT_SQL = "select * from forum_content";
	protected static String DELETE_SQL = "delete from forum_content where id=?";

	@Override
	public Content create(Content content) throws Exception {
		try {
			con = DBConnect.getDBconnection();
			prepStmt = con.prepareStatement(INSERT_SQL);

			String id = String.valueOf(System.currentTimeMillis());
			prepStmt.setString(1, id);// id

			System.out.println("content getTitle:" + content.getTitle());
			prepStmt.setString(2, content.getTitle());// title

			System.out.println("content getMessage:" + content.getMessage());
			prepStmt.setString(3, content.getMessage());

			System.out.println("content getUserName:" + content.getUserName());
			prepStmt.setString(4, content.getUserName());// user_name

			Date date = new Date();
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = format.format(date);
			prepStmt.setString(5, time);// post_time

			System.out.println("content getSectionName:"
					+ content.getSectionName());
			prepStmt.setInt(6, sd.findId(content.getSectionName()));// section_id
			prepStmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.closeDB(con, prepStmt, rs);
		}
		return content;
	}

	@Override
	public Content find(Content content) throws Exception {
		return null;
	}

	@Override
	public void delete(Content content) throws Exception {

		try {
			con = DBConnect.getDBconnection();
			prepStmt = con.prepareStatement(DELETE_SQL);
			prepStmt.setString(1, content.getId());
			prepStmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.closeDB(con, prepStmt, rs);
		}
	}

	@Override
	public int getPageCount(int value) throws Exception {

		int recordCount = 0, t1 = 0, t2 = 0;
		try {
			con = DBConnect.getDBconnection();
			String sql = "select count(*) from forum_content where section_id=?";
			prepStmt = con.prepareStatement(sql);
			prepStmt.setInt(1, value);
			rs = prepStmt.executeQuery();
			rs.next();
			recordCount = rs.getInt(1);
			t1 = recordCount % pageSize;
			t2 = recordCount / pageSize;
		} finally {
			rs.close();
			prepStmt.close();
			DBConnect.closeDB(con, prepStmt, rs);
			;
		}
		return t1 == 0 ? t2 : t2 + 1;
	}

	@Override
	public int getPageCount(String value) throws Exception {

		int recordCount = 0, t1 = 0, t2 = 0;
		try {
			con = DBConnect.getDBconnection();
			String sql = "select count(*) from forum_content where content like '%'?'%'";
			prepStmt = con.prepareStatement(sql);
			prepStmt.setString(1, value);
			rs = prepStmt.executeQuery();
			rs.next();
			recordCount = rs.getInt(1);
			t1 = recordCount % pageSize;
			t2 = recordCount / pageSize;
		} finally {
			rs.close();
			prepStmt.close();
			DBConnect.closeDB(con, prepStmt, rs);
			;
		}
		return t1 == 0 ? t2 : t2 + 1;
	}

	@Override
	public List<Content> listContent(int pageNo, int sectionId)
			throws Exception {

		int startRecno = (pageNo - 1) * pageSize;
		ArrayList<Content> contentList = new ArrayList<Content>();
		try {
			con = DBConnect.getDBconnection();
			String sql = "select * from forum_content where section_id=? order by id limit ?,?";
			prepStmt = con.prepareStatement(sql);
			System.out.println("sectionId:" + sectionId);
			prepStmt.setInt(1, sectionId);
			prepStmt.setInt(2, startRecno);
			prepStmt.setInt(3, pageSize);
			rs = prepStmt.executeQuery();
			while (rs.next()) {
				Content newContent = new Content();
				newContent.setId(rs.getString(1));
				newContent.setTitle(rs.getString(2));
				newContent.setMessage(rs.getString(3));
				newContent.setUserName(rs.getString(4));
				newContent.setPostTime(rs.getString(5));
				newContent.setSectionName(sd.findName(rs.getInt(6)));
				contentList.add(newContent);
			}
		} finally {
			rs.close();
			prepStmt.close();
			DBConnect.closeDB(con, prepStmt, rs);
			;
		}
		return contentList;
	}

	@Override
	public List<Content> listContent(int pageNo, String content)
			throws Exception {

		int startRecno = (pageNo - 1) * pageSize;
		ArrayList<Content> contentList = new ArrayList<Content>();
		try {
			con = DBConnect.getDBconnection();
			String sql = "select * from forum_content where content like '%'?'%' order by id limit ?,?";
			prepStmt = con.prepareStatement(sql);
			System.out.println("selectContent:" + content);
			prepStmt.setString(1, content);
			prepStmt.setInt(2, startRecno);
			prepStmt.setInt(3, pageSize);
			rs = prepStmt.executeQuery();
			while (rs.next()) {
				Content newContent = new Content();
				newContent.setId(rs.getString(1));
				newContent.setTitle(rs.getString(2));
				newContent.setMessage(rs.getString(3));
				newContent.setUserName(rs.getString(4));
				newContent.setPostTime(rs.getString(5));
				newContent.setSectionName(sd.findName(rs.getInt(6)));
				contentList.add(newContent);
			}
		} finally {
			rs.close();
			prepStmt.close();
			DBConnect.closeDB(con, prepStmt, rs);
			;
		}
		return contentList;
	}

}
