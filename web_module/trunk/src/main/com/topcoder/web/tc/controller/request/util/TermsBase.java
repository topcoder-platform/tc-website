package com.topcoder.web.tc.controller.request.util;

import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TermsOfUseUtil;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import java.util.Calendar;
import java.util.Date;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 2:35:03 PM
 */
abstract class TermsBase extends Base {

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
                if (!isRegistered()) {
                    if (isEligible()) {
                        TermsOfUseDao terms = TermsOfUseUtil.getTermsOfUseDao();
                        getRequest().setAttribute("terms", terms.getTermsOfUseText(getTermsId()));
                        getRequest().setAttribute(Constants.TERMS_OF_USE_ID, new Integer(getTermsId()));
                        setSuccessPage();
                    } else {
                        throw new NavigationException("You are not eligible to register for the " + getEventName());
                    }
                } else {
                    //already registered, just go to the success page.  why bother telling them
                    setSuccessPage();
                }
            }
        }
    }

    public boolean isRegistered() throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("checking if " + getUser().getId() + " has agreed to terms " + getTermsId());
        }
        boolean ret = false;
        UserTermsOfUseDao userTerms = TermsOfUseUtil.getUserTermsOfUseDao();
        ret = userTerms.hasTermsOfUse(getUser().getId(), getTermsId());
        if (log.isDebugEnabled()) {
            log.debug("they " + (ret ? "are" : "are not") + " registered");
        }
        return ret;
    }


    public abstract Calendar getEnd();

    public abstract Calendar getBeginning();

    public abstract String getEventName();

    public abstract int getTermsId();

    protected abstract void setSuccessPage() throws Exception;

    public abstract boolean isEligible() throws Exception;


}
