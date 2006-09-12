package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * Processor for Member Contact page.
 * It checks that the user is identified and rated.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 14, 2006
 */
public class MemberContact extends ShortHibernateProcessor {

    public static String CONFIRM = "conf";
    public static String CAN_RECEIVE = "cr";

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        if (!Helper.isRated(getUser().getId())) {
            getRequest().setAttribute(Helper.NOT_RATED, String.valueOf(true));
        } else if (Helper.isBanned(getUser().getId())) {
            getRequest().setAttribute(Helper.BANNED, String.valueOf(true));        	
        } else {
            User sender  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

            if (!sender.isMemberContactEnabled()) {
                getRequest().setAttribute(CAN_RECEIVE, String.valueOf(true));
            }
        }

        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);
    }


}
