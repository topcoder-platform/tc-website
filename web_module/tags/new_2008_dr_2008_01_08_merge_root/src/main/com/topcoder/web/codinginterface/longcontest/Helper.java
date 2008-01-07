package com.topcoder.web.codinginterface.longcontest;

import com.topcoder.web.codinginterface.longcontest.Constants;

public class Helper {

    /**
     * Return the name to display for a round
     * 
     * @return
     */
    public static String displayName(int roundTypeId, String contestName, String roundName) {
        if (roundTypeId == Constants.LONG_ROUND_TOURNAMENT_TYPE_ID) {
            return contestName + " " + roundName;
        }
        return roundName;
    }
}
