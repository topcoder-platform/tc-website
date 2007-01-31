package com.topcoder.web.tc.controller.request.tournament.tchs07;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class ViewRegistration extends RegistrationBase {
    protected void regProcessing(Event event, User user) throws Exception {
    }

    protected void setNextPage(Event e, User u) throws Exception {
        if (isRegistered(e, u)) {
            setNextPage("/tournaments/tchs07/termsSuccess.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/tchs07/terms.jsp");
            setIsNextPageInContext(true);
        }
    }

    public boolean isEligible() throws Exception {
        //how old are you?
        //are you currently pursuing your secondary (high school) education?
        //are you enrolled full time at a college or university?
        //
        Request r = new Request();
        r.setContentHandle("tchs07_eligibility");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer rsc =
                (ResultSetContainer) new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("tchs07_eligibility");
        if (log.isDebugEnabled()) {
            log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        }
        return !rsc.isEmpty();
    }

}
