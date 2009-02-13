/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.onsite.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import java.util.Map;

/**
 * <strong>Purpose</strong>:
 * Helper class to validate wager amounts.
 * 
 * @author pulky
 * @version 1.0
 */
class WagerHelper {
    
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(WagerHelper.class);
    
    /**
     * Retrieves data from the DB to validate the wager.
     *
     * @param userId the user ID waggering
     *
     * @return a Map with the retrieved ResultSetContainers.
     */
    private static Map getValidationData(long userId) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.WAGER_SUBMITION_VALIDATION_COMMAND);
        request.setProperty(Constants.USER_ID, String.valueOf(userId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

        return dai.getData(request);
    }
    
    /**
     * Retrieves minimum wager amount allowed.
     *
     * For now it's the constant defined.
     *
     * @return the minimum wager amount.
     */    
    protected static int getMinWagerAmount() {
        return (Constants.MIN_WAGER_AMOUNT);
    }

    /**
     * Retrieves maximum wager amount allowed.
     *
     * Taking the fixed maximum, used points and remaining competitions, calculates the real maximum wager.
     *
     * @param userId the user ID waggering
     *
     * @return the maximum wager amount.
     */  
    protected static int getMaxWagerAmount(long userId) throws Exception {
        Map m = getValidationData(userId);

        int remainingCompetitions = ((ResultSetContainer) m.get(
        Constants.REMAINING_TCO_CONTESTS_QUERY)).getIntItem(0, "remaining_contests");
                    
        Object usedPoints = ((ResultSetContainer) m.get(
            Constants.USED_WAGER_POINTS_QUERY)).getItem(0, "used_points").getResultData();
        
        int remainingPoints = Constants.TOTAL_WAGER_POINTS;
        if (usedPoints != null) {
            remainingPoints = remainingPoints - ((Number) usedPoints).intValue();
        }
 
        // With the remaining competitions, used points and maximum wager amount constraint, calculates the real
        // maximum valid wager amount
        int maxWagerAmount = remainingPoints - ((remainingCompetitions - 1) * Constants.MIN_WAGER_AMOUNT);
        maxWagerAmount = maxWagerAmount < Constants.MAX_WAGER_AMOUNT ? maxWagerAmount : Constants.MAX_WAGER_AMOUNT;
        
        log.debug("Remaining competitions: " + remainingCompetitions);
        log.debug("Remaining points: " + remainingPoints);
        log.debug("Max wager amount allowed: " + maxWagerAmount);
        
        return maxWagerAmount;
    }
}
