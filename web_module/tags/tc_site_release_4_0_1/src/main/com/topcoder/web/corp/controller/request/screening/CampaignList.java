/*
 * TCS Screening Tool System 1.1
 *
 * CampaignList.java
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
 * <p>A request pre-processor responsible to get the details for the company and company campaigns and put them to
 * request for further rendering by the newly created <code>Company campaigns JSP</code>.</p>
 *
 * <p>This pre-processor guarantess that the user is provided with details for campaigns which the user's company is
 * associated with. If there is a single campaign associated with the user's company then the user is redirected to
 * campaign's position list.</p>
 *
 * @author  isv
 * @version 1.0 07/14/2004
 * @since   Screening Tool 1.1
 */
public class CampaignList extends BaseScreeningProcessor {

    /**
     * A <code>Logger</code> to log the <code>CampaignList</code> processor activities.
     */
    private final static Logger log = Logger.getLogger(CampaignList.class);

    /**
     * A main method of <code>CampaignList</code> processor. The method gets the user's company info issuing the <code>
     * COMPANY INFO</code> request. If a request succeeds then the method issues a request for details of campaigns the
     * user's company is associated with. If a request succeeds then the company and campaigns details are saved to the
     * request for further rendering by the <code>Company campaings JSP</code>. If there is a single campaign associated
     * with the user's company then the user is redirected to newly created <code>Positin list JSP</code> listing the
     * positions associated with specified campaign.
     *
     * @throws TCWebException if any error prevents the normal process flow.
     */
    protected void screeningProcessing() throws TCWebException {

        // Get the user ID from request
        long userId = getUser().getId();
        log.debug("Got the request to display the campaigns for user : " + userId);

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
                throw new ScreeningException("Company details retrieval error for user : " + userId);
            }

            TCRequest request = getRequest();

            // Get the company details and save them to request for further rendering by the campaigns list JSP
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

            // Construct new request for company campaigns list
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) result.get(0);
            String companyId = row.getStringItem("company_id");
            dr = new Request();
            dr.setContentHandle(Constants.COMPANY_CAMPAIGNS_LIST);
            dr.setProperty("cm", companyId);

            // Execute the request for company campaigns list
            log.debug("Getting the campaigns list for user : " + userId + " and company :" + companyId);
            map = Util.getDataAccess(false).getData(dr);

            // Notify the user if something went wrong
            if (map == null) {
                log.error("Got the exception while getting campaigns list for user : " + userId);
                throw new ScreeningException("Company campaigns list retrieval error for user : " + userId + " and "
                        + "company : " + companyId);
            }

            result = (ResultSetContainer) map.get(Constants.COMPANY_CAMPAIGNS_LIST);
            log.debug("The number of campaigns found is : " + result.size());

            // Check if there is a single campaign for the company
            if (result.size() == 1) {
                // if so redirect the user to campaign position list
                row = (ResultSetContainer.ResultSetRow) result.get(0);
                String campaignId = row.getStringItem("campaign_id");
                log.debug("There is a single campaign for the user : " + userId + ". Will redirect to campaign : "
                        + campaignId);
                setNextPage(buildProcessorURL(Constants.POSITION_LIST_PROCESSOR, null) + "&" + Constants.CAMPAIGN_ID
                        + "=" + campaignId);
                setIsNextPageInContext(false);
            } else {
                // Otherwise forward the user to company campaigns list
                log.debug("Forwarding to campaigns list page...");
                request.setAttribute(Constants.COMPANY_CAMPAIGNS_LIST, result);
                setNextPage(Constants.COMPANY_CAMPAIGNS_PAGE);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new ScreeningException(e));
        }
    }
}
