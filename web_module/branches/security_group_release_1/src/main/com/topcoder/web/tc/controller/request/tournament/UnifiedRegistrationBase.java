/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * <p>This class provides base functionality for simple-unified tournament registrations.
 * It's a simplified version of <code>RegistrationBase</code> that eliminates all the overhead.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration
 */
public abstract class UnifiedRegistrationBase extends ShortHibernateProcessor {

    /**
     * <p>
     * A <code>String</code> containing a fragment of a registration error.
     * </p>
     */    
    private static final String NOT_BEGUN = " has not yet begun.";

    /**
     * <p>
     * A <code>String</code> containing a fragment of a registration error.
     * </p>
     */    
    private static final String IS_OVER = " is over.";

    /**
     * <p>
     * A <code>String</code> containing a fragment of a registration error.
     * </p>
     */    
    private static final String REGISTRATION_PERIOD = "The registration period for the ";

    /**
     * <p>
     * This abstract method delegates retrieval of event's short description. 
     * </p>
     * 
     * @return <code>String</code> containing the event's short description
     */
    protected abstract String getEventShortDesc();
    
    /**
     * <p>
     * This abstract method delegates registration processing. 
     * </p>
     *
     * @param event an <code>Event</code> containing TCO09 event.
     * @param user an <code>User</code> containing active user.
     * @throws TCWebException if there are processing errors. 
     */
    protected abstract void regProcessing(Event event, User user) throws TCWebException;

    /**
     * <p>
     * This abstract method delegates page navigation. 
     * </p>
     * 
     * @param er an <code>EventRegistration</code> containing active user's 
     * event registration.
     */
    protected abstract void setNextPage(EventRegistration er);

    /**
     * <p>
     * This method is responsible to process the registration request. After checking 
     * user login status, it will verify the event is open and existing registration 
     * and delegate registration processing to sub classes.   
     * </p>
     * 
     * @throws Exception if there are processing errors. 
     */
    @Override
    protected void dbProcessing() throws Exception {
        // verify login status
        if (!userLoggedIn()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        } else {
            // look for event timeline
            Event e = getEvent();
            getRequest().setAttribute(Constants.EVENT, e);
            Calendar now = Calendar.getInstance();
            now.setTime(new Date());
            Calendar regStart = new GregorianCalendar();
            regStart.setTime(e.getRegistrationStart());
            Calendar regEnd = new GregorianCalendar();
            regEnd.setTime(e.getRegistrationEnd());

            // verify the event is open
            if (now.after(regEnd)) {
                throw new NavigationException(REGISTRATION_PERIOD + e.getDescription() + IS_OVER);
            } else if (now.before(regStart)) {
                throw new NavigationException(REGISTRATION_PERIOD + e.getDescription() + NOT_BEGUN);
            } else {
                User u = getActiveUser();
                EventRegistration er = u.getEventRegistration(e);
                if (er == null) {
                    // delegate registration processing
                    regProcessing(e, u);
                } else {
                    // no need to do anything, the request will be redirected to the success page
                }
                setNextPage(er);
            }
        }
    }

    /**
     * <p>
     * This helper method retrieves the event based on its short description.
     * <code>getEventShortDesc()</code> will delegate on sub classes to determine the description.   
     * </p>
     * 
     * @return <code>Event</code> containing the corresponding <code>Event</code>
     */
    public Event getEvent() {
        return DAOUtil.getFactory().getEventDAO().find(getEventShortDesc());
    }

    /**
     * <p>
     * This helper method retrieves the active user.
     * </p>
     * 
     * @return <code>User</code> containing the active user. Otherwise returns <code>null</code>.
     */
    public User getActiveUser() {
        return getUser().isAnonymous() ? null : DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));
    }
}
