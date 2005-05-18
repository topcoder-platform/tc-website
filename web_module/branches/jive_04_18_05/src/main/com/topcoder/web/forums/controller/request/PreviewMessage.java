/*
 * Created on Apr 29, 2005
 */
package com.topcoder.web.forums.controller.request;

/**
 * @author mtong
 */
public class PreviewMessage extends ForumsProcessor {
	protected void businessProcessing() throws Exception {
		super.businessProcessing();
		
		setNextPage("/preview.jsp");
		setIsNextPageInContext(true);
	}
}