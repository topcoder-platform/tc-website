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
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.dr.RookieBoard;


public class LeaderBoardRowComparator implements Comparator {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(LeaderBoardRowComparator.class);

    /**
     * Default constructor
     */
    public LeaderBoardRowComparator() {
        super();
    }

    public int compare(Object arg0, Object arg1) {
        LeaderBoardRow lbr0 = (LeaderBoardRow) arg0;
        LeaderBoardRow lbr1 = (LeaderBoardRow) arg1;

        log.debug("Compare points: stage0: " + lbr0.getStage());
        log.debug("Compare points: stage1:" + lbr1.getStage());
        log.debug("Compare points: phase0:" + lbr0.getPhase());
        log.debug("Compare points: phase1:" + lbr1.getPhase());
        log.debug("Compare points: " + lbr0.getUserName() + "(" + lbr0.getPoints() + ")");
        log.debug("Compare points: " + lbr1.getUserName() + "(" + lbr1.getPoints() + ")");

        // compares points
        if (lbr0.getPoints() < lbr1.getPoints()) {
            log.debug("--1-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
            return -1;
        }
        if (lbr0.getPoints() > lbr1.getPoints()) {
            log.debug("--2-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
            return 1;
        }

        // compares placements
        ResultSetContainer rsc0 = retrieveInfo("dr_tie_break_placement", lbr0.getStage(), lbr0.getPhase(), lbr0.getUserId());
        ResultSetContainer rsc1 = retrieveInfo("dr_tie_break_placement", lbr1.getStage(), lbr1.getPhase(), lbr1.getUserId());

        log.debug("Compare placement: size0 (" + rsc0.size() + ")");
        log.debug("Compare placement: size1 (" + rsc1.size() + ")");

        Iterator it0 = rsc0.iterator();
        Iterator it1 = rsc1.iterator();
        while (it0.hasNext() && it1.hasNext()) {
            ResultSetRow row0 = (ResultSetRow) it0.next();
            ResultSetRow row1 = (ResultSetRow) it1.next();

            log.debug("Compare placement: placed0 (" + row0.getLongItem("placed") + ")");
            log.debug("Compare placement: placed1 (" + row1.getLongItem("placed") + ")");
            log.debug("Compare placement: cnt0 (" + row0.getLongItem("cnt") + ")");
            log.debug("Compare placement: cnt1 (" + row1.getLongItem("cnt") + ")");

            if (row0.getLongItem("placed") < row1.getLongItem("placed")) {
                log.debug("--3-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
                return -1;
            }

            if (row0.getLongItem("placed") < row1.getLongItem("placed")) {
                log.debug("--4-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
                return 1;
            }

            if (row0.getLongItem("cnt") > row1.getLongItem("cnt")) {
                log.debug("--5-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
                return -1;
            }

            if (row0.getLongItem("cnt") > row1.getLongItem("cnt")) {
                log.debug("--6-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
                return 1;
            }
        }

        if (!it0.hasNext() && it1.hasNext()) {
            log.debug("--7-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
            return -1;
        }

        if (it0.hasNext() && it0.hasNext()) {
            log.debug("--8-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
            return 1;
        }

        // compares scores
        rsc0 = retrieveInfo("dr_tie_break_score", lbr0.getStage(), lbr0.getPhase(), lbr0.getUserId());
        rsc1 = retrieveInfo("dr_tie_break_score", lbr1.getStage(), lbr1.getPhase(), lbr1.getUserId());

        log.debug("Compare scores: size0 (" + rsc0.size() + ")");
        log.debug("Compare scores: size1 (" + rsc1.size() + ")");

        long score0 = 0;
        long score1 = 0;

        it0 = rsc0.iterator();
        it1 = rsc1.iterator();
        for (int i = 0; i < Math.min(rsc0.size(), rsc1.size()); i++) {
            ResultSetRow row0 = (ResultSetRow) it0.next();
            ResultSetRow row1 = (ResultSetRow) it1.next();

            log.debug("Compare scores: final_score0 (" + row0.getLongItem("final_score") + ")");
            log.debug("Compare scores: final_score1 (" + row1.getLongItem("final_score") + ")");

            score0 += row0.getLongItem("final_score");
            score1 += row1.getLongItem("final_score");

            log.debug("Compare scores: score0 (" + score0 + ")");
            log.debug("Compare scores: score1 (" + score1 + ")");
        }

        if (score0 < score1) {
            log.debug("--9-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
            return -1;
        }

        if (score0 > score1) {
            log.debug("--10-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
            return 1;
        }

        // tie
        log.debug("--11-- Compare result: " + lbr0.getUserName() + " = " + lbr1.getUserName());
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
