/*
 * ProjectStatusManager.java
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
 * ProjectStatusManager
 *
 * @author TCSDeveloper
 */
public class ProjectStatusManager implements Refreshable {
    private Map projectStatusMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return ProjectStatus[]
     */
    public ProjectStatus[] getProjectsStatuses() {
        return (ProjectStatus[]) projectStatusMap.values().toArray(new ProjectStatus[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return ProjectStatus
     */
    public ProjectStatus getProjectStatus(long id) {
        return (ProjectStatus) projectStatusMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT ps.project_stat_id, ps.project_stat_name " +
                    "FROM project_status ps");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                ProjectStatus projectStatus = new ProjectStatus(id, name);
                newMap.put(new Long(id), projectStatus);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        projectStatusMap = newMap;
    }
}
