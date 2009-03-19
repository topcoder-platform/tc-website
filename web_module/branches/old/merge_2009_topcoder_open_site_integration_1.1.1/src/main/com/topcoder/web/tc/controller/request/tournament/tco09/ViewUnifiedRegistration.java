/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.UnifiedRegistrationBase;

/**
 * <p>This class provides specific implementation for TCO09 tournament registration.</p>
 * <p>It will show registration terms of use and ask user for agreement.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration
 */
public class ViewUnifiedRegistration extends UnifiedRegistrationBase {

    /**
     * <p>
     * This method returns TCO09 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO09 short description
     */
    @Override
    protected final String getEventShortDesc() {
        return Constants.TCO09_SHORT_DESC;
    }
    
    /**
     * <p>
     * This method processes TCO09 registration. 
     * </p>
     * 
     * @param event an <code>Event</code> containing TCO09 event.
     * @param user an <code>User</code> containing active user.
     * 
     * @throws TCWebException if there are processing errors. 
     */
    @Override
    protected void regProcessing(Event event, User user) throws TCWebException {
        // we are viewing the registration terms, nothing to do here.
    }

    /**
     * <p>
     * This method redirects to TCO09 pages according to registration status. 
     * </p>
     * 
     * @param er an <code>EventRegistration</code> containing active user's 
     * event registration.
     */
    @Override
    protected void setNextPage(EventRegistration er) {
        if (er != null) {
            // the user is already registered
            setNextPage(Constants.TCO09_TERMS_SUCCESS_PAGE);
        } else {
            // the user is not registered, show him the terms page
            setNextPage(Constants.TCO09_TERMS_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
