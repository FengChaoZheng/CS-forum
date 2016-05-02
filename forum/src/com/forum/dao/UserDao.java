package com.forum.dao;

import java.util.List;

import com.forum.model.User;

public interface UserDao {
	
	public abstract User create(User user) throws Exception;//添加记录的方法
	public abstract void remove(User user) throws Exception; //删除记录的方法
	public abstract User find(User user) throws Exception; //查找所有用户
	public abstract void updatePassword(User user) throws Exception;  //修改密码的方法
	public abstract void updateDate(User user) throws Exception;  //修改最后登录时间的方法
	public abstract int getPageCount() throws Exception;
	public abstract List<User> listUser(int pageNo) throws Exception;
	public abstract User findAdmin(User user) throws Exception;//查找管理员

}
