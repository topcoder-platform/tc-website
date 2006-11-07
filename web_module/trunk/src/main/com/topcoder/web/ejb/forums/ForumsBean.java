package com.topcoder.web.ejb.forums;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.forums.model.TCAuthToken;
import com.topcoder.shared.util.DBMS;

import com.jivesoftware.forum.ForumFactory;
import com.jivesoftware.forum.ForumCategory;
import com.jivesoftware.forum.Forum;
import com.jivesoftware.forum.ForumCategoryNotFoundException;
import com.jivesoftware.base.UnauthorizedException;
import com.jivesoftware.base.AuthFactory;

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
    
    // Software Forums
    //public Forum getComponentCategory(long compVersionID, int forumType) throws ForumCategoryNotFoundException {
    	// find a way to efficiently map a component to its category - retrieve from DB
    	//forumFactory.getForumCategory(378).getCategories()
    //}
    
    // test
    public int numSoftwareCategories() throws ForumCategoryNotFoundException {
    	return forumFactory.getForumCategory(378).getCategoryCount();
    }
    
    public void addSoftwareCategory() throws ForumCategoryNotFoundException, UnauthorizedException {
    	forumFactory.getForumCategory(378).createCategory("Test Category", "This is a test.");
    }
    // Software Forums - End
}
