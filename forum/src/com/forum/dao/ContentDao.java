package com.forum.dao;

import java.util.List;

import com.forum.model.Content;

public interface ContentDao {
	
	public abstract Content create(Content content) throws Exception;
	public abstract Content find(Content content) throws Exception;
	public abstract void delete(Content content) throws Exception;
	public abstract int getPageCount(int value) throws Exception;
	public abstract int getPageCount(String value) throws Exception;
	public abstract List<Content> listContent(int pageNo,int sectionId) throws Exception;
	public abstract List<Content> listContent(int pageNo,String content) throws Exception;

}
