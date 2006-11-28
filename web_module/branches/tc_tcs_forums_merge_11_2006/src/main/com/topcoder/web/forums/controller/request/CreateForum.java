/*
 * Created on Nov 27, 2006
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.Permissions;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumPermissions;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 *
 * Provides logic for creating a new forum within a category.
 */
public class CreateForum extends ForumsProcessor {

	protected void businessProcessing() throws Exception {
		super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        String postMode = getRequest().getParameter(ForumConstants.POST_MODE);  
        String status = StringUtils.checkNull(getRequest().getParameter(ForumConstants.STATUS));
        long categoryID = Long.parseLong(getRequest().getParameter(ForumConstants.CATEGORY_ID));
        ForumCategory category = forumFactory.getForumCategory(categoryID);
        
        // To create a new forum, the user must have moderator/admin permissions, and the category or an ancestor 
        // must have the PROPERTY_MODIFY_FORUMS permission set to true.
        boolean canModifyForums = false;
        ForumCategory tempCategory = category;
        while (tempCategory != null) {
        	if ("true".equals(tempCategory.getProperty(ForumConstants.PROPERTY_MODIFY_FORUMS))) {
        		canModifyForums = true;
        		break;
        	}
        	tempCategory = category.getParentCategory(); 
        }
        boolean isAuthorized = category.isAuthorized(Permissions.SYSTEM_ADMIN) || 
        		category.isAuthorized(ForumPermissions.FORUM_CATEGORY_ADMIN);
        if (!canModifyForums || !isAuthorized) {
            setNextPage(getSessionInfo().getServletPath() + "?module=Main");
            setIsNextPageInContext(false);
            return;
        }
        
        setDefault(ForumConstants.CATEGORY_ID, String.valueOf(categoryID));
        setDefault(ForumConstants.FORUM_ID, getRequest().getParameter(ForumConstants.FORUM_ID));
        setDefault(ForumConstants.POST_MODE, postMode);
        
        getRequest().setAttribute("forumCategory", category);
        getRequest().setAttribute("postMode", postMode);
        
        if (postMode.equals("Edit")) {
        	long forumID = Long.parseLong(getRequest().getParameter(ForumConstants.FORUM_ID));
            Forum forum = forumFactory.getForum(forumID);
            getRequest().setAttribute("forum", forum);
        }
        
        if (status.equals(ForumConstants.STATUS_CREATE)) {
        	String name = com.jivesoftware.util.StringUtils.escapeHTMLTags
            	(getRequest().getParameter(ForumConstants.FORUM_NAME).trim());
        	String description = com.jivesoftware.util.StringUtils.escapeHTMLTags
        		(getRequest().getParameter(ForumConstants.FORUM_DESCRIPTION).trim());
        	
        	if (name.trim().equals("")) {
    			addError(ForumConstants.FORUM_NAME, ForumConstants.ERR_EMPTY_FORUM_NAME);
    		}
        	if (name.length() > ForumConstants.FORUM_NAME_MAX_LENGTH) {
                addError(ForumConstants.FORUM_NAME, ForumConstants.ERR_LONG_FORUM_NAME);
            }
            if (description.length() > ForumConstants.FORUM_DESCRIPTION_MAX_LENGTH) {
            	addError(ForumConstants.FORUM_DESCRIPTION, ForumConstants.ERR_LONG_FORUM_DESCRIPTION);
            }
            
            if (hasErrors()) {
            	setDefault(ForumConstants.FORUM_NAME, name);
                setDefault(ForumConstants.FORUM_DESCRIPTION, description);
                
            	setNextPage("/createForum.jsp");
        		setIsNextPageInContext(true);
        		return;
            }
        	
            forumFactory.createForum(name, description, category);
            
        	setNextPage(getSessionInfo().getServletPath() + 
        			"?module=Category&" + ForumConstants.CATEGORY_ID + "=" + categoryID);
        	setIsNextPageInContext(false);
        } else {
        	setNextPage("/createForum.jsp");
    		setIsNextPageInContext(true);
        }
	}
}