/*
 * Created on Apr 29, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller.request;

import java.util.Iterator;

import com.topcoder.web.common.BaseProcessor;

import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.AuthToken;
import com.jivesoftware.forum.ForumFactory;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ForumList extends BaseProcessor {
	protected void businessProcessing() throws Exception {
		AuthToken authToken = AuthFactory.getAnonymousAuthToken();
		Iterator itForums = ForumFactory.getInstance(authToken).getForums();
		getRequest().setAttribute("forums", itForums);
		
		setNextPage("/main.jsp");
		setIsNextPageInContext(true);
	}
}