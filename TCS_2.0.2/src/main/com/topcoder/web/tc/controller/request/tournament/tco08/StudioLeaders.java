/*
* StudioLeaderboard
*
* Created Jul 31, 2007
*/
package com.topcoder.web.tc.controller.request.tournament.tco08;

import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import com.topcoder.web.tc.controller.request.tournament.StudioLeaderBoardRow;
import com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class StudioLeaders extends StudioLeaderboardBase {

    private int[] placementPoints = new int[]{17, 15, 13, 10, 7};

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getContestPrefix()
     */
    @Override
    protected String getContestPrefix() {
        return "tco08";
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getMaxContests()
     */
    @Override
    protected int getMaxContests() {
        return 6;
    }
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.tournament.StudioLeaderboardBase#getPlacementPoints()
     */
    @Override
    protected int getPlacementPoints(int contestPlace) {
        if (contestPlace <= placementPoints.length) {
            return placementPoints[contestPlace - 1];
        }
        return 0;
    }
    
    /**
     * Protected method to define the comparision between competitors results before ranking 
     * 
     * @return a StudioLeaderBoardRow comparator
     */
    protected Comparator<StudioLeaderBoardRow> getComparator() {
        return new Comparator<StudioLeaderBoardRow>() {
            public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
                
                int result = arg1.getBestPoints().compareTo(arg0.getBestPoints());
                if (result == 0) {
                    // The competitor who has the most higher-placed submissions among 
                    // those submissions used to develop the cumulative placement score 
                    // for the tied competitors shall advance.
                    List<Integer> arg0Placements = arg0.getPlacements();
                    List<Integer> arg1Placements = arg1.getPlacements();
                    Collections.sort(arg0Placements);
                    Collections.sort(arg1Placements);
                    
                    Iterator<Integer> it0 = arg0Placements.iterator();
                    Iterator<Integer> it1 = arg1Placements.iterator();
                    
                    int i = 0;
                    while (it0.hasNext() && it1.hasNext() && result == 0 && i < getMaxContests()) {
                        Integer place0 = it0.next();
                        Integer place1 = it1.next();

                        result = place0.compareTo(place1);

                        i++;
                    }
                    if (result == 0) {
                        // check if it's because they are tied or they have different # of placements
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
        };  
    }
}
