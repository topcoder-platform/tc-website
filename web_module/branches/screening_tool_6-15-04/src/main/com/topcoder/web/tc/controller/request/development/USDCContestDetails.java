/*
 * USDCResults.java
 *
 * Created on June 9, 2004, 11:22 AM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.util.DBMS;
import java.util.Map;

/**
 *
 * @author  rfairfax
 */
public class USDCContestDetails extends StatBase {
    
    String getCommandName() {
        if(getRequest().getParameter("type").equals("1"))
        {
            //first winning submission
            return "usdc_contest_details_first_winner";
        }
        else if(getRequest().getParameter("type").equals("3"))
        {
            //most submissions (min 2, passing score)
            return "usdc_contest_details_most_submissions";
        }
        else if(getRequest().getParameter("type").equals("4"))
        {
            //most submissions (min 2, passing score)
            return "usdc_contest_details_monthly";
        }
        else
            return "usdc_contest_details";
    }
    
    String getDataSourceName() {
        if(getRequest().getParameter("type").equals("4"))
        {
            return DBMS.TCS_OLTP_DATASOURCE_NAME;
        }
        else
            return DBMS.DW_DATASOURCE_NAME;
    }
    
    String getPageName() {
        if(getRequest().getParameter("type").equals("3"))
        {
            return "/dev/usdc_contest_det_most_submissions.jsp";
        }
        else if(getRequest().getParameter("type").equals("4"))
        {
            return "/dev/usdc_contest_det_monthly.jsp";
        }
        else
            return "/dev/usdc_contest_det.jsp";
    }
    
    void statProcessing() throws com.topcoder.web.common.TCWebException {
        if(getRequest().getParameter("type").equals("1"))
        {
            //reposition result->resultMap->contest_results_only_winners to contest_results so that the page doesn't have to know what
            //type of contest this is
            Map result =  (Map)getRequest().getAttribute("resultMap");
            
            result.put("contest_results", result.get("contest_results_only_winners"));
            //result.remove("contest_results_only_winners");
            
            getRequest().setAttribute("resultMap", result);
        }
    }
    
}
