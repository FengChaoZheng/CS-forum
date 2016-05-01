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
import com.forum.model.Document;

public class DocumentDaoImp implements DocumentDao {

	private Connection con=null;
	private PreparedStatement prepStmt=null;
	private ResultSet rs=null;
	
	public int pageSize = 5;
	
	//id,name,user_id,upload_time,save_path
	protected static String INSERT_SQL = "insert into forum_document values(?,?,?,?,?)";
	protected static String SELECT_SQL = "select * from forum_document";
	protected static String DELETE_SQL = "delete from forum_document where id=?";

	@Override
	public Document upload(Document newDocument) throws Exception {
		
		try{
	    	  con=DBConnect.getDBconnection();
	    	  prepStmt =con.prepareStatement(INSERT_SQL); 
	    	  
	    	  String id = String.valueOf(System.currentTimeMillis());
	    	  prepStmt.setString(1,id);//id
	    	  
	    	  System.out.println("newDocument getName:"+newDocument.getName());
	    	  prepStmt.setString(2,newDocument.getName());//name
	    	  
	    	  System.out.println("newDocument getUserName:"+newDocument.getUserName());
	    	  prepStmt.setString(3, newDocument.getUserName());//user_name
	    	  
	    	  Date date = new Date();
	    	  DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	  String time = format.format(date);
	    	  
	    	  prepStmt.setString(4, time);//upload_time
	    	  
	    	  System.out.println("newDocument getSavePath:"+newDocument.getSavePath());
	    	  prepStmt.setString(5, newDocument.getSavePath());//save_path
	          prepStmt.executeUpdate();
	      } catch(Exception e){
	    	  e.printStackTrace();
	      } finally{
	    	  DBConnect.closeDB(con, prepStmt, rs);
	      }
	     return newDocument;
	}

	@Override
	public void delete(Document newDocument) throws Exception {
		
		try {
	    	con=DBConnect.getDBconnection();
	    	prepStmt = con.prepareStatement(DELETE_SQL);
	        prepStmt.setString(1,newDocument.getId());
	        prepStmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    } finally{
	    	 DBConnect.closeDB(con, prepStmt, rs);
	    }
	}

	@Override
	public Document find(Document document) throws Exception {
		return null;
	}

	@Override
	public int getPageCount() throws Exception {

		int recordCount=0,t1=0,t2=0;
		try {
			con = DBConnect.getDBconnection();
			String sql = "select count(*) from forum_document";
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
	public List<Document> listDocument(int pageNo) throws Exception {

		int startRecno=(pageNo-1)*pageSize;
		ArrayList<Document> documentList=new ArrayList<Document>();
		try {
			con = DBConnect.getDBconnection();
			String sql = "select * from forum_document order by id limit ?,?";
			prepStmt=con.prepareStatement(sql);
			prepStmt.setInt(1,startRecno);
			prepStmt.setInt(2,pageSize);
			rs=prepStmt.executeQuery();
			while(rs.next()) {
				Document newDocument = new Document();
				newDocument.setId(rs.getString(1));
				newDocument.setName(rs.getString(2)); 
				newDocument.setUserName(rs.getString(3));
				newDocument.setUploadTime(rs.getString(4));
				newDocument.setSavePath(rs.getString(5));
	            documentList.add(newDocument);
	        }
		}finally {
			rs.close();
			prepStmt.close();
			DBConnect.closeDB(con, prepStmt, rs);;
		}
		return documentList;
	}

}
