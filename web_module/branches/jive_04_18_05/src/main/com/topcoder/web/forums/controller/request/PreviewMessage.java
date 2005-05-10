/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.topcoder.web.forums.ForumsProcessor;

/**
 * @author mtong
 */
public class PreviewMessage extends ForumsProcessor {

	
	protected void businessProcessing() throws Exception {

		
		setNextPage("/viewThread.jsp");
		setIsNextPageInContext(true);
	}
}