/*
* PaymentStatusManager
*
* Created Apr 23, 2007
*/
package com.topcoder.web.ejb.pacts.payments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class PaymentStatusManager {
    public enum UserEvents {
        ENTER_INTO_PAYMENT_SYSTEM_EVENT,
        DELETE_EVENT,
        PAY_EVENT
    }
    
    private static final Logger log = Logger.getLogger(PaymentStatusManager.class);

    private DataInterfaceBean dib = new DataInterfaceBean();
    
    public PaymentStatusManager() {
    }
    
    public void newPayment(BasePayment payment) throws EventFailureException {
        log.debug("newPayment called... ");
        
        try {
            // when a payment is created, the possible status can be any on hold, accruing and owed
            payment.setCurrentStatus(PaymentStatusFactory.createStatus(PaymentStatus.ON_HOLD_PAYMENT_STATUS));
            
            payment.getCurrentStatus().activate(payment);

        } catch (Exception e) {
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

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            log.debug("need to notify " + payments.size() + " payments");
            
            // notify the status manager and update each payment
            for (BasePayment payment : payments) {
                payment.getCurrentStatus().newTaxForm(payment);
                dib.updatePayment(payment);
                
                // if the payment changed its status, notify the possible childrens
                if (!payment.getCurrentStatus().equals(this)) {
                    notifyChildPayments("new", payment);
                }
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

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            log.debug("need to notify " + payments.size() + " payments");
            
            // notify the status manager and update each payment
            for (BasePayment payment : payments) {
                payment.getCurrentStatus().hardCopyIPTransfer(payment);
                dib.updatePayment(payment);

                // if the payment changed its status, notify the possible childrens
                if (!payment.getCurrentStatus().equals(this)) {
                    notifyChildPayments("new", payment);
                }
            }            
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    public void affirmedAffidavit(Long paymentId) throws EventFailureException {
        log.debug("affirmedAffidavit called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                log.debug("not exactly one result");
            }
            
            // notify the status manager and update the payment
            BasePayment payment = payments.get(0);
            payment.getCurrentStatus().affirmedAffidavit(payment);
            dib.updatePayment(payment);

            // if the payment changed its status, notify the possible childrens
            if (!payment.getCurrentStatus().equals(this)) {
                notifyChildPayments("new", payment);
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    public void affirmedIPTransfer(AssignmentDocument ad) throws EventFailureException {
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
            
            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                log.debug("not exactly one result");
            }

            // notify the status manager and update the payment
            BasePayment payment = payments.get(0);
            payment.getCurrentStatus().affirmedIPTransfer(payment);
            dib.updatePayment(payment);

            // if the payment changed its status, notify the possible childrens
            if (!payment.getCurrentStatus().equals(this)) {
                notifyChildPayments("new", payment);
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    public void expiredAffidavit(Long paymentId) throws EventFailureException {
        log.debug("expiredAffidavit called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                log.debug("not exactly one result");
            }
            
            // notify the status manager and update the payment
            BasePayment payment = payments.get(0);
            payment.getCurrentStatus().expiredAffidavit(payment);
            dib.updatePayment(payment);

            // if the payment was cancelled, notify the possible childrens
            if (!payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS))) {
                notifyChildPayments("cancel", payment);
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }


    public void expiredIPTransfer(Long paymentId) throws EventFailureException {
        log.debug("expiredIPTransfer called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                log.debug("not exactly one result");
            }
            
            // notify the status manager and update the payment
            BasePayment payment = payments.get(0);
            payment.getCurrentStatus().expiredIPTransfer(payment);
            dib.updatePayment(payment);

            // if the payment was cancelled, notify the possible childrens
            if (!payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS))) {
                notifyChildPayments("cancel", payment);
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }


    public void expiredPayment(Long paymentId) throws EventFailureException {
        log.debug("expiredIPTransfer called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                log.debug("not exactly one result");
            }
            
            // notify the status manager and update the payment
            BasePayment payment = payments.get(0);
            payment.getCurrentStatus().expiredPayment(payment);
            dib.updatePayment(payment);

            // if the payment was expired, notify the possible childrens
            if (!payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.EXPIRED_PAYMENT_STATUS))) {
                notifyChildPayments("cancel", payment);
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    public void inactiveCoder(Long coderId) throws EventFailureException {
        log.debug("inactiveCoder called for coderId: " + coderId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, coderId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);

            for (BasePayment payment : payments) {
                // notify the status manager and update the payment
                payment.getCurrentStatus().inactiveCoder(payment);
                dib.updatePayment(payment);

                // if the payment was cancelled, notify the possible childrens
                if (!payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS))) {
                    notifyChildPayments("cancel", payment);
                }
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    public void newUserEvent(BasePayment payment, UserEvents event) throws EventFailureException {
        try {
            switch (event) {
            case ENTER_INTO_PAYMENT_SYSTEM_EVENT:
                payment.getCurrentStatus().enterIntoPaymentSystem(payment);
                break;
            case PAY_EVENT:
                payment.getCurrentStatus().pay(payment);
                break;
            case DELETE_EVENT:
                payment.getCurrentStatus().delete(payment);
                break;
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    private void notifyChildPayments(String notifType, BasePayment payment) throws EventFailureException {
        Map criteria = new HashMap();
        criteria.put(PactsConstants.PARENT_PAYMENT_ID, String.valueOf(payment.getId()));

        log.debug("notify children of parent: " + payment.getId());
        try {
            List<BasePayment> childPayments = dib.findCoderPayments(criteria);
            for (BasePayment childPayment : childPayments) {
                log.debug("notifying children: " + childPayment.getId());
                if ("new".equals(notifType)) {
                    newPayment(childPayment);
                }
                if ("cancel".equals(notifType)) {
                    childPayment.getCurrentStatus().parentCancelled(childPayment);
                }
                dib.updatePayment(childPayment);
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }
}
