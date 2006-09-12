package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.UserPreference;


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
     * Returns whether a user is rated in either algorithm or component competitions.
     *
     * @param userId the user to check.
     * @return whether a user is rated in either algorithm or component competitions.
     * @throws Exception
     */
    public static boolean isRated(long userId) throws Exception {
        Request r = new Request();
        r.setContentHandle("coder_all_ratings");

        r.setProperty("cr", userId + "");

        DataAccessInt dai = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);
        ResultSetContainer ratings = (ResultSetContainer) dai.getData(r).get("coder_all_ratings");

        return ratings.getIntItem(0, "algorithm_rating") > 0 ||
                ratings.getIntItem(0, "design_rating") > 0 ||
                ratings.getIntItem(0, "development_rating") > 0 ||
                ratings.getIntItem(0, "hs_algorithm_rating") > 0;
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
                userId, Preference.MEMBER_CONTACT_BANNED);
        
        if (up == null) {
        	return false;
        }
        return "true".equals(up.getValue());
    	
    }

}
