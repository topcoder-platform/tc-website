/*
 * ScorecardSectionGroupManager.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
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
 * Provides access to the read-only ScorecardSectionGroup objects.
 *
 * @author TCSDeveloper
 */
public class ScorecardSectionGroupManager implements Refreshable {
    private Map scorecardSectionGroupMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return ScorecardSectionGroup[]
     */
    public ScorecardSectionGroup[] getScorecardSectionGroups() {
        return (ScorecardSectionGroup[]) scorecardSectionGroupMap.values().toArray(new ScorecardSectionGroup[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return ScorecardSectionGroup
     */
    public ScorecardSectionGroup getScorecardSectionGroup(long id) {
        return (ScorecardSectionGroup) scorecardSectionGroupMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT sg.group_id, sg.group_name, " +
                    "sg.group_seq_loc " + "FROM sc_section_group sg");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);
                int seqLoc = rs.getInt(3);

                ScorecardSectionGroup scorecardSectionGroup = new ScorecardSectionGroup(id, name, seqLoc);
                newMap.put(new Long(id), scorecardSectionGroup);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        scorecardSectionGroupMap = newMap;
    }
}

// end ScorecardSectionGroupManager
