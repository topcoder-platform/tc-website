/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco09;

import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import com.topcoder.web.tc.controller.request.tournament.StudioLeaderBoardRow;

/**
 * <p>This class provides a custom comparator for leaderboard sorting before rank assignment.</p>
 * <p>It takes into consideration the global scoring rule as well as the tiebreaker.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1.1
 */
public class StudioLeaderBoardComparator implements Comparator<StudioLeaderBoardRow> {

    /**
     * <p> This method returns a custom comparator for competitors results to be applied before ranking.</p>
     *
     * <p>TCO09 Rules state that placement is determined by:
     *     <ol>
     *         <li>The highest cumulative placement score for eligible contests.</li>
     *         <li>In case of a tie in rule #1, The Competitor who has the most higher-placed submissions in
                   Tournament-eligible contests.</li>
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
            // The Competitor who has the most higher-placed submissions in Tournament-eligible contests.
            List<Integer> arg0Placements = arg0.getPlacements();
            List<Integer> arg1Placements = arg1.getPlacements();
            Collections.sort(arg0Placements);
            Collections.sort(arg1Placements);

            Iterator<Integer> it0 = arg0Placements.iterator();
            Iterator<Integer> it1 = arg1Placements.iterator();
            while (it0.hasNext() && it1.hasNext() && result == 0) {
                Integer place0 = it0.next();
                Integer place1 = it1.next();
                result = place0.compareTo(place1);
            }

            if (result == 0) {
                // check if it's because they are tied or they have different number of placement scores.
                if (!it0.hasNext() && it1.hasNext()) {
                    return 1;
                }
                if (!it1.hasNext() && it0.hasNext()) {
                    return -1;
                }
            }
        }
        return result;
    }
}
