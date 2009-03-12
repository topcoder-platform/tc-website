/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.model.dr;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.tc.Constants;

import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * <strong>Purpose</strong>:
 * Comparator for IBoardRowElements.
 * <p/>
 * This comparator will check for three things to compare the two objects:
 * - DR Points.
 * - The user that had the best placed submissions. (and the number of them)
 * - The user that had the best average score in their best submissions. (N = min(#sub1, #sub2)
 * <p/>
 * If a tie still remains, the rows are equal.
 *
 * @author pulky
 * @version 1.0
 */
public class BoardRowComparator implements Comparator {

    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(BoardRowComparator.class);

    /**
     * The DB command to apply rule 2.
     */
    private String placementCommand;

    /**
     * The DB command to apply rule 3.
     */
    private String scoreCommand;

    /**
     * The period key, could be stage or season.
     */
    private String periodKey;

    private HashMap cache = new HashMap();

    /**
     * Constructor setting properties.
     *
     * @param placementCommand The placementCommand to set.
     * @param scoreCommand     The scoreCommand to set.
     * @param periodKey        The periodKey to set.
     */
    public BoardRowComparator(String placementCommand, String scoreCommand, String periodKey) {
        super();
        this.placementCommand = placementCommand;
        this.scoreCommand = scoreCommand;
        this.periodKey = periodKey;
    }

    /**
     * Constructor setting properties.
     *
     * @param arg0 The first object to compare.
     * @param arg1 The second object to compare.
     * @return 0 if equal, -1 if arg0 < arg1 and 1 if argo > arg1.
     */
    public int compare(Object arg0, Object arg1) {
        IBoardRow lbr0 = (IBoardRow) arg0;
        IBoardRow lbr1 = (IBoardRow) arg1;

        // compares points
        if (lbr0.getPoints() < lbr1.getPoints()) {
            //log.debug("--1-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
            return -1;
        }
        if (lbr0.getPoints() > lbr1.getPoints()) {
            //log.debug("--2-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
            return 1;
        }

        // compares placements
        ResultSetContainer rsc0 = retrieveInfo(placementCommand, lbr0.getPeriod(), lbr0.getProjectTypeId(), lbr0.getUserId());
        ResultSetContainer rsc1 = retrieveInfo(placementCommand, lbr1.getPeriod(), lbr1.getProjectTypeId(), lbr1.getUserId());

        Iterator it0 = rsc0.iterator();
        Iterator it1 = rsc1.iterator();
        while (it0.hasNext() && it1.hasNext()) {
            ResultSetRow row0 = (ResultSetRow) it0.next();
            ResultSetRow row1 = (ResultSetRow) it1.next();

            if (row0.getLongItem("placed") > row1.getLongItem("placed")) {
                //log.debug("--3-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
                return -1;
            }

            if (row0.getLongItem("placed") < row1.getLongItem("placed")) {
                //log.debug("--4-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
                return 1;
            }

            if (row0.getLongItem("cnt") < row1.getLongItem("cnt")) {
                //log.debug("--5-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
                return -1;
            }

            if (row0.getLongItem("cnt") > row1.getLongItem("cnt")) {
                //log.debug("--6-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
                return 1;
            }
        }

        if (!it0.hasNext() && it1.hasNext()) {
            //log.debug("--7-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
            return -1;
        }

        if (it0.hasNext() && it0.hasNext()) {
            //log.debug("--8-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
            return 1;
        }

        // compares scores
        rsc0 = retrieveInfo(scoreCommand, lbr0.getPeriod(), lbr0.getProjectTypeId(), lbr0.getUserId());
        rsc1 = retrieveInfo(scoreCommand, lbr1.getPeriod(), lbr1.getProjectTypeId(), lbr1.getUserId());

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
            //log.debug("--9-- Compare result: " + lbr0.getUserName() + " < " + lbr1.getUserName());
            return -1;
        }

        if (score0 > score1) {
            //log.debug("--10-- Compare result: " + lbr0.getUserName() + " > " + lbr1.getUserName());
            return 1;
        }

        // tie
        //log.debug("--11-- Compare result: " + lbr0.getUserName() + " = " + lbr1.getUserName());
        return 0;
    }


    /**
     * Helper method to retrieve data from DB.
     *
     * @param commandName The command name
     * @param periodId    The period to look for.
     * @param phaseId     The phaseId to look for.
     * @param userId      The userId to look for.
     * @return the retrieved resultset
     */
    private ResultSetContainer retrieveInfo(String commandName, long periodId, long phaseId, long userId) {
        if (log.isDebugEnabled()) {
            log.debug("running retrieveInfo command: " + commandName + " periodId: " + periodId + " phaseid: " + phaseId + " userId: " + userId);
        }

        ResultSetContainer ret = null;

        StringBuffer key = new StringBuffer(100);
        key.append(commandName).append(":");
        key.append(periodId).append(":");
        key.append(phaseId).append(":");
        key.append(userId).append(":");

        //do some local caching.  this method may be called many times in a single request on the same data, so we should cache it
        //so we don't have to hit either the distributed cache or the db so many times.
        ret = (ResultSetContainer) cache.get(key.toString());

        if (ret == null) {
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
                throw new RuntimeException(e);
            }
            ret = (ResultSetContainer) m.get(commandName);
            cache.put(key.toString(), ret);
        }
        return ret;

    }
}
