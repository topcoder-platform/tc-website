package com.topcoder.web.tc.controller.request.membercontact;

import java.util.Arrays;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.SecurityHelper;

/**
 * Processor for Member Contact page.
 * It checks that the user is identified and rated.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 14, 2006
 */
public class MemberContact extends ShortHibernateProcessor {

    public static String CAN_RECEIVE = "cr";

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        User sender  = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        // users who have MemberContact Permission skips the rated validation.
        if (!Helper.isRated(getUser().getId()) && 
                !SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(MemberContact.class))) {
            getRequest().setAttribute(Helper.NOT_RATED, String.valueOf(true));
        } else if (Helper.isBanned(getUser().getId()) 
                || (Arrays.binarySearch(WebConstants.ACTIVE_STATI, sender.getStatus().charValue()) < 0)) {
            getRequest().setAttribute(Helper.BANNED, String.valueOf(true));         
        } else {
            if (!sender.isMemberContactEnabled()) {
                getRequest().setAttribute(CAN_RECEIVE, String.valueOf(true));
            }
        }

        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);
    }
}
