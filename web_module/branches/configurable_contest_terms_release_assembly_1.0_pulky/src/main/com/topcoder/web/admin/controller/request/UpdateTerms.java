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
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Apr 27, 2005
 */
public class UpdateTerms extends EditTerms {

    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        String termsText = getRequest().getParameter(Constants.TERMS);
        String ttId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_TYPE_ID));

        String termsTitle = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_TITLE));
        System.out.println("electro: " + StringUtils.checkNull(
                getRequest().getParameter(Constants.TERMS_ELECTRONICALLY_SIGNABLE)));
        Integer termsElectronicallySignable  = StringUtils.checkNull(
                getRequest().getParameter(Constants.TERMS_ELECTRONICALLY_SIGNABLE)).equals("true") ? 1 : 0;
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
