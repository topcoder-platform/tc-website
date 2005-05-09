/*
 * Created on Apr 29, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import com.topcoder.web.common.BaseProcessor;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class SubmitMessage extends BaseProcessor {
	
	protected void businessProcessing() throws Exception {
		
		setNextPage("/viewThread.jsp");
		setIsNextPageInContext(true);
	}
}