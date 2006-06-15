package com.topcoder.web.tc.model.dr;

import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.Constants;


public class LeaderBoardRowComparator implements Comparator {

    /**
     * Default constructor
     */
    public LeaderBoardRowComparator() {
        super();
    }

    public int compare(Object arg0, Object arg1) {
        LeaderBoardRow lbr0 = (LeaderBoardRow) arg0;
        LeaderBoardRow lbr1 = (LeaderBoardRow) arg1;

        // compares points
        if (lbr0.getPoints() < lbr1.getPoints()) {
            return -1;
        }
        if (lbr0.getPoints() > lbr1.getPoints()) {
            return 1;
        }

        // compares placements
        ResultSetContainer rsc0 = retrieveInfo("dr_tie_break_placement", lbr0.getStage(), lbr0.getPhase(), lbr0.getUserId());
        ResultSetContainer rsc1 = retrieveInfo("dr_tie_break_placement", lbr1.getStage(), lbr1.getPhase(), lbr1.getUserId());

        Iterator it0 = rsc0.iterator();
        Iterator it1 = rsc1.iterator();
        while (it0.hasNext() && it1.hasNext()) {
            ResultSetRow row0 = (ResultSetRow) it0.next();
            ResultSetRow row1 = (ResultSetRow) it0.next();

            if (row0.getLongItem("placed") < row1.getLongItem("placed")) {
                return -1;
            }

            if (row0.getLongItem("placed") < row1.getLongItem("placed")) {
                return 1;
            }

            if (row0.getLongItem("cnt") > row1.getLongItem("cnt")) {
                return -1;
            }

            if (row0.getLongItem("cnt") > row1.getLongItem("cnt")) {
                return 1;
            }
        }

        if (!it0.hasNext() && it1.hasNext()) {
            return -1;
        }

        if (it0.hasNext() && it0.hasNext()) {
            return 1;
        }

        // compares scores
        rsc0 = retrieveInfo("dr_tie_break_score", lbr0.getStage(), lbr0.getPhase(), lbr0.getUserId());
        rsc1 = retrieveInfo("dr_tie_break_score", lbr1.getStage(), lbr1.getPhase(), lbr1.getUserId());

        long score0 = 0;
        long score1 = 0;

        it0 = rsc0.iterator();
        it1 = rsc1.iterator();
        for (int i = 0; i < Math.min(rsc0.size(), rsc1.size()); i++) {
            ResultSetRow row0 = (ResultSetRow) it0.next();
            ResultSetRow row1 = (ResultSetRow) it0.next();

            score0 += row0.getLongItem("final_score");
            score1 += row1.getLongItem("final_score");
        }

        if (score0 < score1) {
            return -1;
        }

        if (score0 > score1) {
            return 1;
        }

        // tie
        return 0;
    }

    /**
     * @param lbr0
     * @return
     */
    private ResultSetContainer retrieveInfo(String commandName, long stageId, long phaseId, long userId) {
        Request r = new Request();
           r.setContentHandle(commandName);
           r.setProperty(Constants.STAGE_ID, String.valueOf(stageId));
           r.setProperty(Constants.PHASE_ID, String.valueOf(phaseId));
           r.setProperty(Constants.CODER_ID, String.valueOf(userId));

           // retrieves data from DB
           Map m = null;
           DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
           try {
               m = dai.getData(r);
           } catch (Exception e) {
           }

           ResultSetContainer rsc = (ResultSetContainer)m.get(commandName);
        return rsc;
    }
}
