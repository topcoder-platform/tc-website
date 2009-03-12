/**
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.controller.request.tournament.ContestDetailsBase;

/** 
 * Controller class for Online Competitions Contest details view. All business
 * logic is done by super class. This class provides concrete implementation
 * for ProjectDetailsBase abstract methods needed to use this controller in TCO 09
 * context.
 * 
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
 */
public class ContestDetails extends ContestDetailsBase {
    
    /**
     * Controller context.
     */
    private final String CONTEST_PREFIX = "tco09";

    /**
     * Placement points for places 1 to 5.
     */
    private final int[] placementPoints = new int[]{10, 7, 5, 4, 0};

    /**
     * Defines how many fields should be taken into consideration when 
     * determining final score. 
     */
    private final int MAX_NUMBER_PROJECTS = 5;

    
    /**
     * Returns array defining how many placement point should be given.
     * @return placement points array
     */
    @Override
    public int[] getPlacementPoints() {
        return placementPoints;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.ContestDetailsBase#getMax()
     */
    @Override
    public int getMax() {
        return MAX_NUMBER_PROJECTS;
    }

    /**
     * Returns integer defining how many fields should be taken into 
     * consideration when determining final score.
     *  
     * @return number of contest to be taken into consideration 
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
        return "/tournaments/" + getContestPrefix() + "/online/contestDetails.jsp";
    }

}