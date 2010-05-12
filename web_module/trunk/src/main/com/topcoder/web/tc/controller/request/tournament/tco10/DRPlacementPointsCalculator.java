/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

/**
 * <p>An utility class providing the method foc caluclating the placement points based on <code>Digital Run</code>
 * point awarding schema.</p>
 *
 * @author isv
 * @version 1.0
 */
class DRPlacementPointsCalculator {

    /**
     * <p>An <code>int</code> array listing the percentages for calculating <code>Digital Run</code> placement points
     * based on number of passing submissions for project.</p>
     */
    private static int[][] digitalRunPointsMatrix = {
            {100, 0, 0, 0, 0},
            {70, 30, 0, 0, 0},
            {65, 25, 10, 0, 0},
            {60, 22, 10, 8, 0},
            {56, 20, 10, 8, 6}};

    /**
     * <p>Constructs new <code>DRPlacementPointsCalculator</code> instance. This implementation does nothing.</p>
     */
    private DRPlacementPointsCalculator() {
    }

    /**
     * <p>Gets the placement points to be awarded to competitor who took specified place among specified total number of
     * submissions based on specified pool of <code>Digital Run</code> points for project.</p>
     *
     * @param place an <code>int</code> providing the placement for competitor's submission (1-based).
     * @param projectDRPool an <code>int</code> providing the total pool of <code>Digital Run</code> points set for the
     *        target project.
     * @param submissionsCount an <code>int</code> providing the total number of submissions for project.
     * @return an <code>int</code> providing the placement points to be awarded to submitter.
     * @throws UnsupportedOperationException always.
     */
    static int getDRPlacementPoints(int place, int projectDRPool, int submissionsCount) {
        submissionsCount = Math.min(submissionsCount, 5);
        if (submissionsCount <= 0) {
            return 0;
        }
        place--;
        if (place < 0) {
            return 0;
        }
        int[] points = digitalRunPointsMatrix[submissionsCount - 1];
        if (place < points.length) {
            int percent = points[place];
            return Math.round(projectDRPool * percent / 100F);
        } else {
            return 0;
        }
    }
}
