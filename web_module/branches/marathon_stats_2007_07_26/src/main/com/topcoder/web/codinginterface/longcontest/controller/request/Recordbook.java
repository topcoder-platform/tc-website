package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.controller.request.Static;
import com.topcoder.web.common.TCWebException;

public class Recordbook extends Static {

    protected void businessProcessing() throws Exception {
        Request dataRequest = new Request();
        // Copy all url parameters to the data request (particularly c and er)
        dataRequest.setProperties(getRequest().getParameterMap());

        // Ensure that the "c" parameter is valid
        String handle = dataRequest.getContentHandle().trim().toLowerCase();
        
        String includeJsp;
        
        if (handle.equals("marathon_consecutive_rating_increases")) {
            // check valid values
            String streakType = getRequest().getParameter(Constants.WIN_STREAK_TYPE);
            dataRequest.setProperty(Constants.WIN_STREAK_TYPE, streakType);
            getRequest().setAttribute(Constants.WIN_STREAK_TYPE, streakType);
                      
            includeJsp = Constants.MARATHON_CONSECUTIVE_RATING_INCREASES;
            
        } else if(handle.equals("marathon_most_wins")) {
            boolean all = "true".equals(getRequest().getParameter("all"));
            if (all) {
                dataRequest.setProperty(Constants.ROUND_TYPE_ID, "19"); // MARATHON TOURNAMENT. FIX Constant!                
            }
            getRequest().setAttribute("allTypes", all);
            
            includeJsp = "/stats/mostWins.jsp";
            
        } else throw new TCWebException("Invalid c parameter: " + handle);
        
        log.debug("includeJsp=" + includeJsp);
//        includeJsp = "/stats/consecutiveRatingIncreases.jsp";
        getRequest().setAttribute("handle", handle);

        DataAccessInt dai = getDataAccess(DBMS.DW_DATASOURCE_NAME, true);

        ResultSetContainer rsc = dai.getData(dataRequest).get(dataRequest.getContentHandle());
        getRequest().setAttribute("results", rsc);
        
        getRequest().setAttribute("includeJsp", includeJsp);
        setNextPage("/stats/recordbook.jsp");
        setIsNextPageInContext(true);
    }
}
