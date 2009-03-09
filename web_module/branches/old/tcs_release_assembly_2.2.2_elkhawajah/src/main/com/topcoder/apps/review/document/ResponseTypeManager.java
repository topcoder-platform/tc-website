/*
 * ResponseTypeManager.java
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
 * DOCUMENT ME!
 *
 * @author TCSDeveloper
 */

/**
 * Provides access to the read-only ResponseType objects.
 *
 * @author TCSDeveloper
 */
public class ResponseTypeManager implements Refreshable {
    private Map responseTypeMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return ResponseType[]
     */
    public ResponseType[] getResponseTypes() {
        return (ResponseType[]) responseTypeMap.values().toArray(new ResponseType[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return ResponseType
     */
    public ResponseType getResponseType(long id) {
        return (ResponseType) responseTypeMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT rt.response_type_id, rt.response_type_name " + "FROM response_type rt");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                ResponseType responseType = new ResponseType(id, name);
                newMap.put(new Long(id), responseType);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        responseTypeMap = newMap;
    }
    // end getResponseType
}

// end ResponseTypeManager
