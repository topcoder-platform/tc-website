package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;

import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 3, 2006
 */
public abstract class Base extends ShortHibernateProcessor {
    protected void dbProcessing() throws Exception {

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
                        getRequest().setAttribute("group",
                                DAOUtil.getFactory().getPreferenceGroupDAO().find(getPreferenceGroupId()));
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
        UserTermsOfUse userTerms = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);
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

    public abstract Integer getPreferenceGroupId();


}
