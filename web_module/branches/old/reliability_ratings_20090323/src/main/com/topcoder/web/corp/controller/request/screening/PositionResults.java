/*
 * TCS Screening Tool 1.1
 *
 * PositionResults.java
 *
 * 1.0 07/14/2004
 */
package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;

import java.util.Map;

/**
 * <p>A request pre-processor responsible to get the candidate results for the specified position and put them to
 * request for further rendering by the newly created <code>Position Results JSP</code>.</p>
 *
 * <p>This pre-processor guarantess that the user is provided with details for position which the user's company is
 * associated with.</p>
 *
 * @author  isv
 * @version 1.0 07/14/2004
 * @since   Screening Tool 1.1
 */
public class PositionResults extends BaseScreeningProcessor {

    /**
     * A <code>Logger</code> to log the <code>PositionResults</code> processor activities.
     */
    private final static Logger log = Logger.getLogger(PositionResults.class);

    /**
     * A main method of <code>PositionResults</code> processor. The method expects the position ID to be provided with
     * request. If such an ID is missing then a <code>ScreeningException</code> is thrown. Otherwise the method gets the
     * position details and saves them to the request for further rendering. Finally, the list of all candidate results
     * specific to requested position are obtained by executing the <code>POSITION RESULTS LIST</code> query and saved
     * to request. After that the user is forwarded to newly created <code>Position Results JSP</code> displaying the
     * candidate results for specified position.
     *
     * @throws TCWebException if any error prevents the normal process flow.
     */
    protected void screeningProcessing() throws TCWebException {

        TCRequest request = getRequest();

        // Get the user ID from request
        long userId = getUser().getId();

        // Check if the position ID had been provided with request
        String positionId = request.getParameter(Constants.JOB_POSITION_ID);
        if (positionId == null) {
            // notify the user about the error
            log.debug("Position ID is not specified.");
            throw new ScreeningException("No job position ID had been specified.");
        }

        log.debug("Got the request to get the results for position : " + positionId + ", user : " + userId);
        request.setAttribute(Constants.JOB_POSITION_ID, positionId);

        // Construct a request for position details
        Request dr = new Request();
        dr.setContentHandle(Constants.POSITION_INFO);
        dr.setProperty("jpid", positionId);
        dr.setProperty("uid", String.valueOf(userId));

        try {
            // Execute the request for position details
            Map map = Util.getDataAccess(false).getData(dr);

            // Notify the user if something went wrong
            if (map == null || map.size() != 1) {
                log.debug("The details retrieval for position " + positionId + " failed.");
                throw new ScreeningException("Position details retrieval error for position : " + positionId);
            }

            // Get the position details and save them to request for further rendering by the position results JSP
            ResultSetContainer result = (ResultSetContainer) map.get(Constants.POSITION_INFO);
            request.setAttribute(Constants.POSITION_INFO, result);

            // Notify the user if there is an empty result
            if (result.size() == 0) {
                log.debug("The details retrieval for position " + positionId + " failed.");
                throw new ScreeningException("Position details retrieval error for position : " + positionId);
            }

            // Get the company and campaign IDs from the positions details to be used further
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) result.get(0);
            String companyId = row.getStringItem("company_id");
            String campaignId = row.getStringItem("campaign_id");

            // Construct a request for position results
            dr = new Request();
            dr.setContentHandle(Constants.POSITION_RESULTS_LIST);
            dr.setProperty("cm", companyId);
            dr.setProperty("cgn", campaignId);
            dr.setProperty("jpid", positionId);

            // Execute a request for position results
            map = Util.getDataAccess(false).getData(dr);

            // Notify the user if something went wrong
            if (map == null) {
                log.debug("The search for results for position " + positionId + " returned null.");
                throw new ScreeningException("Position results retrieval error for position : " + positionId
                        + ", company : " + companyId + ", campaign : " + campaignId);
            }

            // Get the position results to be rendered by the position results JSP
            result = (ResultSetContainer) map.get(Constants.POSITION_RESULTS_LIST);

            // Check if the results list should be sorted
            String sortBy = request.getParameter(Constants.SORT_BY);
            if (sortBy != null) {
                if (sortBy.equals("preference")) {
                    result.sortByColumn(sortBy, false);
                } else
                    result.sortByColumn(sortBy, true);
                request.setAttribute(Constants.SORT_BY, sortBy);
            }

            // Save the position results to request for further rendering by the position results JSP
            request.setAttribute(Constants.POSITION_RESULTS_LIST, result);

            // Check if there was a parameter for page start index
            String startIndex = request.getParameter(Constants.PAGE_START_INDEX);
            request.setAttribute(Constants.PAGE_START_INDEX, startIndex);

            // Forward the request to postion results JSP
            setNextPage(Constants.POSITION_RESULTS_PAGE);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }
    }
}
