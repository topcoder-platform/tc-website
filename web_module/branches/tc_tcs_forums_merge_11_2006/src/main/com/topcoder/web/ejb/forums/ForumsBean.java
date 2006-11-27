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
import com.jivesoftware.forum.ResultFilter;
import com.jivesoftware.base.Group;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.AuthFactory;
import com.jivesoftware.base.User;
import com.jivesoftware.base.UserNotFoundException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;

/**
 * This class handles interaction with the Jive database.
 * Please update the code if you know of a way to use Jive objects remotely, instead of using primitives. 
 * Keep in mind that most Jive proxy objects are not serializable.
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
    
    public void assignRole(long userID, long groupID) {
    	try {
    		log.info("assignRole called: userID = " + userID + " | groupID = " + groupID);
	    	User user = forumFactory.getUserManager().getUser(userID);
	    	com.jivesoftware.base.Group group = forumFactory.getGroupManager().getGroup(groupID);
	    	if (group.getName().toLowerCase().indexOf("admin") != -1) {		// cannot add to administrative groups
	    		group.addMember(user);
	    	}
	    	log.info("assignRole complete");
    	} catch (Exception e) {
    		log.info("*** error in assigning role: " + e);
    	}
    }
    
    public void removeRole(long userID, long groupID) {
    	try {
    		log.info("removeRole called: userID = " + userID + " | groupID = " + groupID);
	    	User user = forumFactory.getUserManager().getUser(userID);
	    	com.jivesoftware.base.Group group = forumFactory.getGroupManager().getGroup(groupID);
	    	if (group.getName().toLowerCase().indexOf("admin") != -1) {		// cannot remove admins
	    		group.removeMember(user);
	    	}
	    	log.info("removeRole complete");
    	} catch (Exception e) {
    		log.info("*** error in removing role: " + e);
    	}
    }
    
    // Software Forums
    //public Forum getComponentCategory(long compVersionID, int forumType) throws ForumCategoryNotFoundException {
    	// find a way to efficiently map a component to its category - retrieve from DB
    	//forumFactory.getForumCategory(378).getCategories()
    //}
    
    public String[][] getSoftwareCategoriesData() {
    	try {
        	String[][] softwareCategoriesData = new String[forumFactory.getForumCategory(TCS_FORUMS_ROOT_CATEGORY_ID).getCategoryCount()][2];
    		Iterator itCategories = forumFactory.getForumCategory(TCS_FORUMS_ROOT_CATEGORY_ID).getCategories();
    		int row = 0;
    		while (itCategories.hasNext()) {
    			ForumCategory category = (ForumCategory)itCategories.next();
    			softwareCategoriesData[row][0] = String.valueOf(category.getID());
    			softwareCategoriesData[row][1] = String.valueOf(category.getName());
    			row++;
    		}
    		return softwareCategoriesData;
    	} catch (ForumCategoryNotFoundException fe) {
    		log.info("*** error in obtaining software categories: " + fe);
    		return null;
    	}
    }
    
    public String[][] getSoftwareRolesData(long userID) {
    	User user = null;
    	try {
    		user = forumFactory.getUserManager().getUser(userID);
    	} catch (UserNotFoundException ue) {
    		log.info("*** error in obtaining software roles: " + ue);
    		return null;
    	}
    	
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
    	
    	Collections.sort(softwareGroupList, 
    			new JiveGroupComparator("description", ResultFilter.ASCENDING));
    	
    	String[][] softwareGroupData = new String[softwareGroupList.size()][3];
    	for (int i=0; i<softwareGroupData.length; i++) {
    		Group group = (Group)softwareGroupList.get(i);
    		softwareGroupData[i][0] = String.valueOf(group.getID());
    		softwareGroupData[i][1] = String.valueOf(group.getName());
    		softwareGroupData[i][2] = String.valueOf(group.getDescription());
    	}
    	return softwareGroupData;
    }
    
    public String[][] getAllSoftwareRolesData() {
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
    	
    	Collections.sort(softwareGroupList, 
    			new JiveGroupComparator("description", ResultFilter.ASCENDING));
    	
    	String[][] softwareGroupData = new String[softwareGroupList.size()][3];
    	for (int i=0; i<softwareGroupData.length; i++) {
    		Group group = (Group)softwareGroupList.get(i);
    		softwareGroupData[i][0] = String.valueOf(group.getID());
    		softwareGroupData[i][1] = String.valueOf(group.getName());
    		softwareGroupData[i][2] = String.valueOf(group.getDescription());
    	}
    	return softwareGroupData;
    }
    // Software Forums - End
}

class JiveGroupComparator implements Comparator {
	private String sortField;
	private int sortOrder;
	
	public JiveGroupComparator(String sortField, int sortOrder) {
		this.sortField = sortField;
		this.sortOrder = sortOrder;
	}
	
	public final int compare(Object o1, Object o2) {
		Group g1 = (Group)o1;
		Group g2 = (Group)o2;
		
		int retVal = 0;
		if (sortField.equals("id")) {
			retVal = String.valueOf(g1.getID()).compareTo(String.valueOf(g2.getID()));
		} else if (sortField.equals("name")) {
			retVal = g1.getName().compareTo(g2.getName());
		} else if (sortField.equals("description")) {
			retVal = g1.getDescription().compareTo(g2.getDescription());
		}
		if (sortOrder == ResultFilter.DESCENDING) {
			retVal = -retVal;
		}
		return retVal;
    }
}
