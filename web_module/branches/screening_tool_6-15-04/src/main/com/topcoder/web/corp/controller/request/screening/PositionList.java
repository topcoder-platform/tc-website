/*
 * TCS Screening Tool System 1.1
 *
 * PositionList.java
 *
 * 1.0 07/14/2004
 */
package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
public class PositionList extends BaseProcessor {

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
    protected void businessProcessing() throws TCWebException {

        TCRequest request = getRequest();

        // Check if the campaign ID had been provided with request
        String campaignId = (String) request.getAttribute(Constants.CAMPAIGN_ID);
        if (campaignId == null) {
            // notify the user about the error
            throw new TCWebException("No campaign ID had been specified.");
        }

        // Construct a request for company details
        Request dr = new Request();
        dr.setContentHandle(Constants.COMPANY_INFO);
        dr.setProperty("uid", String.valueOf(getUser().getId()));

        try {
            // Execute the request for company details
            Map map = Util.getDataAccess(true).getData(dr);

            // Notify the user if something went wrong
            if (map == null || map.size() != 1) {
                throw new ScreeningException("Company info data retrieval error.");
            }

            // Get the company details and save them to request for further rendering by the positions list JSP
            ResultSetContainer result = (ResultSetContainer) map.get(Constants.COMPANY_INFO);
            request.setAttribute(Constants.COMPANY_INFO, result);

            // Get the company ID for further use
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) result.get(0);
            String companyId = row.getStringItem("company_id");

            // Construct new request for campaign details
            dr = new Request();
            dr.setContentHandle(Constants.CAMPAIGN_INFO);
            dr.setProperty("cgn", campaignId);

            // Execute the request for campaign details
            map = Util.getDataAccess(true).getData(dr);

            // Notify the user if something went wrong
            if (map == null) {
                throw new ScreeningException("Company campaign details retrieval error.");
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
            map = Util.getDataAccess(true).getData(dr);

            // Check if there is a single position for the campaign
            if (result.size() == 1) {
                // if so redirect the user to campaign position list
                row = (ResultSetContainer.ResultSetRow) result.get(0);
                request.setAttribute(Constants.JOB_POSITION_ID, row.getStringItem("job_id"));
                setNextPage(Constants.JOB_POSITION_RESULTS_PAGE);
                setIsNextPageInContext(false);
            } else {
                // Otherwise redirect the user to campaign positions list
                request.setAttribute(Constants.CAMPAIGN_POSITIONS_LIST, result);
                setNextPage(Constants.CAMPAIGN_POSITIONS_PAGE);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }
    }
}
