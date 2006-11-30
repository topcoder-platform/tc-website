/*
 * Created on May 6, 2005
 */
package com.topcoder.web.forums.model;

import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Pageable;

/**
 * @author mtong
 */
public class Paging implements Pageable {
	private int start = 0;
	private int totalItemCount;
	private ResultFilter resultFilter;
	
	public Paging(ResultFilter resultFilter, int itemCount) {
		initPagingFields(resultFilter, itemCount);
    }
    
    public int getStart() {
    	return start;
    }
    
    public ResultFilter getResultFilter() {
    	return resultFilter;
    }
    
    public int getTotalItemCount() {
    	return totalItemCount;
    }
    
    protected void initPagingFields(ResultFilter resultFilter, int itemCount) {
    	this.start = resultFilter.getStartIndex();
        this.resultFilter = resultFilter;
        this.totalItemCount = itemCount;
    }
}
