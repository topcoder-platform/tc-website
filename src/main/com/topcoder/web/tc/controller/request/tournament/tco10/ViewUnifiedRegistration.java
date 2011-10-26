/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.TCO10Constants;
import com.topcoder.web.tc.controller.request.tournament.UnifiedRegistrationBase;

/**
 * <p>This class provides specific implementation for TCO10 tournament registration.</p>
 * 
 * <p>It will show registration terms of use and ask user for agreement.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class ViewUnifiedRegistration extends UnifiedRegistrationBase {

    /**
     * <p>Constructs new <code>ViewUnifiedRegistration</code> instance. This implementation does nothing.</p>
     */
    public ViewUnifiedRegistration() {
    }

    /**
     * <p>
     * This method returns TCO10 short description.
     * </p>
     *
     * @return <code>String</code> containing the TCO10 short description
     */
    @Override
    protected final String getEventShortDesc() {
        return TCO10Constants.TCO10_SHORT_DESC;
    }

    /**
     * <p>
     * This method processes TCO10 registration.
     * </p>
     *
     * @param event an <code>Event</code> containing TCO10 event.
     * @param user  an <code>User</code> containing active user.
     * @throws TCWebException if there are processing errors.
     */
    @Override
    protected void regProcessing(Event event, User user) throws TCWebException {
        // we are viewing the registration terms, nothing to do here.
    }

    /**
     * <p>
     * This method redirects to TCO10 pages according to registration status.
     * </p>
     *
     * @param er an <code>EventRegistration</code> containing active user's
     *           event registration.
     */
    @Override
    protected void setNextPage(EventRegistration er) {
        if (er != null) {
            // the user is already registered
            setNextPage(TCO10Constants.TCO10_TERMS_SUCCESS_PAGE);
        } else {
            // the user is not registered, show him the terms page
            setNextPage(TCO10Constants.TCO10_TERMS_PAGE);
        }
        setIsNextPageInContext(true);
    }
}
