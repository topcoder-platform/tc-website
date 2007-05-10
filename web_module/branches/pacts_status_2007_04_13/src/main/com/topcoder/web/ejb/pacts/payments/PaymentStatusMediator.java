/*
* PaymentStatusMediator
*
* Created Apr 23, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.model.AssignmentDocument;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusMediator {
    private PaymentStatusManager statusManager = null;
    private Connection conn = null;

    private static final Logger log = Logger.getLogger(PaymentStatusMediator.class);

    private DataInterfaceBean dib = new DataInterfaceBean();
    
    public PaymentStatusMediator() {
        statusManager = new PaymentStatusManager();
    }
    
    public PaymentStatusMediator(Connection c) {
        this.conn = c;
        this.statusManager = new PaymentStatusManager();
    }

    public void newPayment(BasePayment payment) throws EventFailureException {
        log.debug("newPayment called... ");
        // when a payment is created, the possible status can be any on hold, accruing and owed
        statusManager.newPayment(payment);
        
        // if user is accruing and the payment is set to owed, it means we have reached accrual threshold
        // so we need to notify all accruing payments
        
        try {
            conn = DBMS.getConnection();
            conn.setAutoCommit(false);
            setLockTimeout(conn);

            log.debug("check if we need to notify accruing payments");
            log.debug("payment.getCurrentStatus(): " + payment.getCurrentStatus().getDesc());
            log.debug("dib.getUserAccrualThreshold(conn, payment.getCoderId()): " + dib.getUserAccrualThreshold(conn, payment.getCoderId()));
            
            if (payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.OWED_PAYMENT_STATUS)) && 
                    dib.getUserAccrualThreshold(conn, payment.getCoderId()) > 0) {

                log.debug("need to notify all accruing payments");
                Map criteria = new HashMap();
                criteria.put(PactsConstants.USER_ID, String.valueOf(payment.getCoderId()));
                criteria.put(PactsConstants.PAYMENT_STATUS_ID, String.valueOf(PaymentStatus.ACCRUING_PAYMENT_STATUS.getId()));
    
                List<BasePayment> payments = dib.findCoderPayments(conn, criteria);
                log.debug("need to notify " + payments.size() + " payments");
                
                // notify the status manager and update each payment
                for (BasePayment notifyPayment : payments) {
                    statusManager.accrualThresholdReached(notifyPayment);
                    dib.updatePayment(conn, notifyPayment);
                }
            }
            conn.commit();
            conn.setAutoCommit(true);
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (Exception e1) {
                printException(e1);
            }
            try {
                conn.setAutoCommit(true);
            } catch (Exception e1) {
                printException(e1);
            }
            DBMS.close(conn);
            throw new EventFailureException(e);
        }
    }

    public void newTaxForm(long userId) throws EventFailureException {
        try {
            log.debug("newTaxForm called for userId: " + userId);
            // every on hold payment should be notified of the new taxform.
            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, String.valueOf(userId));
            criteria.put(PactsConstants.PAYMENT_STATUS_ID, String.valueOf(PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId()));

            List<BasePayment> payments = dib.findCoderPayments(conn, criteria);
            log.debug("need to notify " + payments.size() + " payments");
            
            // notify the status manager and update each payment
            for (BasePayment payment : payments) {
                statusManager.newTaxForm(payment);
                dib.updatePayment(conn, payment);
            }            
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    public void hardCopyIPTransfer(long userId, long paymentTypeId) throws EventFailureException {
        log.debug("hardCopyIPTransfer called for userId: " + userId + " paymentTypeId: " + paymentTypeId);
        try {
            // every on hold payment should be notified of the new hard copy IP Transfer.
            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, String.valueOf(userId));
            criteria.put(PactsConstants.PAYMENT_TYPE_ID, String.valueOf(paymentTypeId));
            criteria.put(PactsConstants.PAYMENT_STATUS_ID, String.valueOf(PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId()));

            List<BasePayment> payments = dib.findCoderPayments(conn, criteria);
            log.debug("need to notify " + payments.size() + " payments");
            
            // notify the status manager and update each payment
            for (BasePayment payment : payments) {
                statusManager.hardCopyIPTransfer(payment);
                dib.updatePayment(conn, payment);
            }            
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    public void affirmedAffidavit(Long paymentId) throws StateTransitionFailureException {
        log.debug("affirmedAffidavit called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(conn, criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                log.debug("not exactly one result");
            }
            
            // notify the status manager and update the payment
            BasePayment payment = payments.get(0);
            statusManager.affirmedAffidavit(payment);
            dib.updatePayment(conn, payment);
        } catch (Exception e) {
            throw new StateTransitionFailureException(e);
        }
    }

    public void affirmedIPTransfer(AssignmentDocument ad) throws StateTransitionFailureException {
        log.debug("affirmedIPTransfer called for ipTransferId: " + ad.getId());
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_REFERENCE_ID, 
                    ad.getComponentProject() == null ? ad.getStudioContest().getId().toString() : 
                        ad.getComponentProject().getId().toString());
            criteria.put(PactsConstants.USER_ID, ad.getUser().getId().toString());
            criteria.put(PactsConstants.PAYMENT_TYPE_ID, 
                    ad.getComponentProject() == null ? String.valueOf(PactsConstants.TC_STUDIO_PAYMENT) : 
                        String.valueOf(PactsConstants.COMPONENT_PAYMENT));
            criteria.put(PactsConstants.PAYMENT_STATUS_ID, String.valueOf(PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId()));
            
            List<BasePayment> payments = dib.findCoderPayments(conn, criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                log.debug("not exactly one result");
            }
            
            // notify the status manager and update the payment
            BasePayment payment = payments.get(0);
            statusManager.affirmedIPTransfer(payment);
            dib.updatePayment(conn, payment);
        } catch (Exception e) {
            throw new StateTransitionFailureException(e);
        }
    }

    //    public void expiredAffidavit () {
//        statusManager.expiredAffidavit();
//    }

    private void setLockTimeout(Connection c) throws SQLException {
        PreparedStatement ps = null;
        try {
            ps = c.prepareStatement("SET LOCK MODE TO WAIT " + PactsConstants.LOCK_TIMEOUT_VALUE);
            ps.executeUpdate();
        } finally {
            DBMS.close(ps);
        }
    }

    private void printException(Exception e) {
        try {
            if (e instanceof SQLException) {
                String sqlErrorDetails = DBMS.getSqlExceptionString((SQLException) e);
                log.error("PACTS Payment Status Manager: SQLException caught\n" + sqlErrorDetails, e);
            } else {
                log.error("PACTS Payment Status Manager: Exception caught", e);
            }
        } catch (Exception ex) {
            log.error("PACTS Payment Status Manager: Error printing exception!");
        }
    }

}
