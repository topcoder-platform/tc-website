/*
 * TCS Screening Tool System 1.1
 *
 * CampaignList.java
 *
 * 1.0 07/14/2004
 */
package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

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
public class CampaignList extends BaseProcessor {

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
    protected void businessProcessing() throws TCWebException {

        // Construct a request for company details
        Request dr = new Request();
        dr.setContentHandle(Constants.COMPANY_INFO);
        dr.setProperty("uid", String.valueOf(getUser().getId()));

        try {
            // Execute the request for company details
            Map map = Util.getDataAccess(true).getData(dr);

            // Notify the user if something went wrong
            if (map == null || map.size() != 1) {
                throw new ScreeningException("Data retrieval error.");
            }

            TCRequest request = getRequest();

            // Get the company details and save them to request for further rendering by the campaigns list JSP
            ResultSetContainer result = (ResultSetContainer) map.get(Constants.COMPANY_INFO);
            request.setAttribute(Constants.COMPANY_INFO, result);

            // Construct new request for company campaigns list
            ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) result.get(0);
            dr = new Request();
            dr.setContentHandle(Constants.COMPANY_CAMPAIGNS_LIST);
            dr.setProperty("cm", String.valueOf(row.getLongItem("company_id")));

            // Execute the request for company campaigns list
            map = Util.getDataAccess(true).getData(dr);

            // Notify the user if something went wrong
            if (map == null) {
                throw new ScreeningException("Company campaigns list retrieval error.");
            }

            result = (ResultSetContainer) map.get(Constants.COMPANY_CAMPAIGNS_LIST);

            // Check if there is a single campaign for the company
            if (result.size() == 1) {
                // if so redirect the user to campaign position list
                row = (ResultSetContainer.ResultSetRow) result.get(0);
                request.setAttribute(Constants.CAMPAIGN_ID, String.valueOf(row.getLongItem("campaign_id")));
                setNextPage(Constants.POSITION_LIST_PAGE);
                setIsNextPageInContext(false);
                return;
            } else {
                // Otherwise redirect the user to company campaigns list
                request.setAttribute(Constants.COMPANY_CAMPAIGNS_LIST, result);
                setNextPage(Constants.COMPANY_CAMPAIGNS_PAGE);
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }
    }
}
