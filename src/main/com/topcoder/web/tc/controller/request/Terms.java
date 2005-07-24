package com.topcoder.web.tc.controller.request;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.shared.util.DBMS;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 24, 2005
 */
public class Terms extends Base {

    protected void businessProcessing() throws Exception {
        long termsId = Long.parseLong(StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID)));
        TermsOfUse terms = (TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class);
        getResponse().setStatus(200);
        getResponse().setContentType("text/html");
        getResponse().getWriter().print(terms.getText(termsId, DBMS.OLTP_DATASOURCE_NAME));
        getResponse().flushBuffer();
    }
}
