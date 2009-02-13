package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.ejb.user.UserEvent;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.tccc06.SubmitAlgoRegistration;

import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 55466 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 25, 2006
 */
public class TCCC06ComponentTermsAgree extends TermsAgreeBase {
    //dammit, my kingdom for some multiple inheritance!!!
    private TCCC06ComponentTerms helper = new TCCC06ComponentTerms();

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
                        String aolSurvey = getRequest().getParameter(SubmitAlgoRegistration.AOL_SURVEY);
                        //set this just in case there is an error
                        setDefault(SubmitAlgoRegistration.AOL_SURVEY, String.valueOf("on".equals(aolSurvey)));
                        getRequest().setAttribute(SubmitAlgoRegistration.AOL_SURVEY, Boolean.valueOf("on".equals(aolSurvey)));

                        String termsAgree = getRequest().getParameter(Constants.TERMS_AGREE);
                        if ("on".equals(termsAgree)) {
                            TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                            tm.begin();
                            try {
                                UserEvent userEvent = (UserEvent) createEJB(getInitialContext(), UserEvent.class);
                                userEvent.createUserEvent(getUser().getId(), Constants.TCCC06_EVENT_ID, DBMS.TCS_OLTP_DATASOURCE_NAME);
                                log.info("registering " + getUser().getId() + " for the " + getEventName());
                                userTerms.createUserTermsOfUse(getUser().getId(), getTermsId(), DBMS.OLTP_DATASOURCE_NAME);
                            } catch (Exception e) {
                                if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                                    tm.rollback();
                                }
                                throw new TCWebException(e);
                            }
                            tm.commit();

                            refreshCache();

                        } else {
                            addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
                        }


                    } else {
                        throw new NavigationException("You are not eligible to register for the " + getEventName());
                    }
                } else {
                    //dont' have anything to do really
                }
            }
            if (hasErrors()) {
                setNextPage("/tournaments/tccc06/terms.jsp");
                setIsNextPageInContext(true);
            } else {
                setSuccessPage();
            }
        }
    }


    /**
     * We need this method so that we can set the request on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     *
     * @param request
     */
    public void setRequest(TCRequest request) {
        super.setRequest(request);
        helper.setRequest(request);
    }

    /**
     * We need this method so that we can set the response on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     *
     * @param response
     */
    public void setResponse(TCResponse response) {
        super.setResponse(response);
        helper.setResponse(response);
    }

    /**
     * We need this method so that we can set the authentication on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     *
     * @param auth
     */
    public void setAuthentication(WebAuthentication auth) {
        super.setAuthentication(auth);
        helper.setAuthentication(auth);
    }


    public Calendar getEnd() {
        return helper.getEnd();
    }

    public Calendar getBeginning() {
        return helper.getBeginning();
    }

    public String getEventName() {
        return helper.getEventName();
    }

    public int getTermsId() {
        return helper.getTermsId();
    }

    protected void setSuccessPage() {
        setNextPage("/tournaments/tccc06/regsuccess.jsp");
        setIsNextPageInContext(true);
    }

    public boolean isEligible() throws Exception {
        return helper.isEligible();
    }

    protected String getCacheKey() {
        Request r = new Request();
        r.setContentHandle("tccc06_comp_registrants");
        return r.getCacheKey();
    }


}

