/*
 * Created on Aug 9, 2005
 */
package com.topcoder.web.forums.controller.request.dde;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.controller.ForumsUtil;

/**
 * @author mtong
 * 
 * Administrative tool providing utilities not included in Jive.
 */
public class Admin extends ForumsProcessor {
    protected static Logger log = Logger.getLogger(BaseProcessor.class);
    
    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
     
        if (!ForumsUtil.isAdmin(user)) {
            setNextPage("?module=ForumList");
            setIsNextPageInContext(false);
            return;
        }  
        
        log.info(user.getUsername() + " has accessed the admin tool.");
        
        // process command
        String command = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ADMIN_COMMAND));
        if (!command.equals("")) {
            log.info(user.getUsername() + " running command: " + command);   
        }
        // this is the only admin command option available in the TCS forums so far
        if (command.equals(ForumConstants.ADMIN_COMMAND_CREATE_FORUMS_COMPONENT)) {
        	String strComponentId = StringUtils.checkNull(getRequest().getParameter(ForumConstants.NEW_COMPONENT_ID));
            long componentId = Long.parseLong(strComponentId);
            ForumCreator adder = new ForumCreator(componentId);
            try {
            	long[] newCategoryIds = adder.addForums();
            	log.info("Successfully added forums for component id: " + componentId);
            	log.info("Jive ids are: " + newCategoryIds[0] + " and " + newCategoryIds[1]);
            	getRequest().setAttribute(ForumConstants.ADMIN_NEW_CATEGORY_IDS, newCategoryIds);
            } catch (Exception e) {
            	addError(ForumConstants.MESSAGE_SUBJECT, e);
            }
        }
        getRequest().setAttribute("forumFactory", forumFactory);

        setNextPage("/admin.jsp");
        setIsNextPageInContext(true);
    }
}