package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.tc.Constants;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * @author dok, pulky
 * @version $Revision: 67861 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {

    protected static final Integer HIGH_SCHOOL_REGION_TYPE = new Integer(1);
    public static final String AGE = "age";
    public static final String RESIDENT = "resident";
    public static final String IN_COLLEGE = "incollege";
    public static final String IN_HIGH_SCHOOL = "inhs";

    public static final List YES_NO_ANSWERS;

    static {
        YES_NO_ANSWERS = new ArrayList();
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(false), "No"));
    }

    public static final List TCO_COMPETITION_TYPES;

    static {
        TCO_COMPETITION_TYPES = new ArrayList();
        TCO_COMPETITION_TYPES.add("algorithm");
        TCO_COMPETITION_TYPES.add("component");
        TCO_COMPETITION_TYPES.add("marathon");
        TCO_COMPETITION_TYPES.add("studio");
    }

    protected abstract void regProcessing(Event event, User user) throws TCWebException;

    protected abstract void alreadyRegisteredProcessing(EventRegistration er);

    protected abstract void setNextPage(Event event, User user);

    public abstract boolean isEligible(Event event, User user) throws Exception;

    protected String getEventShortDesc() {
        return getEvent().getShortDescription();
    }

    protected void dbProcessing() throws Exception {
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            Event e = getEvent();
            getRequest().setAttribute("event", e);
            Calendar now = Calendar.getInstance();
            now.setTime(new Date());
            Calendar regStart = new GregorianCalendar();
            regStart.setTime(e.getRegistrationStart());
            Calendar regEnd = new GregorianCalendar();
            regEnd.setTime(e.getRegistrationEnd());

            if (now.after(regEnd)) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " is over.");
            } else if (now.before(regStart)) {
                throw new NavigationException("The registration period for the " + e.getDescription() + " has not yet begun.");
            } else {
                User u = getActiveUser();
                EventRegistration er = u.getEventRegistration(e);
                if (!alreadyRegistered(e, u)) {
                    if (isEligible(e, u)) {
                        getRequest().setAttribute("event", e);
                        regProcessing(e, u);
                    } else {
                        if (getIneligibleRedirect() != null) {
                            setNextPage(getIneligibleRedirect());
                            setIsNextPageInContext(true);
                            return;
                        } else {
                            throw new NavigationException("You are not eligible to register for the " + e.getDescription());
                        }
                    }
                } else {
                    alreadyRegisteredProcessing(er);
                }
                setNextPage(e, u);
            }
        }
    }

    public boolean alreadyRegistered(Event e, User u) {
        return u.getEventRegistration(e) != null;
    }

    public Event getEvent() {
        String eventId = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_ID));
        if ("".equals(eventId)) {
            log.warn("event id missing, attempting to use short description");
            return DAOUtil.getFactory().getEventDAO().find(getEventShortDesc());
        } else {
            return DAOUtil.getFactory().getEventDAO().find(new Long(eventId));
        }
    }

    public User getActiveUser() {
        return getUser().isAnonymous() ? null : DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
    }

    protected String getIneligibleRedirect() {
        return null;
    }
}
