package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.forum.database.DBConnect;
import com.forum.model.Notice;

public class NoticeDaoImp implements NoticeDao {

	private Connection con=null;
	private PreparedStatement prepStmt=null;
	private ResultSet rs=null;
	
	public int pageSize = 5;
	
	protected static String INSERT_SQL = "insert into forum_business values(?,?,?)";
	protected static String SELECT_SQL = "select * from forum_business";
	protected static String DELETE_SQL = "delete from forum_business where id=?";

	@Override
	public Notice create(Notice newNotice) throws Exception {
		try{
	    	  con=DBConnect.getDBconnection();
	    	  prepStmt =con.prepareStatement(INSERT_SQL); 
	    	  
	    	  String id = String.valueOf(System.currentTimeMillis());
	    	  prepStmt.setString(1,id);//id
	    	  prepStmt.setString(2,newNotice.getContent());//content
	    	  prepStmt.setInt(3, newNotice.getUserId());//userId
	          prepStmt.executeUpdate();
	      } catch(Exception e){
	    	  e.printStackTrace();
	      } finally{
	    	  DBConnect.closeDB(con, prepStmt, rs);
	      }
	     return newNotice;
	}

	@Override
	public Notice find(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Notice newNotice) throws Exception {
		try {
	    	con=DBConnect.getDBconnection();
	    	prepStmt = con.prepareStatement(DELETE_SQL);
	        prepStmt.setString(1,newNotice.getId());
	        prepStmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    } finally{
	    	 DBConnect.closeDB(con, prepStmt, rs);
	    }
	}

	@Override
	public int getPageCount() throws Exception {

		int recordCount=0,t1=0,t2=0;
		try {
			con = DBConnect.getDBconnection();
			String sql = "select count(*) from forum_business";
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
	public List<Notice> listNotice(int pageNo) throws Exception {

		int startRecno=(pageNo-1)*pageSize;
		ArrayList<Notice> noticeList=new ArrayList<Notice>();
		try {
			con = DBConnect.getDBconnection();
			String sql = "select * from forum_business order by id limit ?,?";
			prepStmt=con.prepareStatement(sql);
			prepStmt.setInt(1,startRecno);
			prepStmt.setInt(2,pageSize);
			rs=prepStmt.executeQuery();
			while(rs.next()) {
				Notice newNotice = new Notice();
				newNotice.setId(rs.getString(1));
				newNotice.setContent(rs.getString(2)); 
				newNotice.setUserId(rs.getInt(3));
	            noticeList.add(newNotice);
	        }
		}finally {
			rs.close();
			prepStmt.close();
			DBConnect.closeDB(con, prepStmt, rs);;
		}
		return noticeList;
	}
		
}
