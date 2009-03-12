/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.controller.request.tournament.ProjectDetailsBase;

/** 
 * Controller class for Online Competitions Project Details view. All business
 * logic is done by super class. This class provides concrete implementation
 * for ProjectDetailsBase abstract methods needed to use this controller in TCO 09
 * context.
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class ProjectDetails extends ProjectDetailsBase {

    /**
     * Controller context.
     */
    private final String CONTEST_PREFIX = "tco09";

    /**
     * Placement points for places 1 to 5.
     */
    private final int[] placementPoints = new int[]{10, 7, 5, 4, 0};
    
    /**
     * Returns array defining how many placement point should be given.
     * @return placement points array
     */
    @Override
    public int[] getPlacementPoints() {
        return placementPoints;
    }

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
        return "/tournaments/" + getContestPrefix() + "/online/projectDetails.jsp";
    }

}
