/**
 * used to extract information about a user from the db.
 *
 * @author Sam King
 */

package com.topcoder.web.pacts.bean.pacts_client.dispatch;

import com.topcoder.web.pacts.bean.*;
import com.topcoder.web.pacts.common.*;
import org.apache.log4j.*;

public class UserProfileBean {
        private static Category log = Category.getInstance(UserProfileBean.class.getName());
    /**
     * contructor.  Does nothing, the class is stateless
     */
    public UserProfileBean() {
	// do nothing
    }

    /**
     * used to get the current user profile.
     *
     * @param memberId the member id
     * @return the user profile, or null if the member id is invalid
     */
    public UserProfile getUserProfile(long memberId) {
	log.debug("the user id = " + memberId);
	DataInterfaceBean bean = new DataInterfaceBean();
	java.util.Map reply = null;
	try {
	    reply = bean.getUserProfile(memberId);
	} catch (Exception e1) {
	    log.error("did not get user profile in getUserProfile");
	    e1.printStackTrace();
	    return null;
	}

	UserProfile up = new UserProfile(reply);
	return up;
    }

    /**
     * used to extract user demographics for a given user.
     *
     * @param memberId the id of the user
     * @return the demographic info
     */
    public UserDemographics getUserDemographics(long memberId) {
	log.debug("the user id for demographics data is= " + memberId);
	DataInterfaceBean bean = new DataInterfaceBean();
	java.util.Map reply = null;
	try {
	    reply = bean.getDemographicData(memberId);
	} catch (Exception e1) {
	    log.error("did not get user demographics in getUserDemographics");
	    e1.printStackTrace();
	    return null;
	}

	UserDemographics ud = new UserDemographics(reply);
	return ud;
    }
}
