package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.User;

/**
 * @author dok, pulky
 * @version $Revision: 63911 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class ViewRegistrationBase extends RegistrationBase {

    protected void setNextPage(Event e, User u) {
        EventRegistration er = u.getEventRegistration(e);
        if (er != null) {
            getRequest().setAttribute("eligible", er.isEligible());

            setNextPage("/tournaments/" + e.getShortDescription() + "/termsSuccess.jsp");
            setIsNextPageInContext(true);
        } else {
            setNextPage("/tournaments/" + e.getShortDescription() + "/terms.jsp");
            setIsNextPageInContext(true);
        }
    }

    protected final String getContestTypeUsingEventType(Integer eventTypeId) {
        if (EventType.COMPONENT_TOURNAMENT_ID.equals(eventTypeId)) {
            return "component";
        } else if (EventType.ALGORITHM_TOURNAMENT_ID.equals(eventTypeId)) {
            return "algorithm";
        } else if (EventType.MARATHON_TOURNAMENT_ID.equals(eventTypeId)) {
            return "marathon";
        } else if (EventType.STUDIO_TOURNAMENT_ID.equals(eventTypeId)) {
            return "studio";
        } else if (EventType.SPONSOR_TRACK_ID.equals(eventTypeId)) {
            return "sponsortrack";
        }
        return "";
    }


    public boolean isEligible(Event e, User u) throws Exception {
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

    protected void regProcessing(Event event, User user) throws TCWebException {
        // nothing to do
    }
}
