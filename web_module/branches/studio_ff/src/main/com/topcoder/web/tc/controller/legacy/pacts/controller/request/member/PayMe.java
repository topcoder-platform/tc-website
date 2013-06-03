/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.AccruingPaymentStatus;
import com.topcoder.web.ejb.pacts.payments.InvalidPaymentEventException;
import com.topcoder.web.ejb.pacts.payments.OwedPaymentStatus;
import com.topcoder.web.ejb.pacts.payments.StateTransitionFailureException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.PayPalService;
import com.topcoder.web.tc.controller.PayPalServiceException;
import com.topcoder.web.tc.controller.PayoneerService;
import com.topcoder.web.tc.controller.PayoneerServiceException;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.*;

/**
 * <p>A controller to be used for servicing requests for initiating the paying process for payments selected by the 
 * current user.</p>
 * 
 * @author isv
 * @version 1.0 (Member Payments Automation Assembly 1.0)
 */
public class PayMe extends PaymentHistory {

    /**
     * <p>A <code>String</code> providing the generic error message to be displayed to users in some cases.</p>
     */
    private static final String GENERIC_ERROR_MESSAGE = "Failed to initiate payments. " +
                                                        "Please try again at a later time."; 

    /** Format for the email timestamp. Will format as "Fri, Jul 28, 2006 01:34 PM EST". */
    private static final String EMAIL_TIMESTAMP_FORMAT = "EEE, MMM d, yyyy hh:mm a z";

    /**
     * <p>Constructs new <code>PayMe</code> instance. This implementation does nothing.</p>
     */
    public PayMe() {
    }

    /**
     * <p>Handles the incoming request.</p>
     * 
     * @throws TCWebException if an unexpected error occurs.
     */
    @Override
    protected void businessProcessing() throws TCWebException {
        long currentUserId = getUser().getId();
        boolean success = false;
        PaymentProcessingLock paymentProcessingLock = new PaymentProcessingLock();
        try {
            paymentProcessingLock.lockPaymentProcessing(currentUserId);
        } catch (SQLException e) {
            log.error("Failed to lock payment processing for user " + currentUserId, e);
            addError("PayMe", "Server is currently busy, please try again at a later time.");
        }

        if (!hasErrors()) {
            try {
                DataInterfaceBean dib = new DataInterfaceBean();
    
                // Get the payments for the user
                Long userPaymentMethod = dib.getUserPaymentMethod(currentUserId);
                if (userPaymentMethod == null || userPaymentMethod == NOT_SET_PAYMENT_METHOD_ID) {
                    addError("PayMe", "No payment method is set for user");
                } else {
                    // Get and validate the list of payments for processing 
                    List<BasePayment> paymentsToPay = getAndValidatePayments(dib, currentUserId);

                    // Calculate and validate the total amount of payments to pay
                    double totalNetAmount = 0.00;
                    if (paymentsToPay.isEmpty()) {
                        addError("PayMe", "There are no payments selected");
                    } else {
                        for (BasePayment payment : paymentsToPay) {
                            totalNetAmount += payment.getNetAmount();
                        }
                        if (totalNetAmount < Constants.MINIMUM_PAYMENT_ACCRUAL_AMOUNT) {
                            addError("PayMe",
                                     "The total net amount for selected payments is less than $" +
                                     Constants.MINIMUM_PAYMENT_ACCRUAL_AMOUNT);
                        }
                    }
    
                    // Process payments if validation succeeds
                    if (!hasErrors()) {
                        if (userPaymentMethod == PAYPAL_PAYMENT_METHOD_ID) {
                            processPayPalPayments(dib, currentUserId, paymentsToPay, totalNetAmount);
                        } else if (userPaymentMethod == PAYONEER_PAYMENT_METHOD_ID) {
                            processPayoneerPayments(dib, currentUserId, paymentsToPay, totalNetAmount);
                        } else if (userPaymentMethod == WESTERN_UNION_PAYMENT_METHOD_ID) {
                            processWesternUnionPayments(dib, currentUserId, paymentsToPay);
                        } else {
                            throw new TCWebException("Unsupported payment method");
                        }

                        if (!hasErrors()) {
                            paymentProcessingLock.unlockPaymentProcessingOnSuccess(currentUserId, userPaymentMethod,
                                                                                   totalNetAmount, paymentsToPay);
                            success = true;
                            setIsNextPageInContext(false);
    
                            StringBuilder url = new StringBuilder();
                            url.append("/" + PactsConstants.MEMBER_SERVLET_URL + "?");
                            url.append(Constants.MODULE_KEY);
                            url.append("=PaymentHistory");
                            url.append("&").append(DataAccessConstants.SORT_DIRECTION).append("=").
                                append(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
                            url.append("&").append(DataAccessConstants.SORT_COLUMN).append("=").
                                append(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
                            url.append("&").append(DataAccessConstants.NUMBER_RECORDS).append("=").
                                append(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));
                            url.append("&").append(DataAccessConstants.START_RANK).append("=").
                                append(getRequest().getParameter(DataAccessConstants.START_RANK));
                            url.append("&").append(FULL_LIST).append("=").append(getRequest().getParameter(FULL_LIST));
    
                            setNextPage(url.toString());
    
                            return;
                        }
                    }
                }
            } catch (RemoteException e) {
                throw new TCWebException(e);
            } catch (SQLException e) {
                throw new TCWebException(e);
            } catch (PayPalServiceException e) {
                log.error("Failed to initiate payments via PayPal service", e);
                addError("PayMe", GENERIC_ERROR_MESSAGE);
            } catch (InvalidPaymentEventException e) {
                throw new TCWebException(e);
            } catch (StateTransitionFailureException e) {
                throw new TCWebException(e);
            } catch (PayoneerServiceException e) {
                log.error("Failed to initiate payments via Payoneer service", e);
                addError("PayMe", GENERIC_ERROR_MESSAGE);
            } catch (Exception e) {
                throw new TCWebException(e);
            } finally {
                if (!success) {
                    try {
                        paymentProcessingLock.unlockPaymentProcessingOnError(currentUserId);
                    } finally {
                        if (hasError("PayMe_InsufficientBalance")) {
                            List list = (List) getError("PayMe_InsufficientBalance");
                            Map<String, Object> errorDetails = (Map<String, Object>) list.get(0);
                            sendEmailOnInsufficientBalance(errorDetails);
                        }
                    }
                }
            }
        }

        // Executing this line means that there were some validation or service errors encountered so the validation
        // error message is to be displayed to user
        super.businessProcessing();
    }

    /**
     * <p>Processes the specified payments for specified user via Western Union.</p>
     *
     * @param dib a <code>DataInterfaceBean</code> providing interface to <code>PACTS Service EJB</code>.  
     * @param currentUserId a <code>long</code> providing the ID of current user.
     * @param paymentsToPay a <code>List</code> listing the payments to pay.
     * @throws Exception if an unexpected error occurs.
     */
    private void processWesternUnionPayments(DataInterfaceBean dib, long currentUserId,
                                       List<BasePayment> paymentsToPay) throws Exception {
        for (BasePayment payment : paymentsToPay) {
            payment.setMethodId(WESTERN_UNION_PAYMENT_METHOD_ID);
            payment.getCurrentStatus().enterIntoPaymentSystem(payment);
            dib.updatePayment(payment, false, currentUserId);
        }
    }

    /**
     * <p>Processes the specified payments for specified user via Payoneer service.</p>
     *
     * @param dib a <code>DataInterfaceBean</code> providing interface to <code>PACTS Service EJB</code>.  
     * @param currentUserId a <code>long</code> providing the ID of current user.
     * @param paymentsToPay a <code>List</code> listing the payments to pay. 
     * @param totalNetAmount a <code>double</code> providing the total amount of payments to pay. 
     * @throws Exception if an unexpected error occurs.
     */
    private void processPayoneerPayments(DataInterfaceBean dib, long currentUserId,
                                        List<BasePayment> paymentsToPay, double totalNetAmount) throws Exception {
        double currentBalance = PayoneerService.getBalanceAmount();
        if (currentBalance >= totalNetAmount) {
            PayoneerService.PayeeStatus payeeStatus = PayoneerService.getPayeeStatus(currentUserId);
            if (payeeStatus == PayoneerService.PayeeStatus.ACTIVATED) {
                long internalPaymentId = 0;
                for (BasePayment payment : paymentsToPay) {
                    payment.setPaidDate(new Date());
                    payment.setMethodId(PAYONEER_PAYMENT_METHOD_ID);
                    payment.getCurrentStatus().pay(payment);
                    dib.updatePayment(payment, false, currentUserId);
                    internalPaymentId = payment.getId();
                }
                PayoneerService.createPayment(internalPaymentId, currentUserId, totalNetAmount);
            } else {
                addError("PayMe", "Payoneer account is not active");
            }
        } else {
            addError("PayMe", GENERIC_ERROR_MESSAGE);
            addError("PayMe_InsufficientBalance",
                     createInsufficientBalanceErrorDetails("Payoneer", totalNetAmount, currentBalance));
        }
    }

    /**
     * <p>Processes the specified payments for specified user via PayPal service.</p>
     * 
     * @param dib a <code>DataInterfaceBean</code> providing interface to <code>PACTS Service EJB</code>.  
     * @param currentUserId a <code>long</code> providing the ID of current user.
     * @param paymentsToPay a <code>List</code> listing the payments to pay. 
     * @param totalNetAmount a <code>double</code> providing the total amount of payments to pay. 
     * @throws Exception if an unexpected error occurs.
     */
    private void processPayPalPayments(DataInterfaceBean dib, long currentUserId, List<BasePayment> paymentsToPay, 
                                       double totalNetAmount) throws Exception {
        double currentBalance = PayPalService.getBalanceAmount();
        if (currentBalance >= totalNetAmount) {
            String userPayPalAccount = dib.getUserPayPalAccount(currentUserId);
            if (userPayPalAccount != null && userPayPalAccount.trim().length() > 0) {
                String paymentKey = PayPalService.createPayment(userPayPalAccount, totalNetAmount);
                for (BasePayment payment : paymentsToPay) {
                    payment.setPaidDate(new Date());
                    payment.setMethodId(PAYPAL_PAYMENT_METHOD_ID);
                    payment.getCurrentStatus().pay(payment);
                    dib.updatePayment(payment, false, currentUserId);
                }
                PayPalService.executePayment(paymentKey);
            } else {
                addError("PayMe", "PayPal email address is not set");
            }
        } else {
            addError("PayMe", GENERIC_ERROR_MESSAGE);
            addError("PayMe_InsufficientBalance",
                     createInsufficientBalanceErrorDetails("PayPal", totalNetAmount, currentBalance));
        }
    }

    /**
     * <p>Builds the mapping for the error data for the case when there is an insufficient balance amount encountered
     * while attempting to process user payment.</p>
     * 
     * @param paymentMethod a <code>String</code> referencing the payment method.
     * @param totalNetAmount a <code>double</code> providing the requested total net amount. 
     * @param currentBalance a <code>double</code> providing the current balance amount. 
     * @return a <code>Map</code> mapping the logical names to data. 
     */
    private Map<String, Object> createInsufficientBalanceErrorDetails(String paymentMethod, double totalNetAmount,
                                                                      double currentBalance) {
        Map<String, Object> errorDetails = new HashMap<String, Object>();
        errorDetails.put("method", paymentMethod);
        errorDetails.put("handle", getUser().getUserName());
        errorDetails.put("requestedAmount", totalNetAmount);
        errorDetails.put("currentBalance", currentBalance);
        errorDetails.put("timestamp", new Date());
        return errorDetails;
    }

    /**
     * <p>Gets the list of payments which have been requested by the current user for processing. Also validates the
     * requested payments and binds validation errors to request in case such errors are found.</p>
     * 
     * @param dib a <code>DataInterfaceBean</code> providing interface to PACTS Services EJB.  
     * @param currentUserId a <code>long</code> providing the ID of current user.
     * @return a <code>List</code> listing the payments belonging to current user which have been requested by the user
     *         for paying.
     * @throws RemoteException if an unexpected error occurs.
     */
    @SuppressWarnings("unchecked")
    private List<BasePayment> getAndValidatePayments(DataInterfaceBean dib, long currentUserId)
        throws RemoteException {

        TCRequest request = getRequest();
        
        Map criteria = new HashMap();
        criteria.put(PactsConstants.USER_ID, String.valueOf(currentUserId));
        List<BasePayment> payments = dib.findCoderPayments(criteria);

        // Get payment IDs 
        String[] paymentIds = request.getParameterValues(PAYMENT_ID);

        // Do validation
        List<BasePayment> paymentsToPay = new ArrayList<BasePayment>();

        // Validation for payments as requested by user
        Set<Long> paymentIdsSet = new HashSet<Long>();
        for (String paymentIdString : paymentIds) {
            long paymentId = Long.parseLong(paymentIdString);
            if (!paymentIdsSet.contains(paymentId)) {
                paymentIdsSet.add(paymentId);

                boolean found = false;
                for (BasePayment payment : payments) {
                    if (payment.getId() == paymentId) {
                        found = true;
                        if (payment.getCoderId() != currentUserId) { // This is a safety check just in case
                                                                     // dib.findCoderPayments(criteria) above
                                                                     // returns payments which do not 
                                                                     // belong to current user
                            addError("PayMe", "The payment \"" + payment.getDescription()
                                              + "\" does not belong to user");
                        } else if (!(payment.getCurrentStatus().getId().equals(OwedPaymentStatus.ID) ||
                                     payment.getCurrentStatus().getId().equals(AccruingPaymentStatus.ID))) {
                            addError("PayMe", "The payment \"" + payment.getDescription() 
                                              + "\" is neither of Owed nor Accruing status");
                        } else if (payment.getDueDate() == null ||
                                   payment.getDueDate().compareTo(new Date()) > 0) {
                            addError("PayMe", "The release date for payment \"" + payment.getDescription()
                                              + "\" is not reached yet");
                        }
                        paymentsToPay.add(payment);
                    }
                }

                if (!found) {
                    addError("PayMe", "The payment with ID " + paymentId + " could not be found");
                }
            }
        }

        // Validation for negative payments
        for (BasePayment payment : payments) {
            if (payment.getPaymentType() == NEGATIVE_PAYMENT && (
                payment.getCurrentStatus().getId().equals(OwedPaymentStatus.ID) ||
                payment.getCurrentStatus().getId().equals(AccruingPaymentStatus.ID))) {
                if (!paymentIdsSet.contains(payment.getId())) {
                    addError("PayMe", "The negative payment \"" + payment.getDescription() 
                                      + "\" must be selected. Please expand the view to make sure that all pending " +
                                      "negative payments are selected.");
                }
            }
        }
        return paymentsToPay;
    }

    /**
     * <p>Sends an email to pre-configured email address when there's insufficient account balance.</p>
     * 
     * @param errorDetails a <code>Map</code> providing error data. 
     */
    private void sendEmailOnInsufficientBalance(Map<String, Object> errorDetails) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(EMAIL_TIMESTAMP_FORMAT);        
            DecimalFormat df = new DecimalFormat("0.00", new DecimalFormatSymbols(Locale.US));
            String emailBody = "A member payment request failed due to the insufficient balance amount.\n\n" +
                "Time: " + formatter.format(errorDetails.get("timestamp")) + "\n" +
                "Payment Method: " + errorDetails.get("method") + "\n" +
                "Member Handle: " + errorDetails.get("handle") + "\n" +
                "Requested Amount: " + df.format(errorDetails.get("requestedAmount")) + "\n" +
                "Current Balance: " + df.format(errorDetails.get("currentBalance"));

            TCSEmailMessage message = new TCSEmailMessage();
            message.setFromAddress(Constants.INSUFFICIENT_BALANCE_EMAIL_FROM_ADDRESS);
            message.setToAddress(Constants.INSUFFICIENT_BALANCE_EMAIL_TO_ADDRESS, TCSEmailMessage.TO);
            message.setSubject(Constants.INSUFFICIENT_BALANCE_EMAIL_SUBJECT);
            message.setBody(emailBody);
            EmailEngine.send(message);
            log.info("Sent email notifying on insufficient balance on " + errorDetails.get("method") + " system to " +
                     Constants.INSUFFICIENT_BALANCE_EMAIL_TO_ADDRESS);
        } catch (Exception e) {
            log.error("Failed to send an email notifying on insufficient balance", e);
        }
    }
}
