package com.topcoder.web.admin.controller.request;

import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.ApplicationServer;

import javax.transaction.TransactionManager;
import javax.transaction.Status;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class UpdateTerms extends EditTerms {

    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        String termsText = getRequest().getParameter(Constants.TERMS);
        String ttId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_TYPE_ID));

        TransactionManager tm = null;
        try {

            if (ttId.equals("")) {
                addError(Constants.TERMS_OF_USE_TYPE_ID, "You must choose a terms of use type");
                loadTermsTypeList();
                log.debug("defaut type is " + ttId);
                setDefault(Constants.TERMS_OF_USE_TYPE_ID, ttId);
                setDefault(Constants.TERMS_OF_USE_ID, tId);
                setDefault(Constants.TERMS, termsText);
                setNextPage("/editTerms.jsp");
                setIsNextPageInContext(true);
            } else {
                TermsOfUse termsOfUse = (TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class);
                long termsOfUseId = 0;
                tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();
                if (StringUtils.checkNull(tId).equals("")) {
                    termsOfUseId = termsOfUse.createTermsOfUse(DBMS.JTS_OLTP_DATASOURCE_NAME, DBMS.OLTP_DATASOURCE_NAME);
                } else {
                    termsOfUseId = Long.parseLong(tId);
                }
                termsOfUse.setText(termsOfUseId, termsText, DBMS.JTS_OLTP_DATASOURCE_NAME);
                termsOfUse.setTermsOfUseTypeId(termsOfUseId, Long.parseLong(ttId), DBMS.JTS_OLTP_DATASOURCE_NAME);
                tm.commit();

                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?module=EditTerms&" + Constants.TERMS_OF_USE_ID + "=" + termsOfUseId);
                setIsNextPageInContext(false);
            }


        } catch (Exception e) {
            if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                tm.rollback();
            }
            throw e;
        }
    }


}
