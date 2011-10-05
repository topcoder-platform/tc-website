/*
 * TCS Screening Tool System 1.1
 *
 * PositionList.java
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
 * <p>A request pre-processor responsible to get the list of the poistions associated with specified company campaign
 * and put them to request for further rendering by the newly created <code>Campaign Positions JSP</code>.</p>
 *
 * <p>This pre-processor guarantess that the user is provided with details for positions associated with campaign which
 * the user's company is associated with. If there is a single position associated with the campaign then the user is
 * redirected to position's result page.</p>
 *
 * @author  isv
 * @version 1.0 07/14/2004
 * @since   Screening Tool 1.1
 */
public class PositionList extends BaseScreeningProcessor {

    /**
     * A <code>Logger</code> to log the <code>PositionList</code> processor activities.
     */
    private final static Logger log = Logger.getLogger(PositionList.class);

    /**
     * A main method of <code>PositionList</code> processor. The method gets the user's company info issuing the <code>
     * COMPANY INFO</code> request. If a request succeeds then the method issues a request for details of campaigns the
     * user's company is associated with. If a request succeeds then the company and campaigns details are saved to the
     * request for further rendering by the <code>Company campaings JSP</code>. If there is a single campaign associated
     * with the user's company then the user is redirected to newly created <code>Positin list JSP</code> listing the
     * positions associated with specified campaign.
     *
     * @throws TCWebException if any error prevents the normal process flow.
     */
    protected void screeningProcessing() throws TCWebException {

        TCRequest request = getRequest();

        // Get the userId from request
        long userId = getUser().getId();

        // Check if the campaign ID had been provided with request
        String campaignId = request.getParameter(Constants.CAMPAIGN_ID);
        if (campaignId == null) {
            // notify the user about the error
            log.debug("Campaign ID is not specified.");
            throw new ScreeningException("No campaign ID had been specified.");
        }

        log.debug("Got the request to display the positions for campaign : " + campaignId + ", user : " + userId);

        // Construct a request for company details
        Request dr = new Request();
        dr.setContentHandle(Constants.COMPANY_INFO);
        dr.setProperty("uid", String.valueOf(userId));

        try {
            // Execute the request for company details
            log.debug("Getting the company details for user : " + userId);
            Map map = Util.getDataAccess(false).getData(dr);

            // Notify the user if something went wrong
            if (map == null || map.size() != 1) {
                log.debug("The company details retrieval failed for user : " + userId);
                throw new ScreeningException("Company info data retrieval error for user : " + userId);
            }

            // Get the company details and save them to request for further rendering by the positions list JSP
            ResultSetContainer result = (ResultSetContainer) map.get(Constants.COMPANY_INFO);
            request.setAttribute(Constants.COMPANY_INFO, result);

            // Notify the user if there is more than 1 company
            if (result.size() != 1) {
                log.debug("The user " + userId + " has more than 1 company associated with him.");
                log.debug("The following companies had been found:");
                for (int i = 0; i < result.size(); i++) {
                    ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) result.get(i);
                    log.debug(row.getStringItem("company_name"));
                }
                throw new ScreeningException("The user should be associated only with 1 company at once.");
            }

            // Get the company ID for further use
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) result.get(0);
            String companyId = row.getStringItem("company_id");

            // Construct new request for campaign details
            dr = new Request();
            dr.setContentHandle(Constants.CAMPAIGN_INFO);
            dr.setProperty("cgn", campaignId);
            dr.setProperty("cm", companyId);

            // Execute the request for campaign details
            log.debug("Getting the details for campaign : " + campaignId + ", company : " + companyId + ", user : "
                    + userId);
            map = Util.getDataAccess(false).getData(dr);

            // Notify the user if something went wrong
            if (map == null || map.size() != 1) {
                log.debug("The campaign details retrieval failed for user : " + userId + ", campaign : " + campaignId
                        + ", company : " + companyId);
                throw new ScreeningException("Company campaign details retrieval error for campaign : " + campaignId
                        + ", company : " + companyId + ", user : " + userId);
            }

            // Save the campaign details to request for further rendering by the newly created "Campaig positions list"
            // JSP
            result = (ResultSetContainer) map.get(Constants.CAMPAIGN_INFO);
            request.setAttribute(Constants.CAMPAIGN_INFO, result);

            // Construct a request for campaign positions list
            dr = new Request();
            dr.setContentHandle(Constants.CAMPAIGN_POSITIONS_LIST);
            dr.setProperty("cgn", campaignId);
            dr.setProperty("cm", companyId);

            // Execute the request for campaign positions list
            log.debug("Getting the positions for campaign : " + campaignId + ", company : " + companyId + ", user : "
                    + userId);
            map = Util.getDataAccess(false).getData(dr);

            // Notify the user if something went wrong
            if (map == null) {
                log.debug("The campaign positions retrieval failed for user : " + userId + ", campaign : " + campaignId
                        + ", company : " + companyId);
                throw new ScreeningException("Company campaign positions retrieval error for campaign : " + campaignId
                        + ", company : " + companyId + ", user : " + userId);
            }

            result = (ResultSetContainer) map.get(Constants.CAMPAIGN_POSITIONS_LIST);
            log.debug("The number of positions found for campaign " + campaignId + " is : " + result.size());

            // Check if there is a single position for the campaign
            if (result.size() == 1) {
                // if so redirect the user to position results list
                row = (ResultSetContainer.ResultSetRow) result.get(0);
                log.debug("There is a single position for campaign. Redirecting the request to "
                        + buildProcessorURL(Constants.POSITION_RESULTS_PROCESSOR, null) + "&"
                        + Constants.JOB_POSITION_ID + "=" + row.getStringItem("job_id"));
                setNextPage(buildProcessorURL(Constants.POSITION_RESULTS_PROCESSOR, null) + "&"
                        + Constants.JOB_POSITION_ID + "=" + row.getStringItem("job_id"));
                setIsNextPageInContext(false);
            } else {
                // Otherwise redirect the user to campaign positions list
                log.debug("Forwarding the request to " + Constants.CAMPAIGN_POSITIONS_PAGE);
                request.setAttribute(Constants.CAMPAIGN_POSITIONS_LIST, result);
                setNextPage(Constants.CAMPAIGN_POSITIONS_PAGE);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new ScreeningException(e));
        }
    }
}
