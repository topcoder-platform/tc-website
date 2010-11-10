/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

import java.util.Comparator;
import java.util.List;

import com.topcoder.web.tc.controller.request.tournament.StudioLeaderBoardRow;

/**
 * <p>This class provides a custom comparator for leaderboard sorting before rank assignment.</p>
 * <p>It takes into consideration the global scoring rule as well as the tiebreaker.</p>
 *
 * @author isv
 * @version 1.0 (2010 TCO WebSite Release assembly v1.0)
 */
public class StudioLeaderBoardComparator implements Comparator<StudioLeaderBoardRow> {

    /**
     * <p> This method returns a custom comparator for competitors results to be applied before ranking.</p>
     *
     * <p>TCO10 Rules state that placement is determined by:
     *     <ol>
     *         <li>The highest cumulative placement score for eligible contests.</li>
     *         <li>In case of a tie in rule #1, the Competitor who has the most number of 1st place taken.</li>
     *         <li>In case of a tie in rule #2, the Competitor who has the most number of 2nd place taken.</li>
     *     </ol>
     * </p>
     *
     * @param arg0 the first <code>StudioLeaderBoardRow</code> to be compared.
     * @param arg1 the second <code>StudioLeaderBoardRow</code> to be compared.
     * @return <code>int</code> containing a negative integer, zero, or a positive integer as the relative placement
     * of the first argument is less than, equal to, or greater than the relative placement of the second.
     */
    public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
        // The highest cumulative placement score for eligible contests.
        int result = arg1.getBestPoints().compareTo(arg0.getBestPoints());
        if (result == 0) {
            List<Integer> arg0Placements = arg0.getPlacements();
            List<Integer> arg1Placements = arg1.getPlacements();

            // Compare by number of 1st place submissions
            int place1_1 = countPlacements(arg0Placements, 1);
            int place1_2 = countPlacements(arg1Placements, 1);
            if (place1_1 != place1_2) {
                return place1_2 - place1_1;
            }

            // Compare by number of 2nd place submissions
            int place2_1 = countPlacements(arg0Placements, 2);
            int place2_2 = countPlacements(arg1Placements, 2);
            if (place2_1 != place2_2) {
                return place2_2 - place2_1;
            }
        }
        return result;
    }

    /**
     * <p>Counts the number of times the specified placement was taken by the user for the contests he submitted to.</p>
     *
     * @param placements a <code>List</code> listing the placements for all contests user submitted to.
     * @param placement an <code>int</code> providing the placement to count for.
     * @return an <code>int</code> providing the number of times the specified placement was taken by the user.
     */
    private int countPlacements(List<Integer> placements, int placement) {
        int cnt = 0;
        for (Integer p : placements) {
            if (p == placement) {
                cnt++;
            }
        }
        return cnt;
    }
}
