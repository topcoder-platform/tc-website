package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrationBase;

import java.util.Iterator;
import java.util.Set;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class ViewRegistration extends ViewRegistrationBase {

    protected final String getEventShortDesc() {
        String eventType = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_TYPE));
        if (!"".equals(eventType)) {
            return "tccc07" + getContestTypeUsingEventType(Integer.parseInt(eventType));
        }
        return null;
    }

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        getRequest().setAttribute("eligible", er.isEligible());
    }

    public boolean isEligible(Event e, User u) throws Exception {
        Set regTypes = u.getRegistrationTypes();
        boolean eligible = false;
        for (Iterator it = regTypes.iterator(); it.hasNext() && !eligible;) {
            RegistrationType rt = (RegistrationType) it.next();
            if (e.getType().getId().equals(EventType.ALGORITHM_TOURNAMENT_ID) ||
                    e.getType().getId().equals(EventType.COMPONENT_TOURNAMENT_ID) ||
                    e.getType().getId().equals(EventType.SPONSOR_TRACK_ID) ||
                    e.getType().getId().equals(EventType.MARATHON_TOURNAMENT_ID)) {
                if (rt.getId().equals(RegistrationType.COMPETITION_ID)) {
                    eligible = true;
                }
            }
            if (e.getType().getId().equals(EventType.STUDIO_TOURNAMENT_ID)) {
                if (rt.getId().equals(RegistrationType.STUDIO_ID)) {
                    eligible = true;
                }
            }
        }
        return eligible;
    }

    protected void dbProcessing() throws Exception {
        String eventType = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_TYPE));
        Integer eventTypeId;
        try {
            eventTypeId = Integer.parseInt(eventType);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid event type parameter.");
        }
        if ("".equals(eventType) || "".equals(getContestTypeUsingEventType(eventTypeId))) {
            throw new TCWebException("invalid event type parameter.");
        }
        super.dbProcessing();
    }

    protected void setNextPage(Event e, User u) {
        getRequest().setAttribute(Constants.EVENT_TYPE, getRequest().getParameter(Constants.EVENT_TYPE));
        EventRegistration er = u.getEventRegistration(e);
        if (er != null) {
            getRequest().setAttribute("eligible", er.isEligible());
            setNextPage("/tournaments/tccc07/termsSuccess.jsp");
        } else {
            setNextPage("/tournaments/tccc07/terms.jsp");
        }
        setIsNextPageInContext(true);
    }
}
