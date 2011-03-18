/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco11;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.TCO11Constants;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrantsBase;

/**
 * <p>Controller to handle <code>2011 TCO</code> registrants page.</p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class Registrants extends ViewRegistrantsBase {

    /**
     * <p>
     * This method returns TCO11 short description.
     * </p>
     *
     * @return <code>String</code> containing the TCO11 short description
     */
    @Override
    protected final String getEventShortDesc() {
        return TCO11Constants.TCO11_SHORT_DESC;
    }

    /**
     * <p>
     * This method redirects to TCO11 registrants page
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
     * This method redirects to TCO11 registrants page
     * </p>
     *
     * @param e an <code>Event</code> to keep base class compatibility. This
     * parameter is not used.
     */
    @Override
    protected void setNextPage(Event e) {
        setNextPage(TCO11Constants.TCO11_REGISTRANTS_PAGE);
        setIsNextPageInContext(true);
    }
}
