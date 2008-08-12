package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.controller.request.tournament.RegistrationBase;

public abstract class CSDN07RegistrationBase extends RegistrationBase {

    private boolean isAlreadyRegistered = false;
    
    protected String getEventShortDesc() {
        return "csdn07";
    }

    public boolean isEligible(Event event, User user) throws Exception {
        Request r = new Request();
        r.setContentHandle(event.getShortDescription() + "_eligibility");
        r.setProperty("cr", String.valueOf(user.getId()));
        ResultSetContainer rsc =
                (ResultSetContainer) new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get(event.getShortDescription() + "_eligibility");
        if (log.isDebugEnabled()) {
            log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        }
        return !rsc.isEmpty();
    }

    protected void setAlreadyRegistered(boolean reg) {
        isAlreadyRegistered = reg;
    }
    
    protected void setNextPage(Event event, User user) {
        if (isAlreadyRegistered) {
            setNextPage("/promoevents/csdn/success.jsp");
        } else {
            setNextPage("/promoevents/csdn/overview.jsp");
        }
    
        setIsNextPageInContext(true);
    }

}
