package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.forum.database.DBConnect;
import com.forum.model.Section;

public class SectionDaoImp implements SectionDao {

	private Connection con = null;
	private PreparedStatement prepStmt = null;
	private ResultSet rs = null;
	
	public int id = 0;
	public String name = null;
	
	public int pageSize = 5;

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
	public int getPageCount() throws Exception {
		
		int recordCount=0,t1=0,t2=0;
		try {
			con = DBConnect.getDBconnection();
			String sql = "select count(*) from forum_section";
			prepStmt=con.prepareStatement(sql);
			rs=prepStmt.executeQuery();
			rs.next();
			recordCount=rs.getInt(1);
			t1=recordCount%pageSize;
			t2=recordCount/pageSize;
		}finally {
			rs.close();
			prepStmt.close();
			DBConnect.closeDB(con, prepStmt, rs);;
		}
		return t1==0?t2:t2+1;
	}

	@Override
	public List<Section> listSection(int pageNo) throws Exception {

		int startRecno=(pageNo-1)*pageSize;
		ArrayList<Section> sectionList=new ArrayList<Section>();
		try {
			con = DBConnect.getDBconnection();
			String sql = "select * from forum_section order by id limit ?,?";
			prepStmt=con.prepareStatement(sql);
			prepStmt.setInt(1,startRecno);
			prepStmt.setInt(2,pageSize);
			rs=prepStmt.executeQuery();
			while(rs.next()) {
				Section newSection = new Section();
				newSection.setId(rs.getInt(1));
				newSection.setName(rs.getString(2)); 
	            sectionList.add(newSection);
	        }
		}finally {
			rs.close();
			prepStmt.close();
			DBConnect.closeDB(con, prepStmt, rs);;
		}
		return sectionList;
	}

}
