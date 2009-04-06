/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.onsite.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.BaseProcessor;
import java.util.Map;
import com.topcoder.web.onsite.controller.request.WagerHelper;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve competitions to wager on.
 * 
 * @author pulky
 * @version 1.0
 */
public class ViewCompetitions extends BaseProcessor {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(ViewCompetitions.class);

    /**
     * Retrieves data from the DB to show current competitions.
     *
     * @param userId the user ID waggering
     *
     * @return a Map with the retrieved ResultSetContainers.
     */
    private Map getViewCompetitionsData(long userId) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.VIEW_WAGER_COMPETITIONS_COMMAND);
        request.setProperty(Constants.USER_ID, String.valueOf(userId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

        return dai.getData(request);
    }

    /**
     * Process the view competitions request.
     * Retrieves current competition from the DB to wager on and also historic waggering information.
     */
    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        
        Map m = getViewCompetitionsData(getUser().getId());
        ResultSetContainer currentComp = (ResultSetContainer)m.get(Constants.ACTUAL_TCO_CONTESTS_QUERY);

        log.debug("Got " +  currentComp.size() + " rows for current contests");
        log.debug("Got " +  ((ResultSetContainer)m.get(Constants.WAGER_HISTORY_QUERY)).size() + 
            " rows for old wagers");

        getRequest().setAttribute(Constants.CURRENT_COMPETITION_RESULT_KEY, m.get(Constants.ACTUAL_TCO_CONTESTS_QUERY));        
        getRequest().setAttribute(Constants.WAGER_HISTORY_KEY, m.get(Constants.WAGER_HISTORY_QUERY));        
        getRequest().setAttribute(Constants.MIN_WAGER_AMOUNT_KEY, String.valueOf(WagerHelper.getMinWagerAmount()));
        getRequest().setAttribute(Constants.MAX_WAGER_AMOUNT_KEY, 
            String.valueOf(WagerHelper.getMaxWagerAmount(getUser().getId())));
        
        if (currentComp != null && currentComp.size() > 0) {
            setDefault(Constants.PROJECT_ID_KEY, currentComp.getStringItem(0, "project_id"));
            setDefault(Constants.MODULE_KEY, "SubmitWager");
        }
        
        setNextPage(Constants.VIEW_COMPETITIONS_PAGE);
        setIsNextPageInContext(true);
    }
}
