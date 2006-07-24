package com.topcoder.web.tc.controller.request.membercontact;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.MemberContactBlackListDAO;
import com.topcoder.web.common.dao.MemberContactMessageDAO;
import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * Processor for member contact black list.
 * If parameters "b" and/or "ub" are found, those users are blocked/unblocked.
 * Then, a list of recent users and blocked users are built for the jsp page to display.  
 * 
 * @author cucu
 *
 */
public class BlackList extends HibernateProcessor {
    
    public static String BLOCK = "b";
    public static String UNBLOCK = "ub";
    public static String SAVED = "saved";
    public static String RECENT_USERS = "recentUsers";
    public static String BLOCKED_USERS = "blockedUsers";

    protected void dbProcessing() throws Exception {
    	// The user must be logged to access this page.
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        //  The user must be a rated member to access this page.
		if (!Helper.isRated(getUser().getId())) {
			getRequest().setAttribute(Helper.NOT_RATED, String.valueOf(false));
	        setNextPage(Constants.MEMBER_CONTACT);
	        setIsNextPageInContext(true);
	        return;
		}

        User user = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        // save data if necessary
        updateBlocked(user);
        
        // recentUsers are the users who sent messages to that user and/or where previously in the black list
        // but aren't thre now.
    	Set recentUsers = new TreeSet(new UserHandleComparator());

        MemberContactBlackListDAO blackListDAO = DAOUtil.getFactory().getMemberContactBlackListDAO();
        recentUsers.addAll(blackListDAO.getPreviouslyBlockedUsers(user.getId()));

    	MemberContactMessageDAO msgDAO = DAOUtil.getFactory().getMemberContactMessageDAO();
    	recentUsers.addAll(msgDAO.getAllSendersToUser(user.getId()));


    	List blockedUsers = blackListDAO.getBlockedUsers(user.getId());
    	
    	recentUsers.removeAll(blockedUsers);
    	getRequest().setAttribute(RECENT_USERS, new ArrayList(recentUsers));
    	getRequest().setAttribute(BLOCKED_USERS, blockedUsers);
    	
        setNextPage(Constants.BLACK_LIST);
        setIsNextPageInContext(true);        
    }

    /**
     * Updates the blocked list of the user, blocking the parameters "b" and 
     * unblocking the parameters "ub".
     * 
     * @param user owner of the list.
     */
    private void updateBlocked(User user) {
        String block[] = getRequest().getParameterValues(BLOCK);
        String unblock[] = getRequest().getParameterValues(UNBLOCK);

        if (block == null && unblock == null) {
        	return;
        }
        MemberContactBlackListDAO memberContactDAO = DAOUtil.getFactory().getMemberContactBlackListDAO();
        
        // Block users
        if (block != null) {
			for (int i = 0; i < block.length; i++) { 
				User blockedUser = DAOUtil.getFactory().getUserDAO().find(new Long(block[i]));
				MemberContactBlackList m = memberContactDAO.findOrCreate(user, blockedUser);
				m.setBlocked(true);
				memberContactDAO.saveOrUpdate(m);
			}
        }
        
        // Unblock users
        if (unblock != null) {
			for (int i = 0; i < unblock.length; i++) {
				User blockedUser = DAOUtil.getFactory().getUserDAO().find(new Long(unblock[i]));
				MemberContactBlackList m = memberContactDAO.findOrCreate(user, blockedUser);
				m.setBlocked(false);
				memberContactDAO.saveOrUpdate(m);
			}
        }
        
        // attribute used to display a message confirming that data was saved.
        getRequest().setAttribute(SAVED, String.valueOf(true));

        markForCommit();
        
        HibernateUtils.getSession().flush();
    }
    
	private static class UserHandleComparator implements Comparator {

		public int compare(Object arg0, Object arg1) {			
			return ((User) arg0).getHandle().compareToIgnoreCase(((User) arg1).getHandle());
		}
		
	}

}
