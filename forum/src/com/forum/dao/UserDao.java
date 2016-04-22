package com.forum.dao;

import java.sql.SQLException;
import java.util.List;

import com.forum.model.User;

public interface UserDao {
	
	public abstract User create(User user) throws Exception;//添加记录的方法
	public abstract void remove(User user) throws Exception; //删除记录的方法
	public abstract boolean find(User user)throws Exception; 
	/*public abstract User find(User user)throws Exception;*/ 
	public abstract List<User> findAll() throws Exception;  //列出全部记录的方法
	public abstract void update(User user) throws Exception;  //修改记录的方法
	public int getPageCount() throws SQLException;
	public List<User> listUser(int pageNo) throws SQLException;

}
