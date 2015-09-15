/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament.tco10;

import com.topcoder.web.tc.model.UserContestDetail;

import java.util.Comparator;
import java.util.List;

/**
 * <p>A comparator for results for <code>Design</code> and <code>Development</code> tracks of <code>TCO 2010</code>
 * tournament.</p>
 *
 * @author isv
 * @version 1.0
 */
class ComponentResultsComparator implements Comparator {

    /**
     * <p>Constructs new <code>ComponentResultsComparator</code> instance. This implementation does nothing.</p>
     */
    ComponentResultsComparator() {
    }

    public int compare(Object o1, Object o2) {
        UserContestDetail a1 = (UserContestDetail) o1;
        UserContestDetail a2 = (UserContestDetail) o2;

        int result = (a2.getPoints() - a1.getPoints());
        if (result == 0) {
            List<Integer> arg0Placements = a1.getPlacements();
            List<Integer> arg1Placements = a2.getPlacements();

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

            // Compare by number of 3rd place submissions
            int place3_1 = countPlacements(arg0Placements, 3);
            int place3_2 = countPlacements(arg1Placements, 3);
            if (place3_1 != place3_2) {
                return place3_2 - place3_1;
            }

            // Compare by number of 4th place submissions
            int place4_1 = countPlacements(arg0Placements, 4);
            int place4_2 = countPlacements(arg1Placements, 4);
            if (place4_1 != place4_2) {
                return place4_2 - place4_1;
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
