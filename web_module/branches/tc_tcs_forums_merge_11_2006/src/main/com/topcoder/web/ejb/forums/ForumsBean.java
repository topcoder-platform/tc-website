package com.topcoder.web.ejb.forums;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.forums.ForumConstants;
import com.topcoder.web.forums.model.TCAuthToken;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCResourceBundle;

import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.base.GroupNotFoundException;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserNotFoundException;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * This class handles interaction with the Jive database.
 *
 * @author mtong
 */

public class ForumsBean extends BaseEJB {

    private static Logger log = Logger.getLogger(ForumsBean.class);
    private static ForumFactory forumFactory = ForumFactory.getInstance(new TCAuthToken(100129));
    private static TCResourceBundle bundle = new TCResourceBundle("TC");
    private static final long TCS_FORUMS_ROOT_CATEGORY_ID = 
    	Long.parseLong(bundle.getProperty("tcs_forums_root_category_id"));

    // Creates a new forum in the "Algorithm Matches" category of the forums for the given round.
    // Also sets the forum_id field of the corresponding row in DW.round.
    public void createMatchForum(int roundID) {
        //String username = "Administrator";
        //String pwd = selectString("user",
        //        "password",
        //        new String[]{"handle"},
        //        new String[]{username},
        //        DBMS.OLTP_DATASOURCE_NAME);
        
        String roundName = selectString("round",
                "short_name",
                new String[]{"round_id"},
                new String[]{String.valueOf(roundID)},
                DBMS.OLTP_DATASOURCE_NAME);
        
        try {
            ForumFactory forumFactory = ForumFactory.getInstance(new TCAuthToken(100129));
            Forum forum = forumFactory.createForum(roundName, "", forumFactory.getForumCategory(14));
            
            this.update("round",
                        new String[]{"forum_id"},
                        new String[]{String.valueOf(forum.getID())},
                        new String[]{"round_id"},
                        new String[]{String.valueOf(roundID)},
                        DBMS.OLTP_DATASOURCE_NAME);
        } catch (UnauthorizedException uae) {
            uae.printStackTrace();
        } catch (ForumCategoryNotFoundException fe) {
            fe.printStackTrace();
        }
    }
    
    public String[] getCategoryNames() {
        ForumFactory forumFactory = ForumFactory.getInstance(AuthFactory.getAnonymousAuthToken());
        Iterator it = forumFactory.getRootForumCategory().getCategories();
        ArrayList listNames = new ArrayList();
        while (it.hasNext()) {
            listNames.add(((ForumCategory)it.next()).getName());
        }
        return (String[])listNames.toArray(new String[listNames.size()]);
    }
    
    public int getThreadMessageCount(int threadID) {
    	return this.selectInt("jivemessage",
    			"count(*)",
    			new String[]{"threadid"}, 
    			new String[]{String.valueOf(threadID)}, 
    			DBMS.FORUMS_DATASOURCE_NAME).intValue();
    }
    
    public void assignRole(long userID, long groupID) throws UserNotFoundException, UnauthorizedException, GroupNotFoundException {
    	User user = forumFactory.getUserManager().getUser(userID);
    	com.jivesoftware.base.Group group = forumFactory.getGroupManager().getGroup(groupID);
    	if (group.getName().toLowerCase().indexOf("admin") != -1) {		// cannot add to administrative groups
    		group.addMember(user);
    	}
    }
    
    public void removeRole(long userID, long groupID) throws UserNotFoundException, UnauthorizedException, GroupNotFoundException {
    	User user = forumFactory.getUserManager().getUser(userID);
    	com.jivesoftware.base.Group group = forumFactory.getGroupManager().getGroup(groupID);
    	if (group.getName().toLowerCase().indexOf("admin") != -1) {		// cannot remove admins
    		group.removeMember(user);
    	}
    }
    
    // Software Forums
    //public Forum getComponentCategory(long compVersionID, int forumType) throws ForumCategoryNotFoundException {
    	// find a way to efficiently map a component to its category - retrieve from DB
    	//forumFactory.getForumCategory(378).getCategories()
    //}
    
    public Iterator getSoftwareCategories() throws ForumCategoryNotFoundException {
    	return forumFactory.getForumCategory(TCS_FORUMS_ROOT_CATEGORY_ID).getCategories();
    }
    
    public Iterator getSoftwareRoles(long userID) throws UserNotFoundException {
    	User user = forumFactory.getUserManager().getUser(userID);
    	Iterator itGroups = forumFactory.getGroupManager().getUserGroups(user);
    	ArrayList softwareGroupList = new ArrayList();
    	while (itGroups.hasNext()) {
    		com.jivesoftware.base.Group group = (com.jivesoftware.base.Group)itGroups.next();
    		if (group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX) ||
    			group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX) ||
    			group.getName().equals(ForumConstants.GROUP_SOFTWARE_ADMINS)) {
    			softwareGroupList.add(group);
    		}
    	}
    	return softwareGroupList.iterator();
    }
    
    public Iterator getAllSoftwareRoles() throws UserNotFoundException {
    	Iterator itGroups = forumFactory.getGroupManager().getGroups();
    	ArrayList softwareGroupList = new ArrayList();
    	while (itGroups.hasNext()) {
    		com.jivesoftware.base.Group group = (com.jivesoftware.base.Group)itGroups.next();
    		if (group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_MODERATORS_PREFIX) ||
    			group.getName().startsWith(ForumConstants.GROUP_SOFTWARE_USERS_PREFIX) ||
    			group.getName().equals(ForumConstants.GROUP_SOFTWARE_ADMINS)) {
    			softwareGroupList.add(group);
    		}
    	}
    	return softwareGroupList.iterator();
    }
    // Software Forums - End
}
