package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 30, 2007
 */
public class ViewSponsorRegistration extends ViewRegistration {

    protected void setNextPage(Event e, User u) {
        EventRegistration er = u.getEventRegistration(e);
        if (er != null) {
            getRequest().setAttribute("eligible", er.isEligible());
            setNextPage("/tournaments/tccc07/sponsortrack/termsSuccess.jsp");
        } else {
            getRequest().setAttribute(Constants.EVENT_TYPE, getRequest().getParameter(Constants.EVENT_TYPE));
/*
            getRequest().setAttribute("questions", new ArrayList(e.getSurvey().getQuestions()));
*/
            setNextPage("/tournaments/tccc07/sponsortrack/terms.jsp");
        }
        setIsNextPageInContext(true);
    }
}
