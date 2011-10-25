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
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.ReliabilityBonusPayment;
import com.topcoder.web.ejb.pacts.ReviewBoardBonusPayment;
import com.topcoder.web.ejb.pacts.assignmentdocuments.AssignmentDocument;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * This class manage all the payments status related checks, actions and transitions.
 * Any class that need to do something with the payment's statuses must delegate that 
 * behaviour to this class.
 * 
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class PaymentStatusManager {
    /**
     * Enumerates all possible user events to be applied to the payments. 
     * 
     * @author Pablo Wolfus (pulky)
     * @version $Id$
     */
    public enum UserEvents {
        ENTER_INTO_PAYMENT_SYSTEM_EVENT,
        DELETE_EVENT,
        PAY_EVENT
    }
    
    /**
     * Logger for this class
     */
    private static final Logger log = Logger.getLogger(PaymentStatusManager.class);

    /**
     * Pacts services provider
     */
    private DataInterfaceBean dib = new DataInterfaceBean();
    
    /**
     * Default constructor
     */
    public PaymentStatusManager() {
    }
    
    /**
     * This method creates a start-point for the payment's status (on hold status) 
     * and delegates on the status all the operations required to activate it. 
     * 
     * @param payment the payment being created
     * @throws EventFailureException if any operation fails
     */
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

    /**
     * This method notifies the status of changes to the payment object.  
     * 
     * @param payment the payment being updated
     * @throws EventFailureException if any operation fails
     */
    public void paymentUpdated(BasePayment newPayment) throws EventFailureException {
        try {
            log.debug("paymentUpdated called for paymentId: " + newPayment.getId());

            // get the old instance
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, String.valueOf(newPayment.getId()));

            BasePayment oldPayment = dib.findCoderPayments(criteria).get(0);

            newPayment.getCurrentStatus().paymentUpdated(oldPayment, newPayment);
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    /**
     * This method notifies all on hold payments of the new tax form.  
     * 
     * @param userId the if of the user that got a new tax form 
     * @throws EventFailureException if any operation fails
     */
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
                BasePaymentStatus currentStatus = payment.getCurrentStatus();

                currentStatus.newTaxForm(payment);
                double netAmount = dib.computePaymentNetAmount(payment.getPaymentType(), payment.getGrossAmount(), payment.getCoderId());
                payment.setNetAmount(netAmount);
                dib.updatePayment(payment);
                
                // if the payment changed its status, notify the possible childrens
                if (!payment.getCurrentStatus().equals(currentStatus)) {
                    notifyChildPayments("new", payment);
                }
            }            
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    /**
     * This method notifies all on hold payments of the new hard copy IP transfer.  
     * 
     * @param userId the if of the user that got a new tax form 
     * @param paymentTypeId the payment type of the new hard copy IP transfer.
     * @throws EventFailureException if any operation fails
     */
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
                BasePaymentStatus currentStatus = payment.getCurrentStatus();

                currentStatus.hardCopyIPTransfer(payment);
                dib.updatePayment(payment);

                // if the payment changed its status, notify the possible childrens
                if (!payment.getCurrentStatus().equals(currentStatus)) {
                    notifyChildPayments("new", payment);
                }
            }            
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    /**
     * This method notifies all on hold payments of the new signed global AD  
     * 
     * @param userId the if of the user that got a new tax form 
     * @throws EventFailureException if any operation fails
     */
    public void signedGlobalAD(long userId) throws EventFailureException {
        log.debug("signedGlobalAD called for userId: " + userId);
        try {
            // every on hold payment should be notified of the new signed global AD.
            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, String.valueOf(userId));
            criteria.put(PactsConstants.PAYMENT_STATUS_ID, String.valueOf(PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId()));

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            log.debug("need to notify " + payments.size() + " payments");
            
            // notify the status manager and update each payment
            for (BasePayment payment : payments) {
                BasePaymentStatus currentStatus = payment.getCurrentStatus();

                currentStatus.signedGlobalAD(payment);
                dib.updatePayment(payment);

                // if the payment changed its status, notify the possible childrens
                if (!payment.getCurrentStatus().equals(currentStatus)) {
                    notifyChildPayments("new", payment);
                }
            }            
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    /**
     * This method notifies the corresponding payment of the affirmed affidavit.  
     * 
     * @param paymentId the payment related to the affirmed affidavit
     * @throws EventFailureException if any operation fails
     */
    public void affirmedAffidavit(Long paymentId) throws EventFailureException {
        log.debug("affirmedAffidavit called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                throw new StateTransitionFailureException("Incorrect number of payments retrieved. PaymentId: " + paymentId);
            }
            
            // notify the status manager and update the payment
            BasePayment payment = payments.get(0);
            BasePaymentStatus currentStatus = payment.getCurrentStatus();

            currentStatus.affirmedAffidavit(payment);
            dib.updatePayment(payment);

            // if the payment changed its status, notify the possible childrens
            if (!payment.getCurrentStatus().equals(currentStatus)) {
                notifyChildPayments("new", payment);
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    /**
     * This method notifies the corresponding payment of the affirmed IP Transfer.  
     * 
     * @param ad the affirmed assignment document
     * @throws EventFailureException if any operation fails
     */
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
            
            // if no payments are found, do nothing.
            // notify the status manager and update the payment
            for (BasePayment payment : payments) {
                BasePaymentStatus currentStatus = payment.getCurrentStatus();
                currentStatus.affirmedIPTransfer(payment);
                dib.updatePayment(payment);
    
                // if the payment changed its status, notify the possible childrens
                if (!payment.getCurrentStatus().equals(currentStatus)) {
                    notifyChildPayments("new", payment);
                }
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }

    /**
     * This method notifies the corresponding payment of the expired affidavit.  
     * 
     * @param paymentId the payment related to the expired affidavit
     * @throws EventFailureException if any operation fails
     */
    public void expiredAffidavit(Long paymentId) throws EventFailureException {
        log.debug("expiredAffidavit called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                throw new StateTransitionFailureException("Incorrect number of payments retrieved. PaymentId: " + paymentId);
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


    /**
     * This method notifies the corresponding payment of the expired IP Transfer.  
     * 
     * @param paymentId the payment related to the expired IP Transfer.
     * @throws EventFailureException if any operation fails
     */
    public void expiredIPTransfer(Long paymentId) throws EventFailureException {
        log.debug("expiredIPTransfer called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if no payment is found, do nothing
            if (payments.size() == 1) {
                BasePayment payment = payments.get(0);

                // if the user has global AD, the payment should not be canceled.
                if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG) &&
                        dib.hasGlobalAD(payment.getCoderId())) {
                    return;
                }
                
                // notify the status manager and update the payment
                payment.getCurrentStatus().expiredIPTransfer(payment);
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


    /**
     * This method notifies the corresponding payment that it has expired.  
     * 
     * @param paymentId the payment id related to the expired payment
     * @throws EventFailureException if any operation fails
     */
    public void expiredPayment(Long paymentId) throws EventFailureException {
        log.debug("expiredPayment called for paymentId: " + paymentId);
        try {
            Map criteria = new HashMap();
            criteria.put(PactsConstants.PAYMENT_ID, paymentId.toString());

            List<BasePayment> payments = dib.findCoderPayments(criteria);
            
            // if not exactly one result, throw exception
            if (payments.size() != 1) {
                throw new StateTransitionFailureException("Incorrect number of payments retrieved. PaymentId: " + paymentId);
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

    /**
     * This method notifies all the corresponding payments of an inactive coder.  
     * 
     * @param coderId the inactive coder.
     * @throws EventFailureException if any operation fails
     */
    public int inactiveCoder(Long coderId) throws EventFailureException {
        log.debug("inactiveCoder called for coderId: " + coderId);
        try {
            int cancelled = 0;
            Map criteria = new HashMap();
            criteria.put(PactsConstants.USER_ID, coderId.toString());
            
            // to tune this process we are only getting "cancelable" payments.
            criteria.put(PactsConstants.PAYMENT_STATUS_ID, 
                    String.valueOf(PaymentStatus.ON_HOLD_PAYMENT_STATUS.getId()) + ", " +
                    String.valueOf(PaymentStatus.ACCRUING_PAYMENT_STATUS.getId()) + ", " +
                    String.valueOf(PaymentStatus.OWED_PAYMENT_STATUS.getId()));

            List<BasePayment> payments = dib.findCoderPayments(criteria);

            for (BasePayment payment : payments) {
                // Only algorithm payments are cancelable.
                if (payment.getPaymentType() != PactsConstants.ALGORITHM_CONTEST_PAYMENT &&
                    payment.getPaymentType() != PactsConstants.ALGORITHM_TOURNAMENT_PRIZE_PAYMENT) {
                    continue;
                }

                // notify the status manager and update the payment
                try {
                    cancelled += payment.getCurrentStatus().inactiveCoder(payment);
                    log.debug("cancelled payments: " + cancelled);
                    dib.updatePayment(payment);

                    // if the payment was cancelled, notify the possible childrens
                    if (payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS))) {
                        notifyChildPayments("cancel", payment);
                    }
                } catch (InvalidPaymentEventException ipee) {
                    // ignore if the payment can't be cancelled due to it's advanced status
                }
            }
            return cancelled;
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }
    
    /**
     * This method notifies the corresponding payment of the specified event.  
     * 
     * @param payment the target payment to notify 
     * @param event the notification event
     * @throws EventFailureException if any operation fails
     */
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

    /**
     * Private helper method to notify all child payments of an event  
     * 
     * @param notifType the event to notify
     * @param payment the payment to notify
     * @throws EventFailureException if any operation fails
     */
    private void notifyChildPayments(String notifType, BasePayment payment) throws EventFailureException {
        Map criteria = new HashMap();
        criteria.put(PactsConstants.PARENT_PAYMENT_ID, String.valueOf(payment.getId()));

        log.debug("notify children of parent: " + payment.getId());
        try {
            List<BasePayment> childPayments = dib.findCoderPayments(criteria);
            for (BasePayment childPayment : childPayments) {
                if (childPayment instanceof ReliabilityBonusPayment || childPayment instanceof ReviewBoardBonusPayment) {
                    log.debug("notifying children: " + childPayment.getId());
                    if ("new".equals(notifType)) {
                        newPayment(childPayment);
                    }
                    if ("cancel".equals(notifType)) {
                        childPayment.getCurrentStatus().parentCancelled(childPayment);
                    }
                    dib.updatePayment(childPayment);
                }
            }
        } catch (Exception e) {
            throw new EventFailureException(e);
        }
    }
}
