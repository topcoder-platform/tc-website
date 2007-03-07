package com.topcoder.web.tc.controller.request.tournament.tco07;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrationBase;

import java.util.ArrayList;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class ViewSponsorRegistration extends ViewRegistrationBase {

    protected void alreadyRegisteredProcessing(EventRegistration er) {
        getRequest().setAttribute("eligible", er.isEligible());
    }

    public boolean isEligible(Event e, User u) throws Exception {
        return u.getRegistrationTypes().contains(DAOUtil.getFactory().getRegistrationTypeDAO().getCompetitionType());
    }

    protected void setNextPage(Event e, User u) {
        EventRegistration er = u.getEventRegistration(e);
        if (er != null) {
            getRequest().setAttribute("eligible", er.isEligible());
            setNextPage("/tournaments/tco07/sponsortrack/termsSuccess.jsp");
        } else {
            getRequest().setAttribute("questions", new ArrayList(e.getSurvey().getQuestions()));
            setNextPage("/tournaments/tco07/sponsortrack/terms.jsp");
        }
        setIsNextPageInContext(true);
    }
}
