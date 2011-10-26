package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

/**
 * @author dok
 * @version $Revision: 55466 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 17, 2006
 */
public class SponsorTermsAgree extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        //load up the terms
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            String companyName = StringUtils.checkNull(getRequest().getParameter(Constants.COMPANY_NAME));
            if ("".equals(companyName)) {
                addError(Constants.COMPANY_NAME, "Please supply the name of the sponsor company you work for.");
            }

            String termsAgree = getRequest().getParameter(Constants.TERMS_AGREE);
            if (!"on".equals(termsAgree)) {
                addError(Constants.TERMS_AGREE, "You must agree to the terms in order to continue.");
            }

            if (!hasErrors()) {
                UserTermsOfUse ut = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);
                Response response = (Response) createEJB(getInitialContext(), Response.class);

                TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                try {
                    tm.begin();
                    if (!ut.hasTermsOfUse(getUser().getId(), Constants.TCCC06_SPONSOR_TERMS_ID, DBMS.JTS_OLTP_DATASOURCE_NAME)) {
                        ut.createUserTermsOfUse(getUser().getId(), Constants.TCCC06_SPONSOR_TERMS_ID, DBMS.JTS_OLTP_DATASOURCE_NAME);
                    }
                    if (!response.exists(getUser().getId(), Constants.TCCC06_SPONSOR_COMPANY_QUESTION_ID)) {
                        response.createResponse(getUser().getId(), Constants.TCCC06_SPONSOR_COMPANY_QUESTION_ID, companyName);
                    }
                    tm.commit();
                } catch (Exception e) {
                    if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                        tm.rollback();
                    }
                    throw e;
                }
                setNextPage(getSuccessPage());
                setIsNextPageInContext(true);
            } else {
                setDefault(Constants.TERMS_AGREE, String.valueOf("on".equals(termsAgree)));
                setDefault(Constants.COMPANY_NAME, StringUtils.htmlEncode(companyName));
                setNextPage(getStartPage());
                setIsNextPageInContext(true);
            }
        }

    }

    protected String getSuccessPage() {
        return "/tournaments/tccc06/spon_reg_success.jsp";
    }

    protected String getStartPage() {
        return "/tournaments/tccc06/spon_reg.jsp";
    }
}



