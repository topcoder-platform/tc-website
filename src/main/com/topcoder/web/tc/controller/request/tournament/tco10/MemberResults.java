/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

import com.topcoder.web.tc.TCO10Constants;
import com.topcoder.web.tc.controller.request.tournament.MemberResultsBase;

/**
 * <p>This class provides specific implementation for TCO10 project-based tracks leaderboards.</p>
 * <p>This processor will present the list of projects for a particular competitor including placement points.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class MemberResults extends MemberResultsBase {

    /**
     * <p>
     * An <code>int[]</code> containing the placement points for the corresponding Track
     * </p>
     */    
    private final int[] placementPoints = new int[]{10, 7, 5, 4, 0};
    
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
     * This method returns TCO10 component track placement points array 
     * </p>
     * 
     * @return <code>int[]</code> containing the TCO10 component track placement points
     */
    @Override
    public int[] getPlacementPoints() {
        return placementPoints;
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
        return "/tournaments/" + getContestPrefix() + "/online/memberResults.jsp";
    }
}
