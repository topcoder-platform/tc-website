package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.InvalidStateTransitionException;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusMediator;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusMediator.UserEvents;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 */
public class NewPaymentEvent extends PaymentList implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        String[] values = getRequest().getParameterValues(PAYMENT_ID);
        DataInterfaceBean dib = new DataInterfaceBean();
        List<BasePayment> updatePayments = new ArrayList<BasePayment>();

        int event = Integer.parseInt(getRequest().getParameter("status_id"));
        
        Map criteria = new HashMap();
        for (String paymentId : values) {
            criteria.clear();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId);
            log.debug("looking for paymentId : " + paymentId);
            BasePayment payment = null;
            try {
                payment = dib.findCoderPayments(criteria).get(0);
            } catch (RemoteException re) {
                throw new TCWebException(re);
            }

            PaymentStatusMediator psm = new PaymentStatusMediator();

            try {
                switch (event) {
                case 1:
                    psm.newUserEvent(payment, UserEvents.ENTER_INTO_PAYMENT_SYSTEM_EVENT);
                    break;
                case 2:
                    psm.newUserEvent(payment, UserEvents.PAY_EVENT);
                    break;
                case 3:
                    psm.newUserEvent(payment, UserEvents.DELETE_EVENT);
                    break;
                }
            } catch (InvalidStateTransitionException iste) {
                addError("err_" + payment.getId(), iste.getMessage());
            }
            updatePayments.add(payment);
        }
        
        if (!hasErrors()) {            
            // update payments
            Connection conn = null;
            try {
                conn = DBMS.getConnection();
                conn.setAutoCommit(false);
                setLockTimeout(conn);
                
                for (BasePayment payment : updatePayments) {
                    dib.updatePayment(conn, payment);    
                }
                conn.commit();
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
            } finally {
                try {
                    conn.setAutoCommit(true);
                } catch (Exception e) {
                }
                DBMS.close(conn);
            }

        } 

        super.businessProcessing();
    }
    
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

