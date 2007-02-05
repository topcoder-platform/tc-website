package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class ViewRegistrationBase extends RegistrationBase {

    protected void setNextPage(Event e, User u) throws Exception {
        EventRegistration er = getRegistration(e, u);
        if (er != null) {
            getRequest().setAttribute("elegible", er.isEligible());

            setNextPage("/tournaments/" + e.getShortDescription() + "/termsSuccess.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/" + e.getShortDescription() + "/terms.jsp");
            setIsNextPageInContext(true);
        }
    }

    protected boolean isEligible(Event e, User u) throws Exception {
        Request r = new Request();
        r.setContentHandle(e.getShortDescription() + "_eligibility");
        r.setProperty("cr", String.valueOf(u.getId()));
        ResultSetContainer rsc =
                (ResultSetContainer) new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get(e.getShortDescription() + "_eligibility");
        if (log.isDebugEnabled()) {
            log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        }
        return !rsc.isEmpty();
    }
}
