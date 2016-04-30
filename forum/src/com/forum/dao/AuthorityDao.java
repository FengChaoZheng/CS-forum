package com.forum.dao;

import java.util.List;

import com.forum.model.Authority;

public interface AuthorityDao {
	
	public abstract Authority create(Authority authority) throws Exception;
	public abstract Authority findId(Authority authority) throws Exception;
	public abstract Authority findName(Authority authority) throws Exception;
	public abstract void update(Authority authority) throws Exception;
	public abstract void delete(Authority authority) throws Exception;
	public abstract List<Authority> findAll() throws Exception;
}
