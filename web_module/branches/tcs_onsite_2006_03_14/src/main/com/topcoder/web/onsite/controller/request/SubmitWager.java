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
    private Map getValidationData(long userId) throws Exception {
        Request request = new Request();
        request.setContentHandle(Constants.WAGER_SUBMITION_VALIDATION_COMMAND);
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
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, Constants.INVALID_WAGER_FORMAT_MESSAGE);
            return;
        }

        log.debug("Wager amount: " + wagerAmount);
        
        // Minimum wager amount validation
        if (wagerAmount < Constants.MIN_WAGER_AMOUNT) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                Constants.MIN_WAGER_AMOUNT_MESSAGE + " " + Constants.MIN_WAGER_AMOUNT + ".");
            return;
        }        

        Map m = getValidationData(getUser().getId());
        ResultSetContainer comp = (ResultSetContainer) m.get(
            Constants.ACTUAL_TCO_CONTESTS_QUERY);
            
            
        int remainingCompetitions = ((ResultSetContainer) m.get(
            Constants.REMAINING_TCO_CONTESTS_QUERY)).getIntItem(0, "remaining_contests");

        // Validates that the project is current and allowed to wager on
        if (comp.size() == 0 || projectId != comp.getLongItem(0, "project_id")) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                Constants.INVALID_PROJECT_MESSAGE);
            return;
        }
        
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
        
        if (wagerAmount > maxWagerAmount) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
                Constants.MAX_WAGER_AMOUNT_MESSAGE + " " + maxWagerAmount + ".");
            return;
        }

        // Finally adds wager
        try {
            addWager(projectId, getUser().getId(), wagerAmount);
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(BaseServlet.MESSAGE_KEY, 
            Constants.SUCCESSFULL_WAGER_MESSAGE);
    }
}
