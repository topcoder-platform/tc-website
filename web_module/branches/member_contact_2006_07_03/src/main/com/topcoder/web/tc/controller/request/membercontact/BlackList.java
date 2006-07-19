package com.topcoder.web.tc.controller.request.membercontact;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.MemberContactBlackListDAO;
import com.topcoder.web.common.dao.MemberContactMessageDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

public class BlackList extends HibernateProcessor {
    
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User user = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

    	Set recentUsers = new TreeSet(new UserHandleComparator());

        MemberContactBlackListDAO blackListDAO = DAOUtil.getFactory().getMemberContactBlackListDAO();
        recentUsers.addAll(blackListDAO.getPreviouslyBlockedUsers(user.getId()));

    	MemberContactMessageDAO msgDAO = DAOUtil.getFactory().getMemberContactMessageDAO();
    	recentUsers.addAll(msgDAO.getAllSendersToUser(user.getId()));


    	List blockedUsers = blackListDAO.getBlockedUsers(user.getId());
    		
    	getRequest().setAttribute("recentUsers", new ArrayList(recentUsers));
    	getRequest().setAttribute("blockedUsers", blockedUsers);
    	
        setNextPage(Constants.BLACK_LIST);
        setIsNextPageInContext(true);        
    }

	private static class UserHandleComparator implements Comparator {

		public int compare(Object arg0, Object arg1) {			
			return ((User) arg0).getHandle().compareToIgnoreCase(((User) arg1).getHandle());
		}
		
	}

}
