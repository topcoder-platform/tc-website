/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.ViewRegistrantsBase;

/**
 * <p>Controller to handle TCO09 registrants page.</p>
 *
 * @author pulky
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration
 */
public class Registrants extends ViewRegistrantsBase {

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
     * This method redirects to TCO09 registrants page 
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
     * This method redirects to TCO09 registrants page 
     * </p>
     * 
     * @param e an <code>Event</code> to keep base class compatibility. This 
     * parameter is not used. 
     */
    @Override
    protected void setNextPage(Event e) {
        setNextPage(Constants.TCO09_REGISTRANTS_PAGE);
        setIsNextPageInContext(true);
    }
}