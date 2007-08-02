package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class StudioLeaderboardBase extends Base {
    
    protected abstract String getContestPrefix();
    
    protected abstract int getPlacementPoints(int contestPlace);

    protected abstract int getMaxContests();

    protected String getCommandName() {
        return "event_leaderboard";
    }

    protected String getDataSourceName() {
        return DBMS.STUDIO_DATASOURCE_NAME;
    }

    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/studio/leaderboard.jsp";
    }

    protected void developmentProcessing() throws TCWebException {

        Request dataRequest = new Request();
        Map map = getRequest().getParameterMap();
        HashMap filteredMap = new HashMap();
        Map.Entry me = null;
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            if (!me.getKey().equals(Constants.MODULE_KEY) &&
                    !me.getKey().equals(DataAccessConstants.SORT_COLUMN) &&
                    !me.getKey().equals(DataAccessConstants.SORT_DIRECTION)) {
                filteredMap.put(me.getKey(), me.getValue());
            }
        }

        try {
            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle(getCommandName());
            DataAccessInt dai = getDataAccess(getDataSourceName(), false);
            Map result = dai.getData(dataRequest);

            processResult(result);

            String nextPage = getPageName();
            setNextPage(nextPage);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void processResult(Map result) throws com.topcoder.web.common.TCWebException {
        ResultSetContainer rsc = (ResultSetContainer) result.get(getCommandName());

        // first thing we need to do is calculate placement points for each contest
        long prevContestId = 0;
        int contestPlace = 1;
        Map<Long, StudioLeaderBoardRow> leaderBoard = new HashMap<Long, StudioLeaderBoardRow>();
        for (ResultSetRow rsr: rsc) {
            if (rsr.getLongItem("contest_id") != prevContestId) {
                contestPlace = 1;
            }
            StudioLeaderBoardRow row = new StudioLeaderBoardRow(rsr.getLongItem("user_id"), rsr.getStringItem("handle"), rsr.getStringItem("handle_lower")); 
            if (leaderBoard.containsKey(rsr.getLongItem("user_id"))) {
                row = leaderBoard.get(rsr.getLongItem("user_id"));
                leaderBoard.remove(row);
            }
            
            if (rsr.getIntItem("completed") == 1) {
                row.setCompletedContests(row.getCompletedContests() + 1);
                List<Integer> tmp = row.getCompletedPoints();
                tmp.add(getPlacementPoints(contestPlace));
                row.setCompletedPoints(tmp);
            } else {
                row.setCurrentContests(row.getCurrentContests() + 1);
            }
            leaderBoard.put(rsr.getLongItem("user_id"), row);

            prevContestId = rsr.getLongItem("contest_id");
            contestPlace++;
        }

        // calculate completed points using the best N
        ArrayList<StudioLeaderBoardRow> results = new ArrayList<StudioLeaderBoardRow>(leaderBoard.values());
        for (StudioLeaderBoardRow row : results) {
            row.calculateBestPoints(getMaxContests());
        }        
        
        // generate rank
        Collections.sort(results, new Comparator<StudioLeaderBoardRow>() {
            public int compare(StudioLeaderBoardRow arg0, StudioLeaderBoardRow arg1) {
                return arg0.getBestPoints().compareTo(arg1.getBestPoints());
            }
        });
        boolean first = true;
        int prevPoints = 0;
        int rank = 1;
        for (StudioLeaderBoardRow row : results) {
            if (!first) {
                if (!row.getBestPoints().equals(prevPoints)) {
                    rank++;
                }
            }
            row.setRank(rank);
            prevPoints = row.getBestPoints();
        }
        
        // sort

        
        
        getRequest().setAttribute("result", results);

        SortInfo s = new SortInfo();
        s.addDefault(1, "asc"); // rank
        s.addDefault(2, "desc"); // handle lower
        s.addDefault(3, "desc"); // total potential points
        s.addDefault(4, "desc"); // completed contests
        s.addDefault(5, "desc"); // completed points
        s.addDefault(6, "asc"); // current contests
        s.addDefault(7, "desc"); // current points
        
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }
}
