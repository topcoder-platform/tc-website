/*
 * PhaseManager.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.projecttracker;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.util.cache.refreshable.RefreshException;
import com.topcoder.util.cache.refreshable.Refreshable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;


/**
 * Provides access to the read-only Phase objects.
 *
 * @author TCSDeveloper
 */
public class PhaseManager implements Refreshable {
    private Map phaseMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return Phase[]
     */
    public Phase[] getPhases() {
        Phase[] phase = (Phase[]) phaseMap.values().toArray(new Phase[0]);
        java.util.Arrays.sort(phase, new Comparator() {
            public int compare(Object o1, Object o2) {
                Phase p1 = (Phase) o1;
                Phase p2 = (Phase) o2;
                if (p1.getOrder() < p2.getOrder()) {
                    return -1;
                } else if (p1.getOrder() > p2.getOrder()) {
                    return 1;
                } else {
                    return 0;
                }
            }
        });
        return phase;
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return Phase
     */
    public Phase getPhase(long id) {
        return (Phase) phaseMap.get(new Long(id));
    }

    /* (non-Javadoc)
     * @see com.topcoder.util.cache.refreshable.Refreshable#refresh()
     */
    public void refresh() throws RefreshException {
        Map newMap = new HashMap();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Common.getDataSource().getConnection();

            ps = conn.prepareStatement(
                    "SELECT rp.review_phase_id, rp.review_phase_name, rp.phase_order " +
                    "FROM review_phase rp " +
                    "ORDER BY rp.review_phase_id");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);
                int order = rs.getInt(3);

                Phase phase = new Phase(id, order, name);
                newMap.put(new Long(id), phase);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        phaseMap = newMap;
    }
}
