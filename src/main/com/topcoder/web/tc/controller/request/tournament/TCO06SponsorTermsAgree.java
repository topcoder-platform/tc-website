package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Feb 6, 2006
 */
public class TCO06SponsorTermsAgree extends Static {

    protected void businessProcessing() throws Exception {
        //load up the terms
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new SimpleResource(this.getClass().getName()));
        } else {
            String companyName = StringUtils.checkNull(getRequest().getParameter(Constants.COMPANY_NAME));
            if ("".equals(companyName)) {
                addError(Constants.COMPANY_NAME, "Please supply the name of the sponsor company you work for.");
            }

            if (!hasErrors()) {
                UserTermsOfUse ut = (UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class);
                Response response = (Response) createEJB(getInitialContext(), Response.class);

                TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                try {
                    tm.begin();
                    if (!ut.hasTermsOfUse(getUser().getId(), Constants.TCO06_SPONSOR_TERMS_ID, DBMS.JTS_OLTP_DATASOURCE_NAME)) {
                        ut.createUserTermsOfUse(getUser().getId(), Constants.TCO06_SPONSOR_TERMS_ID, DBMS.JTS_OLTP_DATASOURCE_NAME);
                    }
                    if (!response.exists(getUser().getId(), Constants.TCO06_SPONSOR_COMPANY_QUESTION_ID)) {
                        response.createResponse(getUser().getId(), Constants.TCO06_SPONSOR_COMPANY_QUESTION_ID, companyName);
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
                setNextPage(getStartPage());
                setIsNextPageInContext(true);
            }
        }

    }

    protected String getSuccessPage() {
        return "/tournaments/tco06/spon_reg_success.jsp";
    }

    protected String getStartPage() {
        return "/tournaments/tco06/spon_reg.jsp";
    }
}
