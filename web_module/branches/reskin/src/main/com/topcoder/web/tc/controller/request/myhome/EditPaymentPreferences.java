/*
 * Copyright (C) 2010-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.PayoneerService;
import com.topcoder.web.tc.controller.PayoneerServiceException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.model.PaymentMethod;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;
import com.topcoder.shared.dataAccess.resultSet.*;

import static com.topcoder.web.tc.Constants.MODULE_KEY;
import static com.topcoder.web.tc.Constants.MINIMUM_PAYMENT_ACCRUAL_AMOUNT;
import static com.topcoder.web.ejb.pacts.Constants.PAYPAL_PAYMENT_METHOD_ID;
import static com.topcoder.web.ejb.pacts.Constants.PAYONEER_PAYMENT_METHOD_ID;

import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.*;

/**
 * <p>A controller for requests relevant to <code>Edit Payment Preferences</code> functionality. As of current version
 * interprets all <code>GET</code> requests as requests for displaying <code>Edit Payment Preferences</code> page and
 * <code>POST</code> requests as requests for handling the submission of <code>Edit Payment Preferences</code> form.</p>
 *
 * <p>
 * Version 1.2 Change notes:
 *   <ol>
 *     <li>Updated {@link #savePaymentPreferences()} method to send email to user in case payment method or PayPal 
 *     account has changed.</li>
 *   </ol>
 * </p>
 *
 * @author isv, VolodymyrK
 * @version 1.2
 */
public class EditPaymentPreferences extends ShortHibernateProcessor {

    /**
     * <p>A <code>String</code> providing the name of request parameter providing the payment accrual amount provided by
     * current user.</p>
     */
    public static final String ACCRUAL_AMOUNT_PARAM = "accrualAmount";

    /**
     * <p>A <code>String</code> providing the name of request parameter providing the payment method provided by
     * current user.</p>
     */
    public static final String PAYMENT_METHOD_PARAM = "paymentMethod";

    /**
     * <p>A <code>String</code> providing the name of request parameter providing the PayPal account provided by
     * current user.</p>
     */
    public static final String PAYPAL_ACCOUNT_PARAM = "paypalAccount";

    /**
     * <p>Format for the email timestamp. Will format as "Fri, Jul 28, 2006 01:34 PM EST".</p>
     */
    private static final String EMAIL_TIMESTAMP_FORMAT = "MM/dd/yyyy hh:mm a z";

    /**
     * <p>Regex pattern to validate email addresses.</p>
     */
    private static final String EMAIL_PATTERN = "([_A-Za-z0-9-\\+]+)(\\.[_A-Za-z0-9-\\+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})";

    private Pattern pattern;
    
    /**
     * <p>Constructs new <code>EditPaymentPreferences</code> instance.
     * Simply initializes the regex pattern object..</p>
     */
    public EditPaymentPreferences() {
        pattern = Pattern.compile(EMAIL_PATTERN);
    }

    /**
     * <p>Implements the business logic for handling the incoming request. The incoming request (if of <code>GET</code>
     * type) may require the <code>Edit Payment Preferences</code> screen to be displayed or require to process the
     * <code>Edit Payment Preferences</code> web form submission (if of <code>POST</code> type).</p>
     *
     * @throws PermissionException if current user is not authenticated to application yet.
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        // Prohibit anonymous users from accessing this functionality
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        loadPaymentMethods();
        loadPayoneerStatus();

        // Analyze the type of request.
        if ("POST".equalsIgnoreCase(getRequest().getMethod())) {
            // POST request is treated as submission of Payment Preferences form
            savePaymentPreferences();
            if (!hasErrors()) {
                // There were no validation errors - do redirect after POST to My TopCoder page
                setIsNextPageInContext(false);
                setNextPage("/tc?" + MODULE_KEY + "=MyHome");
            } else {
                // There were validation errors - forward to Edit Payment Preferences page to display errors
                forwardToEditPaymentPreferencesView(
                    getRequest().getParameter(ACCRUAL_AMOUNT_PARAM),
                    getRequest().getParameter(PAYMENT_METHOD_PARAM),
                    getRequest().getParameter(PAYPAL_ACCOUNT_PARAM));
            }
        } else {
            // GET request is treated as request for displaying the Payment Preferences form
            DataInterfaceBean dataBean = new DataInterfaceBean();
            int currentPaymentAccrualAmount = (int) dataBean.getUserAccrualThreshold(getUser().getId());
            if (currentPaymentAccrualAmount == 0) {
                currentPaymentAccrualAmount = MINIMUM_PAYMENT_ACCRUAL_AMOUNT;
            }
            Long paymentMethodId = dataBean.getUserPaymentMethod(getUser().getId());

            String payPalAccount = dataBean.getUserPayPalAccount(getUser().getId());

            forwardToEditPaymentPreferencesView(String.valueOf(currentPaymentAccrualAmount),
                paymentMethodId == null ? "" : paymentMethodId.toString(), payPalAccount);
        }
    }

    /**
     * <p>Load all payment methods and saves them in the response.</p>
     *
     * @throws Exception if an error is encountered.
     */
    private void loadPaymentMethods() throws Exception {
        DataInterfaceBean dataBean = new DataInterfaceBean();
        ResultSetContainer rsc = (ResultSetContainer) dataBean.getPaymentMethods().get(PactsConstants.PAYMENT_METHOD_LIST);

        List<PaymentMethod> paymentMethods = new ArrayList<PaymentMethod>();
        for (int i=0;i<rsc.getRowCount();i++) {
            ResultSetContainer.ResultSetRow rsr = rsc.getRow(i);
            long methodID = TCData.getTCLong(rsr, "payment_method_id", 0, true);
            String methodDesc = TCData.getTCString(rsr, "payment_method_desc", "method", true);
            boolean active = TCData.getTCBoolean(rsr, "active", true, true);

            if (active) {
                PaymentMethod paymentMethod = new PaymentMethod();
                paymentMethod.setId(methodID);
                paymentMethod.setName(methodDesc);
                paymentMethods.add(paymentMethod);
            }
        }
        getRequest().setAttribute("paymentMethods", paymentMethods);
    }

    /**
     * <p>Reads the payee status and registration link from the Payoneer service.</p>
     */
    private void loadPayoneerStatus() {
        boolean payoneerActivated = false;
        try {
            PayoneerService.PayeeStatus payeeStatus = PayoneerService.getPayeeStatus(getUser().getId());
            // Only show the registration link if the member hasn't activated with Payoneer yet
            if (payeeStatus == PayoneerService.PayeeStatus.ACTIVATED) {
                payoneerActivated = true;
            } else {
                String payoneerRegLink = PayoneerService.getRegistrationLink(getUser().getId());
                getRequest().setAttribute("payoneerRegLink", payoneerRegLink);
            }
        } catch (PayoneerServiceException pse) {
            // If an exception happened assume user is not activated
            payoneerActivated = false;
            log.error("Payoneer service error.", pse);
        }

        getRequest().setAttribute("payoneerActivated", payoneerActivated);
    }

    /**
     * <p>Handles the <code>Edit Payment Preferences</code> web form submission in regard to setting the payment accrual
     * amount and payment method for current user.</p>
     *
     * <p>Parses the new payment accrual amount value from respective request parameter and verifies that such a value
     * is provided and is numeric value greater than {@link com.topcoder.web.tc.Constants#MINIMUM_PAYMENT_ACCRUAL_AMOUNT}.
     * Also checks that the specified payment method is active.
     * If any of those validation rules is violated then appropriate error message is bound to incoming request.
     * Otherwise the new payment preferences for current user are saved to persistent data store.</p>
     *
     * @throws Exception if an error is encountered while communicating to <code>PACTS Services EJB</code> remotely.
     */
    private void savePaymentPreferences() throws Exception {
        TCRequest request = getRequest();
        DataInterfaceBean dataBean = new DataInterfaceBean();

        // Parse accrual amount from request and validate that it's numeric and is greater than minimum allowed value
        String accrualAmountValue = request.getParameter(ACCRUAL_AMOUNT_PARAM);
        String paymentMethodValue = request.getParameter(PAYMENT_METHOD_PARAM);
        String payPalAccountValue = request.getParameter(PAYPAL_ACCOUNT_PARAM);

        if (isEmpty(accrualAmountValue)) {
            addError(ACCRUAL_AMOUNT_PARAM, "You must specify a payment accrual amount");
        } else if (isEmpty(paymentMethodValue)) {
            addError(PAYMENT_METHOD_PARAM, "You must specify a preferred payment method");
        } else if (!isEmpty(payPalAccountValue) && !checkEmailAddress(payPalAccountValue)) {
            addError(PAYPAL_ACCOUNT_PARAM, "Invalid email address specified for the PayPal account");
        } else {
            int newAccrualAmount = 0;
            try {
                newAccrualAmount = Integer.parseInt(accrualAmountValue);
            } catch (NumberFormatException e) {
                addError(ACCRUAL_AMOUNT_PARAM, "Payment accrual amount must be an integer number");
            }

            long paymentMethodId = 0;
            try {
                paymentMethodId = Long.parseLong(paymentMethodValue);
            } catch (NumberFormatException e) {
                addError(PAYMENT_METHOD_PARAM, "Payment method ID must be an integer number");
            }
            
            if (paymentMethodId == PAYONEER_PAYMENT_METHOD_ID) {
                PayoneerService.PayeeStatus payeeStatus = PayoneerService.getPayeeStatus(getUser().getId());
                if (payeeStatus == PayoneerService.PayeeStatus.NOT_REGISTERED) {
                    addError(PAYMENT_METHOD_PARAM, "You have not registered with Payoneer yet");
                }
                if (payeeStatus == PayoneerService.PayeeStatus.REGISTERED) {
                    addError(PAYMENT_METHOD_PARAM, "You have not activated with Payoneer yet");
                }
            }

            if (paymentMethodId == PAYPAL_PAYMENT_METHOD_ID && isEmpty(payPalAccountValue)) {
                addError(PAYPAL_ACCOUNT_PARAM, "You must specify your PayPal account email address");
            }

            if (!hasErrors()) {
                if (newAccrualAmount < MINIMUM_PAYMENT_ACCRUAL_AMOUNT) {
                    addError(ACCRUAL_AMOUNT_PARAM,
                             "Payment accrual amount must be greater or equal to $" + MINIMUM_PAYMENT_ACCRUAL_AMOUNT);
                } else if (paymentMethodId <= 0 || isActive(paymentMethodId) == false) {
                    addError(PAYMENT_METHOD_PARAM, "Payment method is incorrect");
                } else {
                    // Get current payment method and PayPal email address before updating the payment preferences in DB
                    Long oldPaymentMethodId = dataBean.getUserPaymentMethod(getUser().getId());
                    String oldPayPalAccount = dataBean.getUserPayPalAccount(getUser().getId());

                    dataBean.saveUserAccrualThreshold(getUser().getId(), newAccrualAmount);
                    dataBean.saveUserPaymentMethod(getUser().getId(), paymentMethodId);
                    dataBean.saveUserPayPalAccount(getUser().getId(), payPalAccountValue);

                    // In case payment method or PayPal email address has changed - notify user on the change
                    if ((oldPaymentMethodId == null || oldPaymentMethodId != paymentMethodId)
                        || hasPayPalAccountChanged(oldPayPalAccount, payPalAccountValue)) {
                        User currentUser = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
                        sendEmailOnPaymentPreferencesUpdated(oldPaymentMethodId, paymentMethodId, oldPayPalAccount,
                                                             payPalAccountValue,
                                                             currentUser.getPrimaryEmailAddress().getAddress());
                    }
                }
            }
        }
    }

    /**
     * <p>Returns true if the given payment method is active and false otherwise.</p>
     *
     * @param paymentMethodId payment method ID to check
     * @return true if the given payment method is active and false otherwise.
     */
    private boolean isActive(long paymentMethodId) {
        List<PaymentMethod> paymentMethods = (List<PaymentMethod>) getRequest().getAttribute("paymentMethods");
        for (PaymentMethod paymentMethod : paymentMethods) {
            if (paymentMethod.getId() == paymentMethodId) {
                return true;
            }
        }
        return false;
    }

    private boolean checkEmailAddress(String emailAddress) {
        if (emailAddress == null || emailAddress.length() > 100) {
            return false;
        }

        return pattern.matcher(emailAddress).matches();
    }

    /**
     * <p>Forwards request to <code>Edit Payment Preferences</code> screen.</p>
     *
     * <p>Binds specified payment preference values to request so they could be accessed by sub-sequent view.</p>
     *
     * @param paymentAccrualAmount a <code>String</code> providing the payment accrual amount to be displayed to user.
     * @param paymentMethodId a <code>String</code> providing the ID of the the payment method to be displayed to user.
     * @param payPalAccount a <code>String</code> providing the email address of the user's PayPal account.
     */
    private void forwardToEditPaymentPreferencesView(String paymentAccrualAmount, String paymentMethodId, String payPalAccount) {
        setDefault(ACCRUAL_AMOUNT_PARAM, paymentAccrualAmount);
        setDefault(PAYMENT_METHOD_PARAM, paymentMethodId);
        setDefault(PAYPAL_ACCOUNT_PARAM, payPalAccount);

        setIsNextPageInContext(true);
        setNextPage("/my_home/paymentPreferences.jsp");
    }

    /**
     * <p>Sends an email to email address for current user in case either payment method or PayPal email address have 
     * changed when servicing the request for updating user's payment preferences.</p>
     *
     * @param oldPaymentMethodId a <code>long</code> providing the ID of old payment method.
     * @param paymentMethodId a <code>long</code> providing the ID of new payment method.
     * @param oldPayPalAccount a <code>String</code> providing the old PayPal account.
     * @param payPalAccountValue a <code>String</code> providing the new PayPal account.
     * @param toAddress a <code>String</code> providing the email address to send email to.
     * @since 1.2
     */
    private void sendEmailOnPaymentPreferencesUpdated(Long oldPaymentMethodId, long paymentMethodId,
                                                      String oldPayPalAccount, String payPalAccountValue, 
                                                      String toAddress) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(EMAIL_TIMESTAMP_FORMAT);
            StringBuilder emailBody = new StringBuilder();

            emailBody.append("<p>On ").append(formatter.format(new Date())).append(
                ", your <a href=\"https://community.topcoder.com/tc?module=EditPaymentPreferences\">Payment Preference</a> " +
                "information was updated.</p>");
            emailBody.append("<p>The following changes have been made:</p>");
            
            emailBody.append("<ul>");
            if (oldPaymentMethodId == null) {
                emailBody.append("<li>Payment Method was set to ")
                    .append(resolvePaymentMethod(paymentMethodId).getName()).append(".</li>");
            } else if (oldPaymentMethodId != paymentMethodId) {
                emailBody.append("<li>Payment Method was changed from ")
                    .append(resolvePaymentMethod(oldPaymentMethodId).getName()).append(" to ")
                    .append(resolvePaymentMethod(paymentMethodId).getName()).append(".</li>");
            }
            
            if (isEmpty(oldPayPalAccount)) {
                emailBody.append("<li>Your PayPal account email address was set to ")
                    .append(isEmpty(payPalAccountValue) ? "" : payPalAccountValue).append(".</li>");
            } else if (isEmpty(payPalAccountValue)) {
                emailBody.append("<li>Your PayPal account email address ").append(
                    isEmpty(oldPayPalAccount) ? "" : oldPayPalAccount).append(" was reset.</li>");
            } else if (hasPayPalAccountChanged(oldPayPalAccount, payPalAccountValue)) {
                emailBody.append("<li>Your PayPal account email address was changed from ").append(
                    isEmpty(oldPayPalAccount) ? "" : oldPayPalAccount).append(" to ").append(
                    isEmpty(payPalAccountValue) ? "" : payPalAccountValue).append(".</li>");
            }
            emailBody.append("</ul>");

            emailBody.append("<p>If you did not initiate these changes, " +
                "please <a href=\"www.topcoder.com/aboutus/contact-us\">contact</a> TopCoder immediately.</p>");
            
            TCSEmailMessage message = new TCSEmailMessage();
            message.setFromAddress(Constants.PAYMENT_PREFS_UPDATE_EMAIL_FROM_ADDRESS);
            message.setToAddress(toAddress, TCSEmailMessage.TO);
            message.setSubject(Constants.PAYMENT_PREFS_UPDATE_EMAIL_SUBJECT);
            message.setBody(emailBody.toString());
            message.setContentType("text/html");
            EmailEngine.send(message);
            log.info("Sent email notifying on updates to user's payment preferences to " + toAddress);
        } catch (Exception e) {
            log.error("Failed to send an email notifying on updates to user's payment preferences", e);
        }
    }

    /**
     * <p>Gets the details for payment method matching the specified ID.</p>
     * 
     * @param paymentMethodId a <code>long</code> providing the ID of payment method.
     * @return a <code>PaymentMethod</code> providing the details for payment method matching the specified ID or 
     *         <code>null</code> if such a method is not found. 
     * @since 1.2
     */
    @SuppressWarnings("unchecked")
    private PaymentMethod resolvePaymentMethod(long paymentMethodId) {
        List<PaymentMethod> paymentMethods = (List<PaymentMethod>) getRequest().getAttribute("paymentMethods");
        for (PaymentMethod paymentMethod : paymentMethods) {
            if (paymentMethod.getId() == paymentMethodId) {
                return paymentMethod;
            }
            
        }
        return null;
    }

    /**
     * <p>Checks if PayPal account has changed.</p>
     * 
     * @param oldPayPalAccount a <code>String</code> providing old PayPal account.
     * @param newPayPalAccount a <code>String</code> providing new PayPal account.
     * @return <code>true</code> if PayPal account has changed; <code>false</code> otherwise.
     * @since 1.2
     */
    private boolean hasPayPalAccountChanged(String oldPayPalAccount, String newPayPalAccount) {
        if (isEmpty(oldPayPalAccount)) {
            return !isEmpty(newPayPalAccount);
        } else {
            return !oldPayPalAccount.equalsIgnoreCase(newPayPalAccount);
        }
    }
}
