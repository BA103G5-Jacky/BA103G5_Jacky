package com.timeline.model;

import java.util.*;

public interface TimelineDAO_interface {
	
	public void insert(TimelineVO timelineVO);
	public void update(TimelineVO timelineVO);
	public void delete(String noteNo);
	public List<TimelineVO> getAll();
	public TimelineVO findByPrimaryKey(String noteNo);

}
