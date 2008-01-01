/*
 * ReviewerResponsibilityManager.java
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
import java.util.HashMap;
import java.util.Map;


/**
 * Provides access to the read-only ReviewerResponsibility objects.
 *
 * @author TCSDeveloper
 */
public class ReviewerResponsibilityManager implements Refreshable {
    private Map reviewerRespMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return ReviewerResponsibility[]
     */
    public ReviewerResponsibility[] getResponsibilities() {
        return (ReviewerResponsibility[]) reviewerRespMap.values().toArray(new ReviewerResponsibility[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return ReviewerResponsibility
     */
    public ReviewerResponsibility getResponsibility(long id) {
        return (ReviewerResponsibility) reviewerRespMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT rr.review_resp_id, rr.review_resp_name " + "FROM review_resp rr");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                ReviewerResponsibility reviewerResponsibility = new ReviewerResponsibility(id, name);
                newMap.put(new Long(id), reviewerResponsibility);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        reviewerRespMap = newMap;
    }
}
