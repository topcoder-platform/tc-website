/*
 * TCS Screening Tool 1.1
 *
 * CampaignResults.java
 *
 * 1.0 07/14/2004
 */
package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;

import java.util.Map;

/**
 * <p>A request pre-processor responsible to get the candidate results for the specified campaign and put them to
 * request for further rendering by the newly created <code>Campaign Results JSP</code>.</p>
 *
 * <p>This pre-processor guarantess that the user is provided with details for campaign which the user's company is
 * associated with.</p>
 *
 * @author  isv
 * @version 1.0 07/14/2004
 * @since   Screening Tool 1.1
 */
public class CampaignResults extends BaseScreeningProcessor {

    /**
     * A <code>Logger</code> to log the <code>CampaignResults</code> processor activities.
     */
    private final static Logger log = Logger.getLogger(CampaignResults.class);

    /**
     * A main method of <code>CampaignResults</code> processor. The method expects the campaign ID to be provided with
     * request. If such an ID is missing then a <code>ScreeningException</code> is thrown. Otherwise the method gets the
     * user's company info and saves it to the request for further rendering. Then the details for requested campaign
     * are obtained and saved to request for further rendering. Finally, the list of all candidate results specific to
     * requested campaign are obtained by executing the <code>CAMPAIGN RESULTS LIST</code> request and saved to request.
     * After that the user is redirected to newly created <code>Campaign Results JSP</code> displaying the candidate
     * results for specified campaign.
     *
     * @throws TCWebException if any error prevents the normal process flow.
     */
    protected void screeningProcessing() throws TCWebException {

        TCRequest request = getRequest();

        // Check if the campaign ID had been provided with request
        String campaignId = request.getParameter(Constants.CAMPAIGN_ID);
        if (campaignId == null) {
            // notify the user about the error
            log.error("There is no campaign ID specified.");
            throw new ScreeningException("No campaign ID had been specified.");
        }

        log.info("Got the request to display the campaign results for campaign : " + campaignId);

        // Construct a request for company details
        Request dr = new Request();
        dr.setContentHandle(Constants.COMPANY_INFO);
        dr.setProperty("uid", String.valueOf(getUser().getId()));

        try {
            // Execute the request for company details
            log.info("Getting the company details for user : " + getUser().getId());
            Map map = Util.getDataAccess(true).getData(dr);

            // Notify the user if something went wrong
            if (map == null || map.size() != 1) {
                log.error("Got the exception while getting company details for user : " + getUser().getId());
                throw new ScreeningException("Company details retrieval error.");
            }

            // Get the company details and save them to request for further rendering by the campaign results JSP
            ResultSetContainer result = (ResultSetContainer) map.get(Constants.COMPANY_INFO);

            // Notify the user if there is more than 1 company
            if (result.size() != 1) {
                log.error("Got the exception while getting company details for user : " + getUser().getId());
                throw new ScreeningException("The user should be associated only with 1 company at once.");
            }

            request.setAttribute(Constants.COMPANY_INFO, result);

            // Get the company ID for further use
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) result.get(0);
            String companyId = row.getStringItem("company_id");

            // Construct new request for details of specified campaign
            dr = new Request();
            dr.setContentHandle(Constants.CAMPAIGN_INFO);
            dr.setProperty("cm", companyId);
            dr.setProperty("cgn", campaignId);

            // Execute the request for campaign details
            log.info("Getting the campaign details for user : " + getUser().getId() + " and company :"
                    + companyId + " and campaign : " + campaignId);
            map = Util.getDataAccess(true).getData(dr);

            // Notify the user if something went wrong
            if (map == null || map.size() != 1) {
                log.error("Got the exception while getting the campaign details.");
                throw new ScreeningException("Campaign details retrieval error.");
            }

            // Get the campaign details and save them to request for further rendering by the campaign results JSP
            result = (ResultSetContainer) map.get(Constants.CAMPAIGN_INFO);
            request.setAttribute(Constants.CAMPAIGN_INFO, result);

            // Construct a request for campaign results
            dr = new Request();
            dr.setContentHandle(Constants.CAMPAIGN_RESULTS_LIST);
            dr.setProperty("cm", companyId);
            dr.setProperty("cgn", campaignId);

            // Execute a request for campaign results
            log.info("Getting the campaign results for user : " + getUser().getId() + " and company :"
                    + companyId + " and campaign : " + campaignId);
            map = Util.getDataAccess(true).getData(dr);

            // Notify the user if something went wrong
            if (map == null) {
                log.error("Got the exception while getting the campaign results.");
                throw new ScreeningException("Campaign results retrieval error.");
            }

            // Save the campaign results to request for further rendering by the campaign results JSP
            result = (ResultSetContainer) map.get(Constants.CAMPAIGN_RESULTS_LIST);
            request.setAttribute(Constants.CAMPAIGN_RESULTS_LIST, result);

            // Redirect the user to campaign results JSP
            log.info("Forwarding the request to " + Constants.CAMPAIGN_RESULTS_PAGE);
            setNextPage(Constants.CAMPAIGN_RESULTS_PAGE);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }
    }
}
