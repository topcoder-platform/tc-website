package com.topcoder.web.codinginterface.longcontest.controller.request.stats;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.controller.request.Static;
import com.topcoder.web.common.TCWebException;

/**
 * Handle all the recordbook pages.
 * 
 * @author Cucu
 *
 */
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
                      
            includeJsp = "/stats/consecutiveRatingIncreases.jsp";
                        
        } else if (handle.equals("marathon_consecutive_top_finishes")) {
            // check valid values
            String streakType = getRequest().getParameter(Constants.WIN_STREAK_TYPE);
            dataRequest.setProperty(Constants.WIN_STREAK_TYPE, streakType);
            getRequest().setAttribute(Constants.WIN_STREAK_TYPE, streakType);
                      
            includeJsp = "/stats/consecutiveTopFinishes.jsp";
            
        } else if (handle.equals("marathon_most_top_finishes")) {
            // check valid values
            String mp = getRequest().getParameter("mp");
            dataRequest.setProperty("mp", mp);
            getRequest().setAttribute("mp", mp);
                      
            includeJsp = "/stats/mostTopFinishes.jsp";
            
        } else if(handle.equals("marathon_most_wins")) {
            boolean all = "true".equals(getRequest().getParameter("all"));
            if (all) {
                dataRequest.setProperty(Constants.ROUND_TYPE_ID, Constants.LONG_ROUND_TOURNAMENT_TYPE_ID + "");                 
            }
            getRequest().setAttribute("allTypes", all);
            
            includeJsp = "/stats/mostWins.jsp";
            
        } else if(handle.equals("marathon_highest_rating_gain")) {        
            includeJsp = "/stats/highestRatingGain.jsp";        
            
        } else if(handle.equals("marathon_most_rated_events")) {        
            includeJsp = "/stats/mostRatedEvents.jsp";        
                        
        } else if(handle.equals("marathon_impressive_debuts")) {        
            includeJsp = "/stats/impressiveDebuts.jsp";        

        } else if(handle.equals("marathon_best_win_percentage")) {        
            includeJsp = "/stats/bestWinPercentage.jsp";        
        
        } else if(handle.equals("marathon_best_avg_placement")) {        
            includeJsp = "/stats/bestAveragePlacement.jsp";        
        
        } else throw new TCWebException("Invalid c parameter: " + handle);
        
        getRequest().setAttribute("handle", handle);

        DataAccessInt dai = getDataAccess(DBMS.DW_DATASOURCE_NAME, true);

        ResultSetContainer rsc = dai.getData(dataRequest).get(dataRequest.getContentHandle());
        getRequest().setAttribute("results", rsc);
        
        getRequest().setAttribute("includeJsp", includeJsp);
        setNextPage(Constants.PAGE_RECORDBOOK);
        setIsNextPageInContext(true);
    }
}
