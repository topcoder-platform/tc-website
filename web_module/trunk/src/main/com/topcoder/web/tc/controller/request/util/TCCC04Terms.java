package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.SimpleResource;

import java.util.Calendar;
import java.util.Date;

public class TCCC04Terms extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new SimpleResource("TCCC04Terms"));
            } else {
                Calendar now = Calendar.getInstance();
                now.setTime(new Date());
                Calendar end = Calendar.getInstance();
                end.set(2004, 1, 23, 9, 0);
                Calendar beginning = Calendar.getInstance();
                beginning.set(2004, 1, 1, 9, 0);
                if (now.after(end)) {
                    throw new NavigationException("The registration period for the TCCC is over.");
                } else if (now.before(beginning)) {
                    throw new NavigationException("The registration period for the TCCC has not yet begun.");
                } else {
                    if (!TCCC04TermsAgree.isRegistered(getUser().getId())) {
                        if (TCCC04TermsAgree.isEligible(getUser().getId())) {
                            TermsOfUse terms = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
                            getRequest().setAttribute("terms", terms.getText(Constants.TCCC04_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME));
                            setNextPage(Constants.TCCC04_TERMS);
                            setIsNextPageInContext(true);
                        } else {
                            throw new NavigationException("You are not eligible to register for the TCCC");
                        }
                    } else {
                        throw new NavigationException("You are already registration for the TCCC.");
                    }
                }
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
