/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.ProjectDetailsBase;

/**
 * ToDo: revisit
 * <p>This class provides specific implementation for TCO09 project-based tracks leaderboards.</p>
 * <p>It will calculate points based on competition data and present the consolidated leaderboards.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration
 */
public class ProjectDetails extends ProjectDetailsBase {

    /**
     * <p>
     * An <code>int[]</code> containing the placement points for the corresponding Track
     * </p>
     */    
    private final int[] placementPoints = new int[]{10, 7, 5, 4, 0};
    
    /**
     * <p>
     * This method returns TCO09 component track placement points array 
     * </p>
     * 
     * @return <code>int[]</code> containing the TCO09 component track placement points
     */
    @Override
    public int[] getPlacementPoints() {
        return placementPoints;
    }

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
}
