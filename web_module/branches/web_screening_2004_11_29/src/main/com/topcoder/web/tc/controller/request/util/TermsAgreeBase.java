package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;

import java.util.Calendar;
import java.util.Date;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 2:35:13 PM
 */
abstract class TermsAgreeBase extends TermsBase {

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Calendar now = Calendar.getInstance();
            now.setTime(new Date());
            if (now.after(getEnd())) {
                throw new NavigationException("The registration period for the " + getEventName() + " is over.");
            } else if (now.before(getBeginning())) {
                throw new NavigationException("The registration period for the " + getEventName() + " has not yet begun.");
            } else {
                UserTermsOfUse userTerms = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);
                if (!isRegistered()) {
                    if (isEligible()) {
                        log.info("registering " + getUser().getId() + " for the " + getEventName());
                        userTerms.createUserTermsOfUse(getUser().getId(), getTermsId(), DBMS.OLTP_DATASOURCE_NAME);
                    } else {
                        throw new NavigationException("You are not eligible to register for the " + getEventName());
                    }
                } else {
                    //dont' have anything to do really
                }
            }
            setSuccessPage();
        }
    }


}
