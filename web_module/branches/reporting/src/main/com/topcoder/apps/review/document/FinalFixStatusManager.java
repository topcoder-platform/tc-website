/*
 * FinalFixStatusManager.java
 *
 * Copyright � 2002, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.util.cache.refreshable.RefreshException;
import com.topcoder.util.cache.refreshable.Refreshable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


/**
 * Provides access to the read-only FinalFixStatus objects.
 *
 * @author TCSDeveloper
 */
public class FinalFixStatusManager implements Refreshable {
    private Map finalFixStatusMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return FinalFixStatus[]
     */
    public FinalFixStatus[] getFinalFixStatuses() {
        return (FinalFixStatus[]) finalFixStatusMap.values().toArray(new FinalFixStatus[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return FinalFixStatus
     */
    public FinalFixStatus getFinalFixStatus(long id) {
        return (FinalFixStatus) finalFixStatusMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT ffs.final_fix_s_id, ffs.final_fix_s_name " +
                    "FROM final_fix_status ffs");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                FinalFixStatus finalFixStatus = new FinalFixStatus(id, name);
                newMap.put(new Long(id), finalFixStatus);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        finalFixStatusMap = newMap;
    }
    // end getFinalFixStatus
}

// end FinalFixStatusManager
