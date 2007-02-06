package com.topcoder.web.tc.controller.request.tournament;

import java.util.Calendar;
import java.util.Date;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {

    protected static final Integer HIGH_SCHOOL_REGION_TYPE = new Integer(1);
    protected static final String AGE = "age";
    protected static final String IN_COLLEGE = "incollege";
    protected static final String IN_HIGH_SCHOOL = "inhs";

    protected abstract void regProcessing(Event event, User user);

    protected abstract void alreadyRegisteredProcessing(EventRegistration er);

    protected abstract void setNextPage(Event event, User user);

    protected abstract boolean isEligible(Event event, User user) throws Exception;

    protected abstract String getEventShortDesc();

    protected void dbProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Event e = DAOUtil.getFactory().getEventDAO().find(getEventShortDesc());
            getRequest().setAttribute("event", e);
            Calendar now = Calendar.getInstance();
            now.setTime(new Date());
            if (now.after(e.getRegistrationEnd())) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " is over.");
            } else if (now.before(e.getRegistrationStart())) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " has not yet begun.");
            } else {
                User u = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
                EventRegistration er = u.getEventRegistration(e);
                if (u.getEventRegistration(e) == null) {
                    if (isEligible(e, u)) {
                        getRequest().setAttribute("event", e);
                        regProcessing(e, u);
                    } else {
                        throw new NavigationException("You are not eligible to register for the " + e.getDescription());
                    }
                } else {
                    alreadyRegisteredProcessing(er);
                }
                setNextPage(e, u);
            }
        }
    }
}
