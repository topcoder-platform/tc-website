/*
 * ProjectTypeManager.java
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
 * ProjectTypeManager
 *
 * @author TCSDeveloper
 */
public class ProjectTypeManager implements Refreshable {
    private Map projectTypeMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return ProjectType[]
     */
    public ProjectType[] getProjectTypes() {
        return (ProjectType[]) projectTypeMap.values().toArray(new ProjectType[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return ProjectType
     */
    public ProjectType getProjectType(long id) {
        return (ProjectType) projectTypeMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT pt.project_type_id, pt.project_type_name " +
                    "FROM project_type pt");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                ProjectType projectType = new ProjectType(id, name);
                newMap.put(new Long(id), projectType);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        projectTypeMap = newMap;
    }
}
