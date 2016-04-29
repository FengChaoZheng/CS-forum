package com.forum.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.forum.database.DBConnect;
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

	//"id,name,sex,password,email,authority_id,last_login_ime";
	protected static String INSERT_SQL="insert into forum_user values(?,?,?,?,?,?,?)";
	protected static String SELECT_SQL="select * from forum_user where name=? and password=?";
	protected static String UPDATE_password_SQL="update forum_user set password=? where name=?";
	protected static String UPDATE_authority_SQL="update forum_user set authority_id=? where id=?";
	protected static String UPDATE_date_SQL="update forum_user set last_login_time=? where name=?";
	protected static String DELETE_SQL="delete from forum_user where name=?";
	
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
	    	  prepStmt.setInt(1,user.getId()+1);//id
	    	  System.out.println(user.getId());
	    	  prepStmt.setString(2,newUser.getName());//name
	    	  System.out.println(newUser.getName());
	    	  prepStmt.setString(3, newUser.getSex());//sex
	    	  prepStmt.setString(4,Encipher.MD5(newUser.getPassword()));//password
	    	  System.out.println(newUser.getPassword());
	    	  prepStmt.setString(5,newUser.getEmail());//email
	    	  prepStmt.setInt(6, newUser.getAuthority());//authority_id
	    	  prepStmt.setString(7, newUser.getLastTime());//last_login_time
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
	public User find(User newUser) throws Exception {
	    try {
	        con=DBConnect.getDBconnection();
            prepStmt = con.prepareStatement(SELECT_SQL);
            prepStmt.setString(1,newUser.getName());
            System.out.println("find name:"+newUser.getName());
            prepStmt.setString(2,Encipher.MD5(newUser.getPassword()));
            System.out.println("find pwd:"+newUser.getPassword());
            rs = prepStmt.executeQuery();
            if (rs.next()){
            	user.setId(rs.getInt(1));
            	user.setName(rs.getString(2)); 
            	user.setSex(rs.getString(3));
            	user.setPassword(rs.getString(4));
            	user.setEmail(rs.getString(5));
            	user.setAuthority(rs.getInt(6));
            	user.setLastTime(rs.getString(7));
            	return user;
           }
      } catch (Exception e) {
    	  e.printStackTrace();
      } finally {
    	     DBConnect.closeDB(con, prepStmt, rs);
      }
		return null;
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
	public void updatePassword(User newUser) throws Exception {
		try {
	    	con=DBConnect.getDBconnection();
			prepStmt = con.prepareStatement(UPDATE_password_SQL);
	    	prepStmt.setString(1,Encipher.MD5(newUser.getPassword()));
	    	prepStmt.setString(2,newUser.getName());
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
	public void updateDate(User newUser) throws Exception{
		try {
	    	con=DBConnect.getDBconnection();
			prepStmt = con.prepareStatement(UPDATE_date_SQL);
	    	prepStmt.setString(1,newUser.getLastTime());
	    	prepStmt.setString(2,newUser.getName());
	    	int rowCount=prepStmt.executeUpdate();
            if (rowCount == 0) {
                   throw new Exception("Update Error:User Name:" + newUser.getName());
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
