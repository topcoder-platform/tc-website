package com.topcoder.web.tc.controller.request.hs;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultFilter;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 *
 * @author cucu
 */
public class RoomStats extends Base { 

    class RoomFilter implements ResultFilter {

        private int room;
        
        public RoomFilter(int room) {
            this.room = room;
        }
        
        public boolean include(ResultSetRow rsr) {        
            return rsr.getIntItem("room_id") == room;
        }
        
    }
    protected void businessProcessing() throws TCWebException {
        try {
            RoundInfo round = getRoundAndSeasonIds(getRequest());
            ListInfo li = new ListInfo(getRequest(), 2, "ASC");
            
            Request r = new Request();
            r.setContentHandle("hs_room_stats");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");
            
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);

            ResultSetContainer indResult = (ResultSetContainer) result.get("hs_ind_result");
            
            int rm = -1;
            if (hasParameter("rm")) {
                rm = Integer.parseInt(getRequest().getParameter("rm"));
            } else {                
                if (indResult.getRowCount() > 0) { 
                    rm = indResult.getIntItem(0, "room_id");
                } 
            }
            
            fillRoundAndSeasonNames (round, result);

            ResultSetContainer roomResult = new ResultSetContainer(indResult, new RoomFilter(rm));
            result.put("room_result", roomResult);
            
            sortAndCrop(result, "room_result", li);                        
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            getRequest().setAttribute("listInfo", li);
            
            setNextPage(Constants.HS_ROOM_STATS);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}
