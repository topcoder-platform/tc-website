package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.ejb.userservices.UserServices;
import com.topcoder.web.ejb.userservices.UserServicesLocator;


/**
 * Contains helper methods for this package.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 21, 2006
 */
public class Helper {

    public static String NOT_RATED = "nr";
    public static String BANNED = "banned";

    /**
     * Returns whether a user is rated in any discipline.
     *
     * @param userId the user to check.
     * @return whether a user is rated in either algorithm or component competitions.
     * @throws Exception
     */
    public static boolean isRated(long userId) throws Exception {

        UserServices us = UserServicesLocator.getService();
        return us.isRated(userId);
    }

    /**
     * Returns whether a user is banned from sending Member Contact Messages.
     * In that case, he can't send messages anymore.
     *
     * @param userId the user to check.
     * @return whether a user is banned from sending Member Contact Messages.
     * @throws Exception
     */
    public static boolean isBanned(long userId) throws Exception {
        UserPreference up = DAOUtil.getFactory().getUserPreferenceDAO().find(
                new Long(userId), Preference.MEMBER_CONTACT_BANNED);

        if (up == null) {
            return false;
        }
        return "true".equals(up.getValue());

    }

}
