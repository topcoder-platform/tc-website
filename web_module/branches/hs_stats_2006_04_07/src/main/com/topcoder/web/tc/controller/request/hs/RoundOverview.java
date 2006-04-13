package com.topcoder.web.tc.controller.request.hs;

import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
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
            int snid = -1;
            int rd = -1;
            
            
            if(hasParameter("snid")) {
                r.setProperty("snid", getRequest().getParameter("snid"));
                snid = Integer.parseInt(getRequest().getParameter("snid"));
            } 

            if(hasParameter("rd")) {
                r.setProperty("rd", getRequest().getParameter("rd"));
                rd = Integer.parseInt(getRequest().getParameter("rd"));
            } 
            
            r.setProperty("sntid", "1"); // HIGH SCHOOL: FIX USE A CONSTANT!
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            
            // if no season id specified, get the most recent.
            if(!hasParameter("snid")) {
                ResultSetContainer rsc = (ResultSetContainer) result.get("most_recent_season");
                snid = rsc.getIntItem(0, "season_id");
            }
            
            // if no round id specified, get the most recent.
            if(!hasParameter("rd")) {
                ResultSetContainer rsc = (ResultSetContainer) result.get("Most_Recent_Round_For_Season");
                rd = rsc.getIntItem(0, "round_id");
            }
            
            // Look up Season Name
            String seasonName = null;
            for (Iterator it = ((ResultSetContainer) result.get("seasons")).iterator(); it.hasNext();) {
                ResultSetRow rsr = (ResultSetRow) it.next();
                if (snid == rsr.getIntItem("season_id")) {
                    seasonName = rsr.getStringItem("name");
                    break;
                }                
            }
            if (seasonName == null) {
                throw new IllegalArgumentException("can't find the season name for season id " + snid);
            }

            // Look up Round Name
            String roundName = null;
            for (Iterator it = ((ResultSetContainer) result.get("rounds_for_season")).iterator(); it.hasNext();) {
                ResultSetRow rsr = (ResultSetRow) it.next();
                if (snid == rsr.getIntItem("round_id")) {
                    roundName = rsr.getStringItem("name");
                    break;
                }                
            }
            if (roundName == null) {
                throw new IllegalArgumentException("can't find the round name for round id " + rd);
            }

                
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("snid", "" + snid);
            getRequest().setAttribute("rd", "" + rd);
            getRequest().setAttribute("seasonName", seasonName);
            getRequest().setAttribute("roundName", roundName);
            
            setNextPage(Constants.HS_ROUND_OVERVIEW);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    
}
