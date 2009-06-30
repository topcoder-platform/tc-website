package com.topcoder.web.admin.controller.request;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;

import javax.transaction.Status;
import javax.transaction.TransactionManager;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Apr 27, 2005
 */
public class UpdateTerms extends EditTerms {

    protected void businessProcessing() throws Exception {
        String tId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));
        String termsText = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS));
        String title = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_TITLE));
        String url = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_URL));
        String electronicallySignable = StringUtils.checkNull(
        		getRequest().getParameter(Constants.TERMS_OF_USE_ELECTRONICALLY_SIGNABLE));

        String ttId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_TYPE_ID));

        TransactionManager tm = null;
        try {
        	
        	if ("".equals(ttId)) {
        		addError(Constants.TERMS_OF_USE_TYPE_ID, "You must choose a terms of use type");
        	}
        	if (!"on".equals(electronicallySignable) && "".equals(url)) {
        		addError(Constants.TERMS_OF_USE_URL,
        				"You must set the terms download URL if 'Electronically Signable' is off.");
        	}
            if (hasErrors()) {
            	loadTermsTypeList();
                setDefault(Constants.TERMS_OF_USE_TYPE_ID, ttId);
                setDefault(Constants.TERMS_OF_USE_ID, tId);
                setDefault(Constants.TERMS, termsText);
                setDefault(Constants.TERMS_OF_USE_TITLE, title);
                setDefault(Constants.TERMS_OF_USE_URL, url);
                setDefault(Constants.TERMS_OF_USE_ELECTRONICALLY_SIGNABLE, String.valueOf("on".equals(electronicallySignable)));

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
                termsOfUse.setTitle(termsOfUseId, title, DBMS.JTS_OLTP_DATASOURCE_NAME);
                termsOfUse.setURL(termsOfUseId, url, DBMS.JTS_OLTP_DATASOURCE_NAME);
                termsOfUse.setElectronicallySignable(termsOfUseId, "on".equals(electronicallySignable),
                		DBMS.JTS_OLTP_DATASOURCE_NAME);

                tm.commit();

                SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                setNextPage(info.getServletPath() + "?module=EditTerms&" + Constants.TERMS_OF_USE_ID + "=" + termsOfUseId);
                setIsNextPageInContext(false);
            }


        } catch (Exception e) {
            if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                tm.rollback();
            }
            throw e;
        }
    }


}
