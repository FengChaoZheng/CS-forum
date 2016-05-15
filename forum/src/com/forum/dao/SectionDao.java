package com.forum.dao;

import java.util.List;

import com.forum.model.Section;

public interface SectionDao {
	
	public abstract Section create(Section section) throws Exception;
	public abstract int findId(String sectionName) throws Exception;
	public abstract String findName(int sectionId) throws Exception;
	public abstract void update(Section section) throws Exception;
	public abstract void delete(Section section) throws Exception;
	public abstract int getPageCount() throws Exception;
	public abstract List<Section> listSection(int pageNo) throws Exception;

}
