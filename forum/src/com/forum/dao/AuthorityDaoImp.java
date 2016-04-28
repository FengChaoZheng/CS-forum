package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.forum.database.DBConnect;
import com.forum.model.Authority;

public class AuthorityDaoImp implements AuthorityDao {
	
	private Authority authority;
	
	public void setAuthority(Authority authority) {
		this.authority = authority;
	}
	
	private Connection con=null;
	private PreparedStatement prepStmt=null;
	private PreparedStatement prepStmt1=null;
	private ResultSet rs=null;
	
	//id,name
	private static String INSERT_SQL = "insert into forum_authority values(?,?)";
	private static String SELECT_SQL = "select * from forum_authority where name=?";
	private static String UPDATE_SQL = "update forum_authority set name=? where id=?";
	private static String DELETE_SQL = "delete from forum_authority where name=?";

	@Override
	public Authority create(Authority newAuthority) throws Exception {
		try{
	    	  con=DBConnect.getDBconnection();
	    	  prepStmt =con.prepareStatement(INSERT_SQL); 
	    	  prepStmt1 = con.prepareStatement("select id from forum_authority order by id desc limit 0,1");
	          rs = prepStmt1.executeQuery();
	          while(rs.next()) {
	              authority.setId((rs.getInt(1))); 
	          }
	    	  prepStmt.setInt(1,authority.getId()+1);//id
	    	  System.out.println(authority.getId());
	    	  prepStmt.setString(2,newAuthority.getName());//name
	    	  System.out.println(newAuthority.getName());
	          prepStmt.executeUpdate();
	      } catch(Exception e){
	    	  e.printStackTrace();
	      } finally{
	    	  DBConnect.closeDB(con, prepStmt, rs);
	      }
	     return newAuthority;
	}

	@Override
	public Authority find(Authority newAuthority) throws Exception {
		try {
	        con=DBConnect.getDBconnection();
            prepStmt = con.prepareStatement(SELECT_SQL);
            prepStmt.setString(1,newAuthority.getName());
            System.out.println("find name:"+newAuthority.getName());
            rs = prepStmt.executeQuery();
            if (rs.next()){
            	authority.setId(rs.getInt(1));
            	authority.setName(rs.getString(2)); 
            	return authority;
           }
      } catch (Exception e) {
    	  e.printStackTrace();
      } finally {
    	     DBConnect.closeDB(con, prepStmt, rs);
      }
		return null;
	}

	@Override
	public List<Authority> findAll() throws Exception {
		List<Authority> listAuthority = new ArrayList<Authority>();
	    con=DBConnect.getDBconnection();  
	    prepStmt = con.prepareStatement("select * from forum_authority");
        rs = prepStmt.executeQuery();
        while(rs.next()) {
        	authority.setId(rs.getInt(1));
            authority.setName(rs.getString(2)); 
            listAuthority.add(authority);
        }
        DBConnect.closeDB(con, prepStmt, rs); 
        return listAuthority;
	}

	@Override
	public void update(Authority newAuthority) throws Exception {
		try {
	    	con=DBConnect.getDBconnection();
			prepStmt = con.prepareStatement(UPDATE_SQL);
	    	prepStmt.setString(1,newAuthority.getName());
	    	prepStmt.setInt(2,newAuthority.getId());
	    	int rowCount=prepStmt.executeUpdate();
            if (rowCount == 0) {
                   throw new Exception("Update Error:User Id:" + newAuthority.getName());
            }
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	 DBConnect.closeDB(con, prepStmt, rs);
        }
	}

	@Override
	public void delete(Authority authority) throws Exception {
		try {
	    	con=DBConnect.getDBconnection();
	    	prepStmt = con.prepareStatement(DELETE_SQL);
	        prepStmt.setString(1,authority.getName());
	        prepStmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    } finally{
	    	 DBConnect.closeDB(con, prepStmt, rs);
	    }
	}

}
