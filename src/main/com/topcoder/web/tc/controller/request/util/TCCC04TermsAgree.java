package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.SimpleResource;

public class TCCC04TermsAgree extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new SimpleResource("TCCC04Terms"));
            } else {
                UserTermsOfUse userTerms = (UserTermsOfUse)createEJB(getInitialContext(), UserTermsOfUse.class);
                if (!userTerms.hasTermsOfUse(getUser().getId(), Constants.TCCC04_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME)) {
                    userTerms.createUserTermsOfUse(getUser().getId(), Constants.TCCC04_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
                }
                setNextPage(Constants.MEMBER_HOME_PAGE);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
