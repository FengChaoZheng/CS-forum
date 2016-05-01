package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.forum.database.DBConnect;
import com.forum.model.Section;

public class SectionDaoImp implements SectionDao {

	private Connection con = null;
	private PreparedStatement prepStmt = null;
	private ResultSet rs = null;
	
	public int id = 0;
	public String name = null;

	@Override
	public Section create(Section section) throws Exception {
		return null;
	}

	@Override
	public int findId(String sectionName) throws Exception {
		try {
			con = DBConnect.getDBconnection();
			String sql = "select id from forum_section where name=?";
			prepStmt = con.prepareStatement(sql);
			prepStmt.setString(1, sectionName);
			System.out.println("reference section name:" + sectionName);
			rs = prepStmt.executeQuery();
			if (rs.next()) {
				id = rs.getInt(1);
				return id;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.closeDB(con, prepStmt, rs);
		}
		return 0;
	}

	@Override
	public String findName(int sectionId) throws Exception {
		try {
			con = DBConnect.getDBconnection();
			String sql = "select name from forum_section where id=?";
			prepStmt = con.prepareStatement(sql);
			prepStmt.setInt(1, sectionId);
			System.out.println("reference section id:" + sectionId);
			rs = prepStmt.executeQuery();
			if (rs.next()) {
				name = rs.getString(1);
				return name;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnect.closeDB(con, prepStmt, rs);
		}
		return null;
	}

	@Override
	public void update(Section section) throws Exception {
	}

	@Override
	public void delete(Section section) throws Exception {
	}

	@Override
	public List<Section> findAll() throws Exception {
		return null;
	}

}
