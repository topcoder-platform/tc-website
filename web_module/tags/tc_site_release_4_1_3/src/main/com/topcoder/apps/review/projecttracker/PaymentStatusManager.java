/*
 * PaymentStatusManager.java
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
 * Provides access to the read-only PaymentStatus objects.
 *
 * @author TCSDeveloper
 */
public class PaymentStatusManager implements Refreshable {
    private Map paymentStatusMap = new HashMap();

    /**
     * DOCUMENT ME!
     *
     * @return PaymentStatus[]
     */
    public PaymentStatus[] getPaymentStatuses() {
        return (PaymentStatus[]) paymentStatusMap.values().toArray(new PaymentStatus[0]);
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return PaymentStatus
     */
    public PaymentStatus getPaymentStatus(long id) {
        return (PaymentStatus) paymentStatusMap.get(new Long(id));
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

            ps = conn.prepareStatement("SELECT ps.payment_stat_id, ps.payment_stat_name " + "FROM payment_status ps");
            rs = ps.executeQuery();

            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);

                PaymentStatus paymentStatus = new PaymentStatus(id, name);
                newMap.put(new Long(id), paymentStatus);
            }
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        paymentStatusMap = newMap;
    }
}
