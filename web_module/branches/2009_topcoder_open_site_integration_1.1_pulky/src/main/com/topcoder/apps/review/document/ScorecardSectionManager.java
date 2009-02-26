/*
 * ScorecardSectionManager.java
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
 * Provides access to the read-only ScorecardSection objects.
 *
 * @author TCSDeveloper
 */
public class ScorecardSectionManager implements Refreshable {
    private Map scorecardSectionMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return ScorecardSection[]
     */
    public ScorecardSection[] getScorecardSections() {
        return (ScorecardSection[]) scorecardSectionMap.values().toArray(new ScorecardSection[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return ScorecardSection
     */
    public ScorecardSection getScorecardSection(long id) {
        return (ScorecardSection) scorecardSectionMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT ss.section_id, ss.section_name, " +
                    "ss.section_weight, ss.section_seq_loc, ss.group_id " +
                    "FROM scorecard_section ss");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);
                int weight = rs.getInt(3);
                int seqLoc = rs.getInt(4);
                long groupId = rs.getLong(5);

                ScorecardSectionGroupManager scorecardSectionGroupManager =
                        (ScorecardSectionGroupManager) Common.getFromCache("ScorecardSectionGroupManager");
                ScorecardSectionGroup sectionGroup = scorecardSectionGroupManager.getScorecardSectionGroup(groupId);

                ScorecardSection scorecardSection = new ScorecardSection(id, name, weight, seqLoc, sectionGroup);
                newMap.put(new Long(id), scorecardSection);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        scorecardSectionMap = newMap;
    }
}

// end ScorecardSectionManager
