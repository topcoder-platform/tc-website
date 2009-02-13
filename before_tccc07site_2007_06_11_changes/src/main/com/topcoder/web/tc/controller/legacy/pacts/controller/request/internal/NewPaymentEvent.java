package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Status;
import javax.transaction.SystemException;
import javax.transaction.TransactionManager;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.EventFailureException;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusManager;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusManager.UserEvents;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 */
public class NewPaymentEvent extends PaymentList implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        String[] values = getRequest().getParameterValues(CHECKED_PAYMENT_ID);
        DataInterfaceBean dib = new DataInterfaceBean();
        List<BasePayment> updatePayments = new ArrayList<BasePayment>();
        int wrongPayments = 0;
        int event = Integer.parseInt(getRequest().getParameter("status_id"));
        
        List<String> checkedIds = new ArrayList<String>(values.length);
        
        Map criteria = new HashMap();
        for (String paymentId : values) {
            criteria.clear();
            criteria.put(PAYMENT_ID, paymentId);
            log.debug("looking for paymentId : " + paymentId);
            BasePayment payment = null;
            try {
                payment = dib.findCoderPayments(criteria).get(0);
            } catch (RemoteException re) {
                throw new TCWebException(re);
            }

            PaymentStatusManager psm = new PaymentStatusManager();

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
            } catch (EventFailureException efe) {
                wrongPayments++;
                addError("err_" + payment.getId(), efe.getCause().getMessage());
            }
            updatePayments.add(payment);
        }
        
        if (!hasErrors()) {            
            // update payments
            TransactionManager tm = null;
            try {
                tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
                tm.begin();
                
                for (BasePayment payment : updatePayments) {
                    dib.updatePayment(payment);    
                }

                tm.commit();
            } catch (Exception e) {
                rollback(tm);
            }
            getRequest().setAttribute("message_result", updatePayments.size() + " payments successfully updated");
        } else {
            for (String value : values) {
                checkedIds.add(value);
            }
            getRequest().setAttribute("checked_payments", checkedIds);
            getRequest().setAttribute("message_result", "Your request could not be processed because " + wrongPayments + " errors have been found found, please try again");            
        }

        super.businessProcessing();
    }

    private void rollback(TransactionManager tm) {
        try {
            if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                tm.rollback();
            }
        } catch (SystemException se) {
            //do nothing
        }
    }
}

