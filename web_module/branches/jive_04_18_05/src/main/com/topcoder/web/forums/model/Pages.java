/*
 * Created on May 6, 2005
 */
package com.topcoder.web.forums.model;

import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.forum.action.util.Pageable;

/**
 * @author mtong
 */
public class Pages implements Pageable {
	private int start = 0;
	private int totalItemCount;
	private ResultFilter resultFilter;
	
	public Pages(int itemCount) {
		initPagingFields(itemCount);
	}
	
	public Pages(int itemCount, int numResults) {
		initPagingFields(itemCount, numResults);
	}
	
	public int getStart() {
        return start;
	}
     
    public int getTotalItemCount() {
        return totalItemCount;
    }
    
    public ResultFilter getResultFilter() {
        return resultFilter;
    }
    
    protected void initPagingFields(int itemCount) {
    	initPagingFields(itemCount, 15);
    }
    
    protected void initPagingFields(int itemCount, int numResults) {
		start = 0;
        resultFilter = ResultFilter.createDefaultThreadFilter();
        resultFilter.setStartIndex(getStart());
        resultFilter.setNumResults(numResults);
        totalItemCount = itemCount;
    }
}
