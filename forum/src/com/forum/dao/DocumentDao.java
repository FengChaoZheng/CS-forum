package com.forum.dao;

import java.util.List;

import com.forum.model.Document;

public interface DocumentDao {
	
	public abstract Document upload(Document document) throws Exception;
	public abstract void delete(Document document) throws Exception;
	public abstract Document find(Document document) throws Exception;
	public int getPageCount() throws Exception;
	public List<Document> listDocument(int pageNo) throws Exception;

}
