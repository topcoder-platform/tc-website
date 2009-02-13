/*
 * TestCaseApprovalManager.java
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
 * Provides access to the read-only TestCaseApproval objects.
 *
 * @author TCSDeveloper
 */
public class TestCaseApprovalManager implements Refreshable {
    private Map testCaseApprovalMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return TestCaseApproval[]
     */
    public TestCaseApproval[] getTestCaseApprovals() {
        return (TestCaseApproval[]) testCaseApprovalMap.values().toArray(new TestCaseApproval[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return TestCaseApproval
     */
    public TestCaseApproval getTestCaseApproval(long id) {
        return (TestCaseApproval) testCaseApprovalMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT ta.testcase_app_id, ta.testcase_app_name " +
                    "FROM testcase_approval ta");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                TestCaseApproval testCaseApproval = new TestCaseApproval(id, name);
                newMap.put(new Long(id), testCaseApproval);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        testCaseApprovalMap = newMap;
    }
    // end getTestCaseApproval
}

// end TestCaseApprovalManager
