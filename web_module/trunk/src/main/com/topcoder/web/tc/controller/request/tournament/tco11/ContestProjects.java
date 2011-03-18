/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco11;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.TCO11Constants;
import com.topcoder.web.tc.controller.request.tournament.ContestProjectsBase;

/**
 * <p>This class provides specific implementation for TCO11 project-based tracks leaderboards.</p>
 * <p>This processor will present a list of projects included in the tournament track.</p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class ContestProjects extends ContestProjectsBase {

    /**
     * <p>
     * This method returns TCO11 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO11 short description
     */
    @Override
    protected String getContestPrefix() {
        return TCO11Constants.TCO11_SHORT_DESC;
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
        if (String.valueOf(TCO11Constants.TCO11_DESIGN_TRACK_ID).equals(ct)) {
            return "/tournaments/" + getContestPrefix() + "/design/contestProjects.jsp";
        } else {
            return "/tournaments/" + getContestPrefix() + "/development/contestProjects.jsp";
        }
    }
}
