package com.topcoder.web.tc.controller.request.hs;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class RoundOverview extends Base { 
    
    protected void businessProcessing() throws TCWebException {
        try {
            Request r = new Request();
            r.setContentHandle("HS_RoundOverview");
            
            
            if(hasParameter("snid")) {
                r.setProperty("snid", getRequest().getParameter("snid"));
                getRequest().setAttribute("snid", getRequest().getParameter("snid"));
            } 

            if(hasParameter("rd")) {
                //r.setProperty("rd", getRequest().getParameter("rd"));
                getRequest().setAttribute("rd", getRequest().getParameter("rd"));
            } 
            
            r.setProperty("sntid", "1"); // HIGH SCHOOL: FIX USE A CONSTANT!
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            
            // if no season id specified, get the most recent.
            if(!hasParameter("snid")) {
                ResultSetContainer rsc = (ResultSetContainer) result.get("most_recent_season");                
                getRequest().setAttribute("snid", "" + rsc.getIntItem(0, "season_id"));
            }
            
            // if no round id specified, get the most recent.
            if(!hasParameter("rd")) {
                ResultSetContainer rsc = (ResultSetContainer) result.get("Most_Recent_Round_For_Season");
                log.info("row count=" +  rsc.getRowCount());
                getRequest().setAttribute("rd", "" + rsc.getIntItem(0, "round_id"));
            }
            
            getRequest().setAttribute("resultMap", result);
            
            setNextPage(Constants.HS_ROUND_OVERVIEW);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
}
