/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.pacts.BasePayment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 * <p>A helper class to be used for "locking" the payment processing functionality so that no more than one request for
 * payment processing could be serviced at a time.</p>
 *
 * @author isv
 * @version 1.0 (Member Payments Automation Assembly 1.0)
 */
public class PaymentProcessingLock {

    /**
     * <p>A <code>Logger</code> to be used for logging the events.</p>
     */
    private static final Logger log = Logger.getLogger(PaymentProcessingLock.class);

    /**
     * <p>A <code>Connection</code> holding the connection to target database which is used for locking the payment
     * processing.</p>
     */
    private Connection connection = null;

    /**
     * <p>Constructs new <code>PaymentProcessingLock</code> instance. This implementation does nothing.</p>
     */
    public PaymentProcessingLock() {
    }

    /**
     * <p>Locks the payment processing in order to start payment processing for specified user.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user to lock the payment processing for.
     * @throws SQLException if an SQL error occurs while attempting to lock the payment processing table.
     * @throws IllegalStateException if there is unreleased connection to database.
     */
    public void lockPaymentProcessing(long userId) throws SQLException {
        if (this.connection != null) {
            throw new IllegalStateException("There is unreleased connection from previous payment processing locking");
        }
        log.info("Attempting to lock payment processing for user " + userId + " ...");
        Connection con = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement("SET LOCK MODE TO WAIT 10");
            stmt.execute();
            stmt.close();

            con.setAutoCommit(false);

            stmt = con.prepareStatement("LOCK TABLE payment_release IN EXCLUSIVE MODE");
            stmt.execute();
            stmt.close();
        } finally {
            DBMS.close(stmt);
        }
        log.info("Locked payment process for user " + userId);
        log.debug("lockPaymentProcessing(" + userId + "). Connection: " + con + ". Thread: " + Thread.currentThread());
        this.connection = con;
    }

    /**
     * <p>Unlocks the payment processing functionality in case the payment processing for specified user performed
     * successfully.</p>
     *
     * @param userId          a <code>long</code> providing the ID of a user whose payments the system have been
     *                        attempting to pay.
     * @param paymentMethodId a <code>long</code> referencing the payment method for user.
     * @param totalNetAmount  a <code>double</code> providing the total net amount for processed payments.
     * @param paymentsPaid    a <code>List</code> listing the payments which have been paid.
     * @throws IllegalStateException if there is no connection to database.
     */
    public void unlockPaymentProcessingOnSuccess(long userId, long paymentMethodId, double totalNetAmount,
                                                 List<BasePayment> paymentsPaid) {
        if (this.connection == null) {
            throw new IllegalStateException("There is no connection to database");
        }
        log.info("Unlocking the payment processing functionality in response to successful payments "
                 + "processing for user " + userId + "...");
        log.debug("unlockPaymentProcessingOnSuccess(" + userId + "). Connection: " + this.connection + ". Thread: "
                  + Thread.currentThread());
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = this.connection.prepareStatement(
                "INSERT INTO payment_release (user_id, total_net_amount, payment_method_id, release_date) " +
                "VALUES (?, ?, ?, CURRENT)", Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, userId);
            stmt.setDouble(2, totalNetAmount);
            stmt.setLong(3, paymentMethodId);
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();
            rs.next();
            long paymentReleaseId = rs.getLong(1);
            rs.close();
            stmt.close();

            stmt = this.connection.prepareStatement(
                "INSERT INTO payment_release_xref (payment_release_id, payment_id) VALUES (?, ?)");
            stmt.setLong(1, paymentReleaseId);
            for (BasePayment payment : paymentsPaid) {
                stmt.setLong(2, payment.getId());
                stmt.executeUpdate();
            }
            stmt.close();

            this.connection.commit();
            log.info("Recorded payment release with ID " + paymentReleaseId + " of $" + totalNetAmount
                     + " in total after processing payments for user " + userId);
        } catch (SQLException e) {
            log.error("Failed to record the payment release of $" + totalNetAmount + " in total for user " + userId, e);
            try {
                this.connection.rollback();
                log.info("Rolled back the transaction on payment_release table for user " + userId);
            } catch (SQLException e1) {
                log.error(
                    "Failed to rollback transaction while attempting to unlock the payment processing functionality " +
                    "for user " + userId, e1);
            }
        } finally {
            DBMS.close(rs);
            DBMS.close(stmt);
            DBMS.close(this.connection);
            log.info("Unlocked the payment processing functionality after successful payments processing for user "
                     + userId);
            this.connection = null;
        }
    }

    /**
     * <p>Unlocks the payment processing functionality in case the payment processing for specified user has failed for
     * some reason.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user whose payments the system have been attempting to
     *               pay.
     * @throws IllegalStateException if there is no connection to database.
     */
    public void unlockPaymentProcessingOnError(long userId) {
        if (this.connection == null) {
            throw new IllegalStateException("There is no connection to database");
        }
        log.info("Unlocking the payment processing functionality in response to error encountered while processing "
                 + "payments for user " + userId + "...");
        log.debug("unlockPaymentProcessingOnError(" + userId + "). Connection: " + this.connection + ". Thread: "
                  + Thread.currentThread());
        try {
            this.connection.rollback();
            log.info("Rolled back the transaction on payment_release table for user " + userId);
        } catch (SQLException e) {
            log.error(
                "Failed to rollback transaction while attempting to unlock the payment processing functionality " +
                "for user " + userId, e);
        } finally {
            DBMS.close(this.connection);
            log.info("Unlocked the payment processing functionality after failed payments processing for user "
                     + userId);
            this.connection = null;
        }
    }
}
