package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.SimpleResource;

public class TCCC04Terms extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new SimpleResource("TCCC04Terms"));
            } else {
                TermsOfUse terms = (TermsOfUse)createEJB(getInitialContext(), TermsOfUse.class);
                getRequest().setAttribute("terms", terms.getText(Constants.TCCC04_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME));
                setNextPage(Constants.TCCC04_TERMS);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
