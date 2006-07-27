package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * Processor for Member Contact page.
 * This processor is used both for displaying the input page and for sending email.
 * If there is no parameter TO_HANDLE, then it just displays the input page.
 * If that parameter is present, it sends an email.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 14, 2006
 */
public class MemberContact extends HibernateProcessor {

    public static String CONFIRM = "conf";
    public static String CAN_RECEIVE = "cr";

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

		if (!Helper.isRated(getUser().getId())) {
			getRequest().setAttribute(Helper.NOT_RATED, String.valueOf(false));
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
