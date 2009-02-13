package com.topcoder.web.tc.controller.request.tournament.tchs07;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUseLocal;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class RegistrationBase extends Base {

    public static final String AGE = "age";
    public static final String IN_COLLEGE = "incollege";
    public static final String IN_HIGH_SCHOOL = "inhs";

    public static final List YES_NO_ANSWERS;
    static {
        YES_NO_ANSWERS = new ArrayList();
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(false), "No"));
    }


    protected void businessProcessing() throws Exception {

        getRequest().setAttribute(Constants.TERMS_OF_USE_ID, String.valueOf(getTermsId()));
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
                        regProcessing();
                    } else {
                        throw new NavigationException("You are not eligible to register for the " + getEventName());
                    }
                } else {
                    //dont' have anything to do really
                }
            }
            setNextPage();
        }
    }



    public boolean isRegistered() throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("checking if " + getUser().getId() + " has agreed to terms " + getTermsId());
        }
        boolean ret = false;
        UserTermsOfUseLocal userTerms = (UserTermsOfUseLocal) createLocalEJB(getInitialContext(), UserTermsOfUse.class);
        ret = userTerms.hasTermsOfUse(getUser().getId(), getTermsId(), DBMS.OLTP_DATASOURCE_NAME);
        if (log.isDebugEnabled()) {
            log.debug("they " + (ret ? "are" : "are not") + " registered");
        }
        return ret;
    }

    protected abstract void regProcessing() throws Exception;

    public abstract Calendar getEnd();

    public abstract Calendar getBeginning();

    public abstract String getEventName();

    public abstract int getTermsId();

    protected abstract void setNextPage() throws Exception;

    public abstract boolean isEligible() throws Exception;

}
