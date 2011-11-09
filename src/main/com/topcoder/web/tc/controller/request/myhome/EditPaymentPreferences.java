/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

import java.rmi.RemoteException;

import static com.topcoder.web.tc.Constants.MODULE_KEY;
import static com.topcoder.web.tc.Constants.MINIMUM_PAYMENT_ACCRUAL_AMOUNT;

/**
 * <p>A controller for requests relevant to <code>Edit Payment Preferences</code> functionality. As of current version
 * interprets all <code>GET</code> requests as requests for displaying <code>Edit Payment Preferences</code> page and
 * <code>POST</code> requests as requests for handling the submission of <code>Edit Payment Preferences</code> form.</p>
 *
 * @author isv, VolodymyrK
 * @version 1.1
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
     * <p>Constructs new <code>EditPaymentPreferences</code> instance. This implementation does nothing.</p>
     */
    public EditPaymentPreferences() {
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
                    getRequest().getParameter(PAYMENT_METHOD_PARAM));
            }
        } else {
            // GET request is treated as request for displaying the Payment Preferences form
            DataInterfaceBean dataBean = new DataInterfaceBean();
            int currentPaymentAccrualAmount = (int) dataBean.getUserAccrualThreshold(getUser().getId());
            if (currentPaymentAccrualAmount == 0) {
                currentPaymentAccrualAmount = MINIMUM_PAYMENT_ACCRUAL_AMOUNT;
            }
            String paymentMethod = dataBean.getUserPaymentMethod(getUser().getId());
            forwardToEditPaymentPreferencesView(String.valueOf(currentPaymentAccrualAmount), paymentMethod);
        }
    }

    /**
     * <p>Handles the <code>Edit Payment Preferences</code> web form submission in regard to setting the payment accrual
     * amount and payment method for current user.</p>
     *
     * <p>Parses the new payment accrual amount value from respective request parameter and verifies that such a value
     * is provided and is numeric value greater than {@link com.topcoder.web.tc.Constants#MINIMUM_PAYMENT_ACCRUAL_AMOUNT}.
	 * Also checks that the specified payment method is either PayPal, Wire or ACH.
	 * If any of those validation rules is violated then appropriate error message is bound to incoming request.
	 * Otherwise the new payment preferences for current user are saved to persistent data store.</p>
     *
     * @throws RemoteException if an error is encountered while communicating to <code>PACTS Services EJB</code>
     *         remotely.
     */
    private void savePaymentPreferences() throws RemoteException {
        TCRequest request = getRequest();
        DataInterfaceBean dataBean = new DataInterfaceBean();

        // Parse accrual amount from request and validate that it's numeric and is greater than minimum allowed value
        String accrualAmountValue = request.getParameter(ACCRUAL_AMOUNT_PARAM);
        String paymentMethodValue = request.getParameter(PAYMENT_METHOD_PARAM);

        if (isEmpty(accrualAmountValue)) {
            addError(ACCRUAL_AMOUNT_PARAM, "You must specify a payment accrual amount");
        } else if (isEmpty(paymentMethodValue)) {
            addError(PAYMENT_METHOD_PARAM, "You must specify a preferred payment method");
        } else if (!paymentMethodValue.equals("PayPal") && !paymentMethodValue.equals("Wire") && !paymentMethodValue.equals("ACH")) {
            addError(PAYMENT_METHOD_PARAM, "Incorrect payment method specified");
        } else {
            try {
                int newAccrualAmount = Integer.parseInt(accrualAmountValue);
                if (newAccrualAmount < MINIMUM_PAYMENT_ACCRUAL_AMOUNT) {
                    addError(ACCRUAL_AMOUNT_PARAM,
                            "Payment accrual amount must be greater or equal to $" + MINIMUM_PAYMENT_ACCRUAL_AMOUNT);
                } else {
                    dataBean.saveUserAccrualThreshold(getUser().getId(), newAccrualAmount);
                    dataBean.saveUserPaymentMethod(getUser().getId(), paymentMethodValue);
                }
            } catch (NumberFormatException e) {
                addError(ACCRUAL_AMOUNT_PARAM, "Payment accrual amount must be integer number");
            }
        }
    }

    /**
     * <p>Forwards request to <code>Edit Payment Preferences</code> screen.</p>
     *
     * <p>Binds specified payment preference values to request so they could be accessed by sub-sequent view.</p>
     *
     * @param paymentAccrualAmount a <code>String</code> providing the payment accrual amount to be displayed to user.
     * @param paymentMethod a <code>String</code> providing the payment method to be displayed to user.
     */
    private void forwardToEditPaymentPreferencesView(String paymentAccrualAmount, String paymentMethod) {
        setDefault(ACCRUAL_AMOUNT_PARAM, paymentAccrualAmount);
        setDefault(PAYMENT_METHOD_PARAM, paymentMethod);
        setIsNextPageInContext(true);
        setNextPage("/my_home/paymentPreferences.jsp");
    }
}
