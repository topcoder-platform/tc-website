/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.ContestProjectsBase;

/**
 * <p>This class provides specific implementation for TCO09 project-based tracks leaderboards.</p>
 * <p>This processor will present a list of projects included in the tournament track.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1
 */
public class ContestProjects extends ContestProjectsBase {

    /**
     * <p>
     * This method returns TCO09 short description. 
     * </p>
     * 
     * @return <code>String</code> containing the TCO09 short description
     */
    @Override
    protected String getContestPrefix() {
        return Constants.TCO09_SHORT_DESC;
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
        return "/tournaments/" + getContestPrefix() + "/online/contestProjects.jsp";
    }
}
