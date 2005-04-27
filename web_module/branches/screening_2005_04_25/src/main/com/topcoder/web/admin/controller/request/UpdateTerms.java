package com.topcoder.web.admin.controller.request;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.shared.util.DBMS;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class UpdateTerms extends Base {

    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        String termsText = getRequest().getParameter(Constants.TERMS);
        long termsOfUseTypeId = Long.parseLong(getRequest().getParameter(Constants.TERMS_OF_USE_TYPE_ID));

        try {

            TermsOfUse termsOfUse = (TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class);
            TransactionManager tm = null;
            long termsOfUseId = 0;
            tm.begin();
            if (StringUtils.checkNull(tId).equals("")) {
                termsOfUseId = termsOfUse.createTermsOfUse(DBMS.JTS_OLTP_DATASOURCE_NAME, DBMS.OLTP_DATASOURCE_NAME);
            } else {
                termsOfUseId = Long.parseLong(tId);
                termsOfUse.setText(termsOfUseId, termsText, DBMS.JTS_OLTP_DATASOURCE_NAME);
                termsOfUse.setTermsOfUseTypeId(termsOfUseId, termsOfUseTypeId, DBMS.JTS_OLTP_DATASOURCE_NAME);
            }
            tm.commit();

            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            setNextPage(info.getServletPath() + "?module=EditTerms&" + Constants.TERMS_OF_USE_ID + "=" + termsOfUseId);
            setIsNextPageInContext(false);

        } catch (Exception e) {
            if (tm != null && tm.getStatus() == Status.STATUS_ACTIVE) {
                tm.rollback();
            }
            throw e;
        }
    }


}
