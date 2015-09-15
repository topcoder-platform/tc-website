/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.TCO10Constants;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrantsBase;

/**
 * <p>Controller to handle <code>2010 TCO</code> registrants page.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class Registrants extends ViewRegistrantsBase {

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
     * This method redirects to TCO10 registrants page
     * </p>
     *
     * @param rsc a <code>ResultSetContainer</code> containing the retrieved data
     * about registrants.
     */
    @Override
    protected void setSortInfo(ResultSetContainer rsc) {
        SortInfo s = new SortInfo();
        s.addDefault(rsc.getColumnIndex("handle_lower"), "asc");
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }

    /**
     * <p>
     * This method redirects to TCO10 registrants page
     * </p>
     *
     * @param e an <code>Event</code> to keep base class compatibility. This
     * parameter is not used.
     */
    @Override
    protected void setNextPage(Event e) {
        setNextPage(TCO10Constants.TCO10_REGISTRANTS_PAGE);
        setIsNextPageInContext(true);
    }
}
