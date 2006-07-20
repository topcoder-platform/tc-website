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

public class BlackList extends HibernateProcessor {
    
    public static String BLOCK = "b";
    public static String UNBLOCK = "ub";
    public static String SAVED = "saved";

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User user = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        updateBlocked(user);
        
    	Set recentUsers = new TreeSet(new UserHandleComparator());

        MemberContactBlackListDAO blackListDAO = DAOUtil.getFactory().getMemberContactBlackListDAO();
        recentUsers.addAll(blackListDAO.getPreviouslyBlockedUsers(user.getId()));

    	MemberContactMessageDAO msgDAO = DAOUtil.getFactory().getMemberContactMessageDAO();
    	recentUsers.addAll(msgDAO.getAllSendersToUser(user.getId()));


    	List blockedUsers = blackListDAO.getBlockedUsers(user.getId());
    	
    	recentUsers.removeAll(blockedUsers);
    	getRequest().setAttribute("recentUsers", new ArrayList(recentUsers));
    	getRequest().setAttribute("blockedUsers", blockedUsers);
    	
        setNextPage(Constants.BLACK_LIST);
        setIsNextPageInContext(true);        
    }

    private void updateBlocked(User user) {
        String block[] = getRequest().getParameterValues(BLOCK);
        String unblock[] = getRequest().getParameterValues(UNBLOCK);

        if (block == null && unblock == null) {
        	return;
        }
        MemberContactBlackListDAO memberContactDAO = DAOUtil.getFactory().getMemberContactBlackListDAO();
        
        if (block != null) {
			for (int i = 0; i < block.length; i++) { 
				User blockedUser = DAOUtil.getFactory().getUserDAO().find(new Long(block[i]));
				MemberContactBlackList m = memberContactDAO.findOrCreate(user, blockedUser);
				m.setBlocked(true);
				memberContactDAO.saveOrUpdate(m);
			}
        }
        
        if (unblock != null) {
			for (int i = 0; i < unblock.length; i++) {
				User blockedUser = DAOUtil.getFactory().getUserDAO().find(new Long(unblock[i]));
				MemberContactBlackList m = memberContactDAO.findOrCreate(user, blockedUser);
				m.setBlocked(false);
				memberContactDAO.saveOrUpdate(m);
			}
        }
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
