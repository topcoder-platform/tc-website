package com.topcoder.web.tc.controller.request.tournament;

import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {
    protected static final String AGE = "age";
    protected static final String IN_COLLEGE = "incollege";
    protected static final String IN_HIGH_SCHOOL = "inhs";

    protected abstract void regProcessing(Event event, User user) throws Exception;

    protected abstract void setNextPage(Event event, User user) throws Exception;

    protected abstract boolean isEligible(Event event, User user) throws Exception;

    protected void dbProcessing() throws Exception {

        Long eventId = null;

        try {
            eventId = new Long(StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_ID)));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid event specified in request.");
        }

        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Event e = DAOUtil.getFactory().getEventDAO().find(eventId);
            getRequest().setAttribute("event", e);
            Calendar now = Calendar.getInstance();
            now.setTime(new Date());
            if (now.after(e.getRegistrationEnd())) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " is over.");
            } else if (now.before(e.getRegistrationStart())) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " has not yet begun.");
            } else {
                User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
                if (!isRegistered(e, u)) {
                    if (isEligible(e, u)) {
                        getRequest().setAttribute("event", e);
                        regProcessing(e, u);
                    } else {
                        throw new NavigationException("You are not eligible to register for the " + e.getDescription());
                    }
                } else {
                    //dont' have anything to do really
                }
                setNextPage(e, u);
            }
        }
    }
    
    protected boolean isRegistered(Event e, User u) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("checking if " + getUser().getId() + " is registered for " + e.getId());
        }

        Event curr;
        for (Iterator it = u.getEventRegistrations().iterator(); it.hasNext();) {
            curr = ((EventRegistration) it.next()).getId().getEvent();
            if (curr.getId() == e.getId()) {
                return true;
            }
        }
        return false;
    }
}
