/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.admin.controller.request;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;

/**
 * <p>This class processes update/create requests for terms of use.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added support for new columns in terms_of_use table.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class UpdateTerms extends EditTerms {

    /**
     * This method will create/update the specified terms of use after validation.
     *
     * @throws Exception if any error occurs
     * @see com.topcoder.web.admin.controller.request.EditTerms#businessProcessing()
     */
    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        String termsText = getRequest().getParameter(Constants.TERMS);
        String ttId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_TYPE_ID));

        String termsTitle = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_TITLE));
        Integer termsElectronicallySignable  = StringUtils.checkNull(
                getRequest().getParameter(Constants.TERMS_ELECTRONICALLY_SIGNABLE)).equals("on") ? 1 : 0;
        String termsUrl = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_URL));

        TransactionManager tm = null;
        try {

            if (!valid(ttId, termsTitle, termsElectronicallySignable, termsUrl)) {
                loadTermsTypeList();
                setDefault(Constants.TERMS_OF_USE_TYPE_ID, ttId);
                setDefault(Constants.TERMS_OF_USE_ID, tId);
                setDefault(Constants.TERMS, termsText);
                setDefault(Constants.TERMS_TITLE, termsTitle);
                setDefault(Constants.TERMS_ELECTRONICALLY_SIGNABLE, termsElectronicallySignable.equals(1));
                setDefault(Constants.TERMS_URL, termsUrl);
                setNextPage("/editTerms.jsp");
                setIsNextPageInContext(true);
            } else {
                TermsOfUseEntity terms = new TermsOfUseEntity(StringUtils.checkNull(tId).equals("") ? null :
                    Long.parseLong(tId), termsText, Integer.parseInt(ttId), termsTitle, termsElectronicallySignable,
                    termsUrl);

                TermsOfUse termsOfUse = (TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class);
                tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();
                termsOfUse.updateTermsOfUse(terms, DBMS.JTS_OLTP_DATASOURCE_NAME);
                tm.commit();

                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?module=EditTerms&" + Constants.TERMS_OF_USE_ID + "=" +
                        terms.getTermsOfUseId());
                setIsNextPageInContext(false);
            }
        } catch (Exception e) {
            if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE ||
                    tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                tm.rollback();
            }
            throw e;
        }
    }

    /**
     * This method validates the terms of use data
     *
     * @param ttId the terms type id field content
     * @param termsTitle the terms title field content
     * @param termsElectronicallySignable the terms electronically signable field content
     * @param termsUrl the terms url field content
     *
     * @return true if the form data is valid
     *
     * @since 1.1
     */
    private boolean valid(String ttId, String termsTitle, Integer termsElectronicallySignable, String termsUrl) {
        if (ttId.equals("")) {
            addError(Constants.TERMS_OF_USE_TYPE_ID, "You must choose a terms of use type");
        }

        if (termsTitle.length() == 0) {
            addError(Constants.TERMS_TITLE, "You must enter a terms title");
        }

        if (termsElectronicallySignable == 0 && termsUrl.length() == 0) {
            addError(Constants.TERMS_URL, "If the terms is not electronically signable you must provide a terms URL");
        }

        return !hasErrors();
    }
}
