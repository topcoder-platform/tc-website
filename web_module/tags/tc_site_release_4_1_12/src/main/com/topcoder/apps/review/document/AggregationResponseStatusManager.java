/*
 * AggregationResponseStatusManager.java
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
 * Provides access to the read-only AggregationResponseStatus objects.
 *
 * @author TCSDeveloper
 */
public class AggregationResponseStatusManager implements Refreshable {
    private Map aggregationResponseStatusMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return AggregationResponseStatus[]
     */
    public AggregationResponseStatus[] getAggregationResponseStatuses() {
        return (AggregationResponseStatus[]) aggregationResponseStatusMap.values().toArray(new AggregationResponseStatus[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return AggregationResponseStatus
     */
    public AggregationResponseStatus getAggregationResponseStatus(long id) {
        return (AggregationResponseStatus) aggregationResponseStatusMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT ags.agg_resp_stat_id, ags.agg_resp_stat_name " +
                    "FROM agg_resp_stat ags");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                AggregationResponseStatus aggregationResponseStatus = new AggregationResponseStatus(id, name);
                newMap.put(new Long(id), aggregationResponseStatus);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        aggregationResponseStatusMap = newMap;
    }
    // end getAggregationResponseStatus
}

// end AggregationResponseStatusManager
