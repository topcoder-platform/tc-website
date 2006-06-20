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


public class BoardRowComparator implements Comparator {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(BoardRowComparator.class);

    private String placementCommand;
    private String scoreCommand;
    private String periodKey;


    public BoardRowComparator(String placementCommand, String scoreCommand, String periodKey) {
        super();
        this.placementCommand = placementCommand;
        this.scoreCommand = scoreCommand;
        this.periodKey = periodKey;
    }

    public int compare(Object arg0, Object arg1) {
        IBoardRow lbr0 = (IBoardRow) arg0;
        IBoardRow lbr1 = (IBoardRow) arg1;

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
        ResultSetContainer rsc0 = retrieveInfo(placementCommand, lbr0.getPeriod(), lbr0.getPhase(), lbr0.getUserId());
        ResultSetContainer rsc1 = retrieveInfo(placementCommand, lbr1.getPeriod(), lbr1.getPhase(), lbr1.getUserId());

        Iterator it0 = rsc0.iterator();
        Iterator it1 = rsc1.iterator();
        while (it0.hasNext() && it1.hasNext()) {
            ResultSetRow row0 = (ResultSetRow) it0.next();
            ResultSetRow row1 = (ResultSetRow) it1.next();

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
        rsc0 = retrieveInfo(scoreCommand, lbr0.getPeriod(), lbr0.getPhase(), lbr0.getUserId());
        rsc1 = retrieveInfo(scoreCommand, lbr1.getPeriod(), lbr1.getPhase(), lbr1.getUserId());

        long score0 = 0;
        long score1 = 0;

        it0 = rsc0.iterator();
        it1 = rsc1.iterator();
        for (int i = 0; i < Math.min(rsc0.size(), rsc1.size()); i++) {
            ResultSetRow row0 = (ResultSetRow) it0.next();
            ResultSetRow row1 = (ResultSetRow) it1.next();

            score0 += row0.getLongItem("final_score");
            score1 += row1.getLongItem("final_score");
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
    private ResultSetContainer retrieveInfo(String commandName, long periodId, long phaseId, long userId) {
        Request r = new Request();
           r.setContentHandle(commandName);
           r.setProperty(periodKey, String.valueOf(periodId));
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
