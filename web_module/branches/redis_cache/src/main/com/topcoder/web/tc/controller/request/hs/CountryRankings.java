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
public class CountryRankings extends Base { 

    protected void businessProcessing() throws TCWebException {
        try {            
            ListInfo li = new ListInfo(getRequest(), 1, 50, 2, "ASC");
            RoundInfo round = getSeasonId(getRequest());
            
            Request r = new Request();
            r.setContentHandle("season_country_rank");
            
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            // just fill season, but not round
            fillRoundAndSeasonNames (round, result, "seasons", null);

            getRequest().setAttribute("totalRows", ((ResultSetContainer) result.get("season_country_rank")).getRowCount() + "");
            
            sortAndCrop(result, "season_country_rank", li);                        
            getRequest().setAttribute("listInfo", li);
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            
            setNextPage(Constants.HS_COUNTRY_RANK);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
    

}
