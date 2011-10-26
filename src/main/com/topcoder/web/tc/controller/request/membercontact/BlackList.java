package com.topcoder.web.tc.controller.request.membercontact;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.MemberContactBlackListDAO;
import com.topcoder.web.common.dao.MemberContactMessageDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * Processor for member contact black list.
 * A list of recent users and blocked users are built for the jsp page to display.
 *
 * @author cucu
 *
 */
public class BlackList extends ShortHibernateProcessor {

    public static String SAVED = "saved";
    public static String RECENT_USERS = "recentUsers";
    public static String BLOCKED_USERS = "blockedUsers";

    protected void dbProcessing() throws Exception {
        // The user must be logged to access this page.
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User user = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        // recentUsers are the users who sent messages to that user and/or where previously in the black list
        // but aren't there now.
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


    private static class UserHandleComparator implements Comparator {

        public int compare(Object arg0, Object arg1) {
            return ((User) arg0).getHandle().compareToIgnoreCase(((User) arg1).getHandle());
        }

    }

}
