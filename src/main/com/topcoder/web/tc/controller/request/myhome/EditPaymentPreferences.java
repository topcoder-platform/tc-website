/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.tc.controller.PayoneerService;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.model.PaymentMethod;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.*;
import com.topcoder.shared.dataAccess.resultSet.*;

import static com.topcoder.web.tc.Constants.MODULE_KEY;
import static com.topcoder.web.tc.Constants.MINIMUM_PAYMENT_ACCRUAL_AMOUNT;
import static com.topcoder.web.ejb.pacts.Constants.NOT_SET_PAYMENT_METHOD_ID;
import static com.topcoder.web.ejb.pacts.Constants.PAYONEER_PAYMENT_METHOD_ID;

import java.util.*;

/**
 * <p>A controller for requests relevant to <code>Edit Payment Preferences</code> functionality. As of current version
 * interprets all <code>GET</code> requests as requests for displaying <code>Edit Payment Preferences</code> page and
 * <code>POST</code> requests as requests for handling the submission of <code>Edit Payment Preferences</code> form.</p>
 *
 * @author isv, VolodymyrK
 * @version 1.1
 */
public class EditPaymentPreferences extends ShortHibernateProcessor {

    private static final String DEFAULT_PAYONEER_NAMESPACE = "com.topcoder.payoneer";

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

        loadPaymentMethods();

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
            Long paymentMethodId = dataBean.getUserPaymentMethod(getUser().getId());
            forwardToEditPaymentPreferencesView(String.valueOf(currentPaymentAccrualAmount),
                paymentMethodId == null ? "" : paymentMethodId.toString());
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

            // Don't show the "Not Set" option.
            if (methodID != NOT_SET_PAYMENT_METHOD_ID) {
                PaymentMethod paymentMethod = new PaymentMethod();
                paymentMethod.setId(methodID);
                paymentMethod.setName(methodDesc);
                paymentMethods.add(paymentMethod);
           }
        }
        getRequest().setAttribute("paymentMethods", paymentMethods);
    }

    /**
     * <p>Handles the <code>Edit Payment Preferences</code> web form submission in regard to setting the payment accrual
     * amount and payment method for current user.</p>
     *
     * <p>Parses the new payment accrual amount value from respective request parameter and verifies that such a value
     * is provided and is numeric value greater than {@link com.topcoder.web.tc.Constants#MINIMUM_PAYMENT_ACCRUAL_AMOUNT}.
     * Also checks that the specified payment method is not the "Not Set" one.
     * If any of those validation rules is violated then appropriate error message is bound to incoming request.
     * Otherwise the new payment preferences for current user are saved to persistent data store.</p>
     *
     * @throws RemoteException if an error is encountered while communicating to <code>PACTS Services EJB</code>
     *         remotely.
     */
    private void savePaymentPreferences() throws Exception {
        TCRequest request = getRequest();
        DataInterfaceBean dataBean = new DataInterfaceBean();

        // Parse accrual amount from request and validate that it's numeric and is greater than minimum allowed value
        String accrualAmountValue = request.getParameter(ACCRUAL_AMOUNT_PARAM);
        String paymentMethodValue = request.getParameter(PAYMENT_METHOD_PARAM);

        if (isEmpty(accrualAmountValue)) {
            addError(ACCRUAL_AMOUNT_PARAM, "You must specify a payment accrual amount");
        } else if (isEmpty(paymentMethodValue)) {
            addError(PAYMENT_METHOD_PARAM, "You must specify a preferred payment method");
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
                PayoneerService.PayeeStatus payeeStatus = PayoneerService.getPayeeStatus(getLoggedInUser().getId());
                if (payeeStatus == PayoneerService.PayeeStatus.NOT_REGISTERED) {
                    addError(PAYMENT_METHOD_PARAM, "You have not registered with Payoneer yet");
                }
                if (payeeStatus == PayoneerService.PayeeStatus.REGISTERED) {
                    addError(PAYMENT_METHOD_PARAM, "You have not activated with Payoneer yet");
                }
            }

            if (!hasErrors()) {
                if (newAccrualAmount < MINIMUM_PAYMENT_ACCRUAL_AMOUNT) {
                    addError(ACCRUAL_AMOUNT_PARAM,
                             "Payment accrual amount must be greater or equal to $" + MINIMUM_PAYMENT_ACCRUAL_AMOUNT);
                } else if (paymentMethodId <= 0 || paymentMethodId == NOT_SET_PAYMENT_METHOD_ID) {
                    addError(PAYMENT_METHOD_PARAM, "Payment method is incorrect");
                } else {
                    dataBean.saveUserAccrualThreshold(getUser().getId(), newAccrualAmount);
                    dataBean.saveUserPaymentMethod(getUser().getId(), paymentMethodId);
                }
            }
        }
    }

    /**
     * <p>Forwards request to <code>Edit Payment Preferences</code> screen.</p>
     *
     * <p>Binds specified payment preference values to request so they could be accessed by sub-sequent view.</p>
     *
     * @param paymentAccrualAmount a <code>String</code> providing the payment accrual amount to be displayed to user.
     * @param paymentMethodId a <code>String</code> providing the ID of the the payment method to be displayed to user.
     */
    private void forwardToEditPaymentPreferencesView(String paymentAccrualAmount, String paymentMethodId) {
        setDefault(ACCRUAL_AMOUNT_PARAM, paymentAccrualAmount);
        setDefault(PAYMENT_METHOD_PARAM, paymentMethodId);
        setIsNextPageInContext(true);
        setNextPage("/my_home/paymentPreferences.jsp");
    }
}
