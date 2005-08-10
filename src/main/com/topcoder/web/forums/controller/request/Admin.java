/*
 * Created on Aug 9, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.PermissionsManager;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumMessageIterator;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.forums.ForumConstants;

/**
 * @author mtong
 * 
 * Administrative tool providing utilities not included in Jive.
 */
public class Admin extends ForumsProcessor {
    protected static Logger log = Logger.getLogger(BaseProcessor.class);
    
    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        if (isGuest() ) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
     
        try {
            PermissionsManager permManager = forumFactory.getPermissionsManager();
        } catch (UnauthorizedException uae) {
            setNextPage("?module=ForumList");
            setIsNextPageInContext(false);
            return;
        }
        
        log.info(user.getUsername() + " has accessed the admin tool.");
        
        // process command
        String command = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ADMIN_COMMAND));
        if (command.equals(ForumConstants.ADMIN_COMMAND_HTML_ESCAPE)) {
            log.info(user.getUsername() + " running command: " + command);
            escapeHTML();
        }

        setNextPage("/admin.jsp");
        setIsNextPageInContext(true);
    }
    
    // In <pre></pre> blocks in posts before the launch of Jive 4.2.1 (7/17/05), replaces certain 
    // characters with their HTML escape codes.  
    private void escapeHTML() {
        try {
            Forum f = forumFactory.getForum(440109);
            ForumMessageIterator it = f.getMessages();
            while (it.hasNext()) {
                ForumMessage m = (ForumMessage)it.next();
                m.setBody(parse(m.getUnfilteredBody()));
            }
        } catch (Exception e) {
            log.debug("escapeHTML() failed");
            return;
        } 
    }
    
    private String parse(String s) {
        if (s == null) return null;
        s = s.replaceAll("&", "&amp;");
        s = s.replaceAll("<", "&lt;"); 
        s = s.replaceAll(">", "&gt;");
        s = s.replaceAll("\"", "&quot;");
        s = s.replaceAll("’", "'");
        s = s.replaceAll("&lt;[pP][rR][eE]&gt;", "<pre>");
        s = s.replaceAll("&lt;/[pP][rR][eE]&gt;", "</pre>");
        return s;
    }
}
