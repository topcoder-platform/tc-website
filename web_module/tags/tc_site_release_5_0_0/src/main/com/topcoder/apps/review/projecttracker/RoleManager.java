/*
 * RoleManager.java
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
 * Provides access to the read-only Role objects.
 *
 * @author TCSDeveloper
 */
public class RoleManager implements Refreshable {
    private Map roleMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return Role[]
     */
    public Role[] getRoles() {
        return (Role[]) roleMap.values().toArray(new Role[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return Role
     */
    public Role getRole(long id) {
        return (Role) roleMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT rr.review_role_id, rr.review_role_name " + "FROM review_role rr");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                Role role = new Role(id, name);
                newMap.put(new Long(id), role);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        roleMap = newMap;
    }
}
