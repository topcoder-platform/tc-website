/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.controller.request.tournament.ContestProjectsBase;

/** 
 * Controller class for Online Competitions list of Projects view. All business
 * logic is done by super class. This class provides concrete implementation
 * for ProjectDetailsBase abstract methods needed to use this controller in TCO 09
 * context.
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class ContestProjects extends ContestProjectsBase {
    /**
     * Controller context.
     */
    private final String CONTEST_PREFIX = "tco09";

    /**
     * Returns controller context.
     * @return string holding controller context
     */
    @Override
    protected String getContestPrefix() {
        return CONTEST_PREFIX;
    }    
    
    /**
     * Returns path to JSP view page.
     * @return path to JSP view
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/online/contestProjects.jsp";
    }
}
