package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccess;

import javax.naming.InitialContext;

public class TCCC04TermsAgree extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new SimpleResource("TCCC04Terms"));
            } else {
                UserTermsOfUse userTerms = (UserTermsOfUse)createEJB(getInitialContext(), UserTermsOfUse.class);
                if (!isRegistered(getUser().getId()) && isEligible(getUser().getId())) {
                    log.debug("user has not previously aggreed to these terms");
                    userTerms.createUserTermsOfUse(getUser().getId(), Constants.TCCC04_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
                } else {
                    log.debug("user has previously aggreed to these terms");
                }
                //this should go to the default page
                setIsNextPageInContext(false);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    public static boolean isEligible(long userId) throws Exception {
        Request r = new Request();
        r.setContentHandle("tccc04_eligibility");
        r.setProperty("cr", String.valueOf(userId));
        ResultSetContainer rsc = (ResultSetContainer)new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("tccc04_eligibility");
        log.debug("they " + rsc.isEmpty()?"are not":"are" + " eligible");
        return !rsc.isEmpty();
    }

    public static boolean isRegistered(long userId) throws Exception {
        InitialContext ctx = null;
        boolean ret = false;
        try {
            ctx = TCContext.getInitial();
            UserTermsOfUse userTerms = (UserTermsOfUse)createEJB(ctx, UserTermsOfUse.class);
            ret = userTerms.hasTermsOfUse(userId, Constants.TCCC04_TERMS_OF_USE_ID, DBMS.OLTP_DATASOURCE_NAME);
            log.debug("they " + ret?"are":"are not" + " registered");
        } finally {
            close(ctx);
        }
        return ret;
    }
}
