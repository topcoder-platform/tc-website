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
public class RoundStatsInd extends Base { 

    protected void businessProcessing() throws TCWebException {
        try {
            RoundInfo round = getRoundAndSeasonIds(getRequest());
            
            boolean groupByRoom = !hasParameter("sc");
            
            ListInfo li = new ListInfo(getRequest(), 1, groupByRoom? 10 : 50, 0, "ASC");
            
            Request r = new Request();
            r.setContentHandle("hs_round_stats_ind");
            r.setProperty("rd", round.getRoundId() + "");
            r.setProperty("snid", round.getSeasonId() + "");
            r.setProperty("sntid", HS_SNTID + "");
            
            DataAccessInt dai = getDataAccess(true);
            Map result = dai.getData(r);
            
            fillRoundAndSeasonNames(round, result);
                                  
            if (!groupByRoom) {
                getRequest().setAttribute("totalRows", ((ResultSetContainer) result.get("hs_ind_result")).getRowCount() + "");
                sortAndCrop(result, "hs_ind_result", li);
                                
            } else {
                int roomCount = cropRoom(result, "hs_ind_result", li);
                getRequest().setAttribute("totalRows", roomCount + "");                
            }
                        
            getRequest().setAttribute("resultMap", result);
            getRequest().setAttribute("roundInfo", round);
            getRequest().setAttribute("groupByRoom", groupByRoom? "true" : "false");
            getRequest().setAttribute("listInfo", li);
            
            setNextPage(Constants.HS_ROUND_STATS_IND);
            setIsNextPageInContext(true);
        } catch (TCWebException we) {
            throw we;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


    /**
     * Crop a ResultSetContainer using the ListInfo parameters, but the rows will refer to rooms,.
     *  
     * @param rsc ResultSetContainer to sort
     * @param li information about sorting
     * @return total number of rows
     */
    private int cropRoom(Map map, String name, ListInfo li) {
        ResultSetContainer rsc = (ResultSetContainer) map.get(name);
        if (rsc.getRowCount() == 0) {
            return 0;
        }
        
        int startRow = rsc.getRowCount();
        int endRow = rsc.getRowCount();
        int lastRoom = -1;
        int roomNumber = 0;
        
        for (int i = 0 ; i < rsc.getRowCount(); i++)
        {            
            if (rsc.getIntItem(i, "room_id") != lastRoom) {
                lastRoom = rsc.getIntItem(i, "room_id");
                roomNumber++;
            }
            if ((roomNumber == li.getStartRow()) && (i < startRow)) {
                startRow = i;
            }
            if ((roomNumber == li.getEndRow()) && (i < endRow)) {
                endRow = i;
            }

        }
        
        map.put(name, rsc.subList(startRow, endRow));
        return roomNumber;
    }
}
