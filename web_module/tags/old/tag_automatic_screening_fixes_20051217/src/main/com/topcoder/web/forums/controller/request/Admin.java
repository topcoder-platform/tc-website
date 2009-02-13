/*
 * Created on Aug 9, 2005
 */
package com.topcoder.web.forums.controller.request;

import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.PermissionsManager;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.ForumMessage;
import com.jivesoftware.forum.ForumMessageIterator;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.forums.Forums;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.common.web.data.Round;

import java.util.*;

import javax.naming.InitialContext;

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
     
        try {
            PermissionsManager permManager = forumFactory.getPermissionsManager();
        } catch (UnauthorizedException uae) {
            setNextPage("?module=ForumList");
            setIsNextPageInContext(false);
            return;
        }
        
        log.info(user.getUsername() + " has accessed the admin tool.");
        
        ArrayList roundList = getRoundList();
        
        // process command
        String command = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ADMIN_COMMAND));
        String match = StringUtils.checkNull(getRequest().getParameter(ForumConstants.ADMIN_MATCH));
        if (command.equals(ForumConstants.ADMIN_COMMAND_CREATE_FORUMS_ALGO)) {
            ForumCategory algoCategory = forumFactory.getForumCategory(14);
            if (algoCategory.getForumCount() < 20) {
                for (int i=roundList.size()-1; i>=0; i--) {
                   String roundName = ((Round)roundList.get(i)).getRoundName();
                   if (roundName.indexOf("Sponsor") == -1) {
                       forumFactory.createForum(roundName, "", algoCategory);
                   }
                }
            }
        } else if (command.equals(ForumConstants.ADMIN_COMMAND_DELETE_FORUMS_ALGO)) {
            ForumCategory algoCategory = forumFactory.getForumCategory(14);
            Iterator itForums = algoCategory.getForums();
            while (itForums.hasNext()) {
                Forum forum = (Forum)itForums.next();
                if (forum.getThreadCount() == 0) {
                    algoCategory.deleteForum(forum);
                }
            }
        } else if (command.equals("Create forum from EJB") && !match.equals("")) {
            InitialContext ctx = TCContext.getInitial();
            Forums forums = (Forums)createEJB(ctx, Forums.class);
            int matchID = Integer.parseInt(match);
            forums.createMatchForum(matchID);
        }
        else if (command.equals(ForumConstants.ADMIN_COMMAND_HTML_ESCAPE)) {
            log.info(user.getUsername() + " running command: " + command);
            escapeHTML(); 
        } /* 
        else if (command.equals("Add test forums")) {
            for (int i=0; i<50; i++) {
                com.jivesoftware.forum.ForumCategory fc = forumFactory.getForumCategory(8);
                forumFactory.createForum("Test Forum "+fc.getForumCount(), 
                        "Description for Test Forum "+fc.getForumCount(), fc);
            }
        } else if (command.equals("Delete test forums")) {
            com.jivesoftware.forum.ForumCategory fc = forumFactory.getForumCategory(8);
            Iterator it = fc.getForums();
            while (it.hasNext()) {
                Forum f = (Forum)it.next();
                if (f.getName().startsWith("Test Forum")) {
                    fc.deleteForum(f);
                }
            }
        }*/
        getRequest().setAttribute("roundList", roundList);
        getRequest().setAttribute("forumFactory", forumFactory);

        setNextPage("/admin.jsp");
        setIsNextPageInContext(true);
    }
    
    private ArrayList getRoundList() throws Exception {
        Request r = new Request();
        r.setContentHandle("Rounds_By_Date_short_name");
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess(DBMS.DW_DATASOURCE_NAME).getData(r).get("Rounds_By_Date_short_name");
        ArrayList roundList = new ArrayList();
        
        for (int i=0; i<rsc.size(); i++) {
            Round round = new Round(rsc.getIntItem(i, "contest_id"));
            round.setRoundId(rsc.getIntItem(i, "round_id"));
            round.setRoundName(rsc.getStringItem(i, "short_name"));
            roundList.add(round);
        }     
        return roundList;
    }
    
    // In <pre></pre> blocks in Round Table posts before the launch of Jive 4.2.1 (7/17/05), 
    // replaces certain characters with their HTML escape codes.  
    private void escapeHTML() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(2005,7,17);
        try {
            Iterator itForums = forumFactory.getForumCategory(13).getForums();
            while (itForums.hasNext()) {
                Forum f = (Forum)itForums.next();
                Date forumModDate = f.getModificationDate();
                if ("true".equals(f.getProperty("Escape HTML"))) {
                    log.info(user.getUsername() + " running escapeHTML() on forum: " + f.getName());
                    ForumMessageIterator itMessages = f.getMessages();
                    while (itMessages.hasNext()) {
                        ForumMessage m = (ForumMessage)itMessages.next();
                        if (m.getCreationDate().before(calendar.getTime())) {  
                            Date msgModDate = m.getModificationDate();
                            Date threadModDate = m.getForumThread().getModificationDate();
                            m.setBody(parse(m.getUnfilteredBody()));
                            m.setModificationDate(msgModDate);
                            m.getForumThread().setModificationDate(threadModDate);
                        }
                    }
                    f.setModificationDate(forumModDate);
                    f.deleteProperty("Escape HTML");
                }
            }
        } catch (Exception e) {
            log.debug("escapeHTML() failed");
            return;
        } 
    }
    
    /*
    // Sets thread modification dates to their correct values.
    private void repair() {
        try {
            Calendar calendar = Calendar.getInstance();
            calendar.set(2005,7,17);
            Forum f = forumFactory.getForum(7167);
            com.jivesoftware.forum.ForumThreadIterator itThreads = f.getThreads();
            while (itThreads.hasNext()) {
                com.jivesoftware.forum.ForumThread t = (com.jivesoftware.forum.ForumThread)itThreads.next();
                if (t.getCreationDate().before(calendar.getTime())) {
                    Iterator itMessages = t.getMessages();
                    Date d = ((ForumMessage)itMessages.next()).getCreationDate();
                    while (itMessages.hasNext()) {
                        ForumMessage m = (ForumMessage)itMessages.next();
                        if (m.getCreationDate().after(d))
                            d = m.getCreationDate();
                        if (m.getCreationDate().before(calendar.getTime())) {
                            m.setModificationDate(m.getCreationDate());
                        }
                    }
                    t.setModificationDate(d);
                }
            }
        } catch (Exception e) {}
    }
    */
    
    private String parse(String s) {
        if (s == null) return null;
        //s = s.replaceAll("&", "&amp;");
        s = s.replaceAll("<", "&lt;"); 
        s = s.replaceAll(">", "&gt;");
        //s = s.replaceAll("\"", "&quot;");
        s = s.replaceAll("’", "'");
        s = s.replaceAll("&lt;[pP][rR][eE]&gt;", "<pre>");
        s = s.replaceAll("&lt;/[pP][rR][eE]&gt;", "</pre>");
        return s;
    }
}
