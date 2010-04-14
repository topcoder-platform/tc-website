/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.TCO10Constants;
import com.topcoder.web.tc.controller.request.tournament.ContestProjectsBase;

/**
 * <p>This class provides specific implementation for TCO10 project-based tracks leaderboards.</p>
 * <p>This processor will present a list of projects included in the tournament track.</p>
 *
 * @author isv
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class ContestProjects extends ContestProjectsBase {

    /**
     * <p>
     * This method returns TCO10 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO10 short description
     */
    @Override
    protected String getContestPrefix() {
        return TCO10Constants.TCO10_SHORT_DESC;
    }
    
    /**
     * <p>
     * This method returns the path of the JSP to show
     * </p>
     * 
     * @return <code>String</code> containing the JSP's path
     */
    @Override
    protected String getPageName() {
        String ct = getRequest().getParameter(Constants.CONTEST_ID);
        if (String.valueOf(TCO10Constants.TCO10_DESIGN_TRACK_ID).equals(ct)) {
            return "/tournaments/" + getContestPrefix() + "/design/contestProjects.jsp";
        } else {
            return "/tournaments/" + getContestPrefix() + "/development/contestProjects.jsp";
        }
    }
}
