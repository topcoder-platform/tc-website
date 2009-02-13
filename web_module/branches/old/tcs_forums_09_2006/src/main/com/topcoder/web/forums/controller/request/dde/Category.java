/*
 * Created on Aug 23, 2005
 */
package com.topcoder.web.forums.controller.request.dde;

import com.jivesoftware.forum.ForumCategory;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 *
 * Displays a category's forums and subcategories.
 */
public class Category extends com.topcoder.web.forums.controller.request.Category {
	protected void businessProcessing() throws Exception {
        long categoryID = Long.parseLong(getRequest().getParameter(ForumConstants.CATEGORY_ID));
        ForumCategory forumCategory = forumFactory.getForumCategory(categoryID);
        
        // must be logged in to see developer forums
        if(ForumConstants.DEVELOPER_FORUM.equals(forumCategory.getProperty("forumType")) 
        		&& authToken.isAnonymous()) {
			log.debug("anon user on dev forums");
			getRequest().setAttribute("message", "You must login to view the specification forum");
			//TODO add redirect info
			setNextPage("/login.jsp");
			setIsNextPageInContext(true);
			return;
		}
        
        super.businessProcessing();
	}
}