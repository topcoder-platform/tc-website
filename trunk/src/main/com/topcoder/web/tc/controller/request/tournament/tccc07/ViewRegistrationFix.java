package com.topcoder.web.tc.controller.request.tournament.tccc07;
import java.util.Iterator;
import java.util.Set;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.EventType;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrationBase;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public class ViewRegistrationFix extends ViewRegistrationBase {

    protected final String getEventShortDesc() {
        String eventType = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_TYPE));
        if (!"".equals(eventType)) {
            return "tccc07" + getContestTypeUsingEventType(Integer.parseInt(eventType));
        }
        return null;
    }

    protected void regProcessing(Event event, User user) throws TCWebException {
        // this guy shouldn't be here
        throw new NavigationException("Sorry, you are not registered for " + event.getDescription() + ".");                
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
        if (!EventType.ALGORITHM_TOURNAMENT_ID.equals(eventTypeId)) {
            throw new TCWebException("invalid event type parameter.");                
        }
        if ("".equals(eventType) || "".equals(getContestTypeUsingEventType(eventTypeId))) {
            throw new TCWebException("invalid event type parameter.");                
        }
        super.dbProcessing();
    }

    protected void setNextPage(Event e, User u) {
        getRequest().setAttribute(Constants.EVENT_TYPE, getRequest().getParameter(Constants.EVENT_TYPE));
//        EventRegistration er = u.getEventRegistration(e);
        
        // This was only for users that didn't respond. IF commented, will allow everyone to change their selection.
//        DataAccess tccc07Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
//        Request tccc07Request = new Request();
//        tccc07Request.setProperty("cr", String.valueOf(getUser().getId()));
//        tccc07Request.setContentHandle("tccc07_fix");
//
//        ResultSetContainer rsc = null;
//        try {
//            rsc = tccc07Dai.getData(tccc07Request).get("tccc07_fix");
//        } catch (Exception ex) {
//            throw new RuntimeException("Cannot complete registration.");                
//        }

//        if (rsc != null && rsc.size() > 0) {
//            getRequest().setAttribute("eligible", er.isEligible());
//            setNextPage("/tournaments/tccc07/termsSuccess.jsp");
//        } else {
            setNextPage("/tournaments/tccc07/termsFix.jsp");
//        }
        setIsNextPageInContext(true);
    }
}

