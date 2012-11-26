/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.TCO10Constants;
import com.topcoder.web.tc.controller.request.tournament.ContestDetailsBase;

import java.util.Comparator;

/**
 * <p>This class provides specific implementation for TCO10 project-based tracks leaderboards.</p>
 * 
 * <p>This processor will calculate points based on competition data and present the consolidated leaderboard.</p>
 *
 * @author isv
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class ContestDetails extends ContestDetailsBase {

    /**
     * <p>
     * An <code>int[]</code> containing the placement points for the corresponding Track
     * </p>
     */    
    private static final int[] placementPoints = new int[] {10, 7, 5, 4, 0};

    /**
     * <p>
     * An <code>int</code> containing the maximum number of project to consider for cumulative score
     * </p>
     */    
    private final int MAX_NUMBER_PROJECTS = Integer.MAX_VALUE;

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
     * This method returns the number of contests to be considered for the cumulative placement scoring
     * </p>
     * 
     * @return <code>int</code> containing the number of contests to consider
     */
    @Override
    public int getMax() {
        return MAX_NUMBER_PROJECTS;
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
            return "/tournaments/" + getContestPrefix() + "/design/contestDetails.jsp";
        } else {
            return "/tournaments/" + getContestPrefix() + "/development/contestDetails.jsp";
        }
    }

    /**
     * <p>Checks if the <code>Digital Run</code> points are used for calculating the placement points for target event.
     *  </p>
     *
     * @return <code>true</code> if event is using DR placement points; <code>false</code> otherwise.
     */
    @Override
    protected boolean isUsingDRPlacementPoints() {
        return true;
    }

    /**
     * <p>Gets the placement points to be awarded to competitor who took specified place among specified total number of
     * submissions based on specified pool of <code>Digital Run</code> points for project.</p>
     *
     * @param place an <code>int</code> providing the placement for competitor's submission.
     * @param projectDRPool an <code>int</code> providing the total pool of <code>Digital Run</code> points set for the
     *        target project.
     * @param submissionsCount an <code>int</code> providing the total number of submissions for project.
     * @return an <code>int</code> providing the placement points to be awarded to submitter.
     * @throws UnsupportedOperationException always.
     */
    @Override
    protected int getDRPlacementPoints(int place, int projectDRPool, int submissionsCount) {
        return DRPlacementPointsCalculator.getDRPlacementPoints(place, projectDRPool, submissionsCount);
    }

    /**
     * <p>Gets the comparator for the results.</p>
     *
     * @return a <code>Comparator</code> to be used for sorting the results and resolving ties.
     */
    @Override
    protected Comparator getComparator() {
        return new ComponentResultsComparator();
    }
}
