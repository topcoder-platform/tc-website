/*
 * USDCResults.java
 *
 * Created on June 9, 2004, 11:22 AM
 */

package com.topcoder.web.tc.controller.request.development;

import java.util.Map;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.TaskDevelopment;
import com.topcoder.web.tc.model.SoftwareComponent;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import javax.servlet.http.HttpUtils;

/**
 *
 * @author  rfairfax
 */
public class USDCContestDetails extends StatBase {
    
    String getCommandName() {
        Request dataRequest = new Request();
        Map map = HttpUtils.parseQueryString(getRequest().getQueryString()); 
        map.remove(Constants.MODULE_KEY); 
        map.remove(DataAccessConstants.SORT_COLUMN);
        map.remove(DataAccessConstants.SORT_DIRECTION);

        try {
            dataRequest.setProperties(map);
            dataRequest.setContentHandle("usdc_contest_info");
            DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true);
            Map result = dai.getData(dataRequest);
            
            ResultSetContainer rsc = (ResultSetContainer)result.get("contest_info");
            
            if(rsc.getIntItem(0, "prize_type_id") == 1)
            {
                return "usdc_contest_details_first_winner";
            }
            else if(rsc.getIntItem(0, "prize_type_id") == 2 || rsc.getIntItem(0, "prize_type_id") == 3)
            {
                return "usdc_contest_details";
            }
            else if(rsc.getIntItem(0, "prize_type_id") == 4)
            {
                return "usdc_contest_details_most_submissions";
            }
            else
            {
                return "usdc_contest_details_monthly";
            }
        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
            
        return "usdc_contest_details";
    }
    
    String getDataSourceName() {
        Request dataRequest = new Request();
        Map map = HttpUtils.parseQueryString(getRequest().getQueryString()); 
        map.remove(Constants.MODULE_KEY); 
        map.remove(DataAccessConstants.SORT_COLUMN);
        map.remove(DataAccessConstants.SORT_DIRECTION);

        try {
            dataRequest.setProperties(map);
            dataRequest.setContentHandle("usdc_contest_info");
            DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true);
            Map result = dai.getData(dataRequest);
            
            ResultSetContainer rsc = (ResultSetContainer)result.get("contest_info");
            
            if(rsc.getIntItem(0, "prize_type_id") == 5 || rsc.getIntItem(0, "prize_type_id") == 6)
            {
                return DBMS.TCS_OLTP_DATASOURCE_NAME;
            }
            else
            {
                return DBMS.DW_DATASOURCE_NAME;
            }
        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
            
        return DBMS.DW_DATASOURCE_NAME;
        
    }
    
    String getPageName() {
                Request dataRequest = new Request();
        Map map = HttpUtils.parseQueryString(getRequest().getQueryString()); 
        map.remove(Constants.MODULE_KEY); 
        map.remove(DataAccessConstants.SORT_COLUMN);
        map.remove(DataAccessConstants.SORT_DIRECTION);

        try {
            dataRequest.setProperties(map);
            dataRequest.setContentHandle("usdc_contest_info");
            DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true);
            Map result = dai.getData(dataRequest);
            
            ResultSetContainer rsc = (ResultSetContainer)result.get("contest_info");
            
            if(rsc.getIntItem(0, "prize_type_id") == 4)
            {
                return "/dev/usdc_contest_det_most_submissions.jsp";
            }
            else if(rsc.getIntItem(0, "prize_type_id") == 5 || rsc.getIntItem(0, "prize_type_id") == 6)
            {
                return "/dev/usdc_contest_det_monthly.jsp";
            }
            else
            {
                return "/dev/usdc_contest_det.jsp";
            }
        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
            
        return "/dev/usdc_contest_det.jsp";

    }
    
    void statProcessing() throws com.topcoder.web.common.TCWebException {
        
        Request dataRequest = new Request();
        Map map = HttpUtils.parseQueryString(getRequest().getQueryString()); 
        map.remove(Constants.MODULE_KEY); 
        map.remove(DataAccessConstants.SORT_COLUMN);
        map.remove(DataAccessConstants.SORT_DIRECTION);

        try {
            dataRequest.setProperties(map);
            dataRequest.setContentHandle("usdc_contest_info");
            DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true);
            Map result = dai.getData(dataRequest);
            
            ResultSetContainer rsc = (ResultSetContainer)result.get("contest_info");
            
            if(rsc.getIntItem(0, "prize_type_id") == 1 )
            {
                //reposition result->resultMap->contest_results_only_winners to contest_results so that the page doesn't have to know what
                //type of contest this is
                Map result2 =  (Map)getRequest().getAttribute("resultMap");

                result2.put("contest_results", result2.get("contest_results_only_winners"));
                //result.remove("contest_results_only_winners");

                getRequest().setAttribute("resultMap", result2);
            }
        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
            
    }
    
}
