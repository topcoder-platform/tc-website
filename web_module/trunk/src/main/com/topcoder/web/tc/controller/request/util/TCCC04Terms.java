package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.shared.util.DBMS;

public class TCCC04Terms extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            TermsOfUse terms = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
            getRequest().setAttribute("terms", terms.getText(Constants.TCCC04_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
