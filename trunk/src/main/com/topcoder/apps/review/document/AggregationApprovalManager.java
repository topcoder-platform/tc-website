/*
 * AggregationApprovalManager.java
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
 * Provides access to the read-only AggregationApproval objects.
 *
 * @author TCSDeveloper
 */
public class AggregationApprovalManager implements Refreshable {
    private Map aggregationApprovalMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return AggregationApproval[]
     */
    public AggregationApproval[] getAggregationApprovals() {
        return (AggregationApproval[]) aggregationApprovalMap.values().toArray(new AggregationApproval[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return AggregationApproval
     */
    public AggregationApproval getAggregationApproval(long id) {
        return (AggregationApproval) aggregationApprovalMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT aa.agg_approval_id, aa.agg_approval_name " + "FROM agg_approval aa");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                AggregationApproval aggregationApproval = new AggregationApproval(id, name);
                newMap.put(new Long(id), aggregationApproval);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        aggregationApprovalMap = newMap;
    }
    // end getAggregationApproval
}

// end AggregationApprovalManager
