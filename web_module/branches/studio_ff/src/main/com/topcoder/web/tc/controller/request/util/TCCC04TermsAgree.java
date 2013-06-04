package com.topcoder.web.tc.controller.request.util;

import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.TermsOfUseUtil;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import java.util.Calendar;
import java.util.Date;

public class TCCC04TermsAgree extends Base {

    protected void businessProcessing() throws TCWebException {
        try {
            if (getUser().isAnonymous()) {
                throw new PermissionException(getUser(), new SimpleResource("TCCC04Terms"));
            } else {
                Calendar now = Calendar.getInstance();
                now.setTime(new Date());
                Calendar end = Calendar.getInstance();
                end.set(2004, 1, 23, 9, 0);
                Calendar beginning = Calendar.getInstance();
                beginning.set(2004, 1, 1, 9, 0);
                if (now.after(end)) {
                    throw new NavigationException("The registration period for the TCCC is over.");
                } else if (now.before(beginning)) {
                    throw new NavigationException("The registration period for the TCCC has not yet begun.");
                } else {
                    UserTermsOfUseDao userTerms = TermsOfUseUtil.getUserTermsOfUseDao();
                    if (!isRegistered(userTerms, getUser().getId())) {
                        if (isEligible(getUser().getId())) {
                            log.info("registering " + getUser().getId() + " for the tccc04");
                            userTerms.createUserTermsOfUse(getUser().getId(), Constants.TCCC04_TERMS_OF_USE_ID);
                        } else {
                            throw new NavigationException("You are not eligible to register for the TCCC");
                        }
                    } else {
                        log.debug("user has previously aggreed to these terms");
                    }
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
        ResultSetContainer rsc = (ResultSetContainer) new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("tccc04_eligibility");
        log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        return !rsc.isEmpty();
    }

    public static boolean isRegistered(UserTermsOfUseDao userTerms, long userId) throws Exception {
        boolean ret = false;
        ret = userTerms.hasTermsOfUse(userId, Constants.TCCC04_TERMS_OF_USE_ID);
        log.debug("they " + (ret ? "are" : "are not") + " registered");
        return ret;
    }
}
