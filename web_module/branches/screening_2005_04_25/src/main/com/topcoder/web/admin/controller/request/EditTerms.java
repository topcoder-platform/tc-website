package com.topcoder.web.admin.controller.request;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.admin.Constants;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.shared.util.DBMS;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class EditTerms extends Base {

    protected void businessProcessing() throws Exception {
        String tId = getRequest().getParameter(Constants.TERMS_OF_USE_ID);
        TermsOfUse termsOfUse = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);

        getRequest().setAttribute("terms", termsOfUse.getText(Long.parseLong(tId), DBMS.OLTP_DATASOURCE_NAME));
        setNextPage("/editTerms.jsp");
        setIsNextPageInContext(true);
    }

}
