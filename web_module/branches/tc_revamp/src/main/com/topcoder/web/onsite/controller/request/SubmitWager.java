/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.onsite.controller.request;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.onsite.Constants;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.project.ProjectWagerLocal;
import com.topcoder.web.ejb.project.ProjectWager;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import java.util.Map;
import com.topcoder.web.onsite.controller.request.WagerHelper;

/**
 * <strong>Purpose</strong>:
 * A processor to validate and process wager submissions.
 * 
 * @author pulky
 * @version 1.0
 */
public class SubmitWager extends BaseProcessor {

    /**
     * The logger to log to.
     */
     private static final Logger log = Logger.getLogger(SubmitWager.class);

    /**
     * Adds a particular wager to DB.
     *
     * @param projectId the project ID to wager on
     * @param userId the user ID waggering
     * @param wagerAmount the amount of the wager
     */
    private void addWager(long projectId, long userId, int wagerAmount) throws Exception {
        ProjectWagerLocal projectWagerLocal = (ProjectWagerLocal) createLocalEJB(
            getInitialContext(), ProjectWager.class); 
        projectWagerLocal.createProjectWager(projectId, userId, wagerAmount, DBMS.TCS_OLTP_DATASOURCE_NAME);
    }
    
    /**
     * Retrieves data from the DB to validate the wager.
     *
     * @param userId the user ID waggering
     *
     * @return a Map with the retrieved ResultSetContainers.
     */
    private Map getContestsData(long userId) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.ACTUAL_CONTESTS_COMMAND);
        request.setProperty(Constants.USER_ID, String.valueOf(userId));
        DataAccessInt dai = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);

        return dai.getData(request);
    }

    /**
     * Process the wager submission request.
     * Validates several Business Rules and adds wager to the DB.
     */
    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        setNextPage(Constants.WAGER_RESULT_PAGE);
        setIsNextPageInContext(true);
        
        // Project ID format validation
        long projectId;
        try {
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID_KEY));
        } catch (NumberFormatException nfe) {
            log.debug("This should never happen. (cannot parse project ID: " + 
                getRequest().getParameter(Constants.PROJECT_ID_KEY) + ")");
            throw(new TCWebException(nfe));
        }
        
        // Wager amount format validation
        int wagerAmount;
        try {
            wagerAmount = Integer.parseInt(getRequest().getParameter(Constants.WAGER_AMOUNT_KEY));
        } catch (NumberFormatException nfe) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "The wager amount is not a valid number.");
            return;
        }

        log.debug("Wager amount: " + wagerAmount);
        
        Map m = getContestsData(getUser().getId());
        ResultSetContainer comp = (ResultSetContainer) m.get(
            Constants.ACTUAL_TCO_CONTESTS_QUERY);
            
        // Validates that the project is current and allowed to wager on
        if (comp.size() == 0 || projectId != comp.getLongItem(0, "project_id")) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                "You do not have permission to wager on the selected project.");
            return;
        }

        // Minimum wager amount validation
        int minWagerAmount = WagerHelper.getMinWagerAmount();
        if (wagerAmount < minWagerAmount) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                "The wager amount cannot be lower than " + minWagerAmount + ".");
            return;
        }        

        // Maximum wager amount validation
        int maxWagerAmount = WagerHelper.getMaxWagerAmount(getUser().getId());
        if (wagerAmount > maxWagerAmount) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                "The wager amount cannot be greater than " + maxWagerAmount + ".");
            return;
        }

        // Finally adds wager
        try {
            addWager(projectId, getUser().getId(), wagerAmount);
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
            "The wager was processed successfully.");
    }
}
