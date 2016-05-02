package com.forum.dao;

import java.util.List;

import com.forum.model.Notice;

public interface NoticeDao {
	
	public abstract Notice create(Notice notice) throws Exception;
	public abstract Notice find(Notice notice) throws Exception;
	public abstract void delete(Notice notice) throws Exception;
	public abstract int getPageCount() throws Exception;
	public abstract List<Notice> listNotice(int pageNo) throws Exception;

}
