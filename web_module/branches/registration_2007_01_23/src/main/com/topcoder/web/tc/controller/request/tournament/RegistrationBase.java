package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.tag.ListSelectTag;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2007
 */
public abstract class RegistrationBase extends ShortHibernateProcessor {

    protected static final Integer HIGH_SCHOOL_REGION_TYPE = new Integer(1);
    public static final String AGE = "age";
    public static final String IN_COLLEGE = "incollege";
    public static final String IN_HIGH_SCHOOL = "inhs";

    public static final List YES_NO_ANSWERS;

    static {
        YES_NO_ANSWERS = new ArrayList();
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(true), "Yes"));
        YES_NO_ANSWERS.add(new ListSelectTag.Option(String.valueOf(false), "No"));
    }

    protected abstract void regProcessing(Event event, User user);

    protected abstract void alreadyRegisteredProcessing(EventRegistration er);

    protected abstract void setNextPage(Event event, User user);

    public abstract boolean isEligible(Event event, User user) throws Exception;

    protected abstract String getEventShortDesc();

    protected void dbProcessing() throws Exception {
        if (getUser().isAnonymous()) {
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
                log.info("1");
                if (!alreadyRegistered(e, u)) {
                    log.info("2");
                    if (isEligible(e, u)) {
                        log.info("3");
                        getRequest().setAttribute("event", e);
                        log.info("4");
                        regProcessing(e, u);
                        log.info("5");
                    } else {
                        throw new NavigationException("You are not eligible to register for the " + e.getDescription());
                    }
                } else {
                    log.info("6");
                    alreadyRegisteredProcessing(er);
                    log.info("7");
                }
                setNextPage(e, u);
            }
        }
    }
    
    public boolean alreadyRegistered(Event e, User u) {
        return u.getEventRegistration(e) != null;
    }
    
    public Event getEvent() {
        return DAOUtil.getFactory().getEventDAO().find(getEventShortDesc());
    }   

    public User getActiveUser() {
        return getUser().isAnonymous() ? null : DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
    }   
}
