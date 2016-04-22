package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.forum.db.DBConnect;
import com.forum.model.User;
import com.forum.util.Encipher;

public class UserDaoImp implements UserDao {
	
	private User user;
	public void setUser(User user) {
		this.user = user;
	}
	
	private Connection con=null;
	private PreparedStatement prepStmt=null;
	private PreparedStatement prepStmt1=null;
	private ResultSet rs=null;

	//"id,name,password,email";
	protected static String INSERT_SQL="insert into forum_user values(?,?,?,?)";
	protected static String SELECT_SQL="select * from forum_user where email=? and password=?";
	protected static String UPDATE_SQL="update forum_user set name=?,password=?,email=?";
	protected static String UPDATE1_SQL="update forum_user set authority_id=? where id=?";
	protected static String DELETE_SQL="delete from forum_user where id=?";
	
	@Override
	public User create(User newUser) throws Exception {
		try{
	    	  con=DBConnect.getDBconnection();
	    	  prepStmt =con.prepareStatement(INSERT_SQL); 
	    	  prepStmt1 = con.prepareStatement("select id from forum_user order by id desc limit 0,1");
	          rs = prepStmt1.executeQuery();
	          while(rs.next()) {
	              user.setId((rs.getInt(1))); 
	          }
	    	  prepStmt.setInt(1,user.getId()+1);//uesr_id
	    	  System.out.println(user.getId());
	    	  prepStmt.setString(2,newUser.getName());//user_name
	    	  System.out.println(newUser.getName());
	    	  prepStmt.setString(3,Encipher.MD5(newUser.getPassword()));//user_password
	    	  System.out.println(newUser.getPassword());
	    	  prepStmt.setString(4,newUser.getEmail());//email
	          prepStmt.executeUpdate();
	      } catch(Exception e){
	    	  e.printStackTrace();
	      } finally{
	    	  DBConnect.closeDB(con, prepStmt, rs);
	      }
	     return newUser;
	}

	@Override
	public void remove(User user) throws Exception {
		try {
	    	con=DBConnect.getDBconnection();
	    	prepStmt = con.prepareStatement(DELETE_SQL);
	        prepStmt.setInt(1,user.getId());
	        prepStmt.executeUpdate();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    } finally{
	    	 DBConnect.closeDB(con, prepStmt, rs);
	    }
	}

	@Override
	public boolean find(User newUser) throws Exception {
	    try {
	        con=DBConnect.getDBconnection();
            prepStmt = con.prepareStatement(SELECT_SQL);
            prepStmt.setString(1,newUser.getEmail());
            prepStmt.setString(2,Encipher.MD5(newUser.getPassword()));
            rs = prepStmt.executeQuery();
            if (rs.next()){
            	/*user.setId(rs.getInt(1));
            	user.setName(rs.getString(2)); 
            	user.setPassword(rs.getString(3));
            	user.setEmail(rs.getString(4));*/
            	return true;
           }
      } catch (Exception e) {
    	  e.printStackTrace();
      } finally {
    	     DBConnect.closeDB(con, prepStmt, rs);
      }
		return false;
	}

	@Override
	public List<User> findAll() throws Exception {
	    List<User> listUser = new ArrayList<User>();
	    con=DBConnect.getDBconnection();  
	    prepStmt = con.prepareStatement("select * from forum_user");
        rs = prepStmt.executeQuery();
        while(rs.next()) {
        	user.setId(rs.getInt(1));
            user.setName(rs.getString(2)); 
            user.setPassword(rs.getString(3));
            user.setEmail(rs.getString(4));
            listUser.add(user);
        }
        DBConnect.closeDB(con, prepStmt, rs); 
        return listUser;
	}

	@Override
	public void update(User newUser) throws Exception {
		try {
	    	con=DBConnect.getDBconnection();
			prepStmt = con.prepareStatement(UPDATE_SQL);
            prepStmt.setString(1,newUser.getName());
	    	prepStmt.setString(2,newUser.getPassword());
	    	prepStmt.setString(3,newUser.getEmail());
	    	int rowCount=prepStmt.executeUpdate();
            if (rowCount == 0) {
                   throw new Exception("Update Error:User Id:" + newUser.getName());
            }
        } catch (Exception e) {
        	e.printStackTrace();
        } finally {
        	 DBConnect.closeDB(con, prepStmt, rs);
        }
	}

	@Override
	public int getPageCount() throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> listUser(int pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
