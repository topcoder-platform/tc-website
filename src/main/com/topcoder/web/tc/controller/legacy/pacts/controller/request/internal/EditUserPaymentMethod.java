package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.PaymentMethod;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;
import com.topcoder.shared.dataAccess.resultSet.*;
import java.util.*;

import java.rmi.RemoteException;

import static com.topcoder.web.ejb.pacts.Constants.NOT_SET_PAYMENT_METHOD_ID;

/**
 *
 * @author  VolodymyrK
 */
public class EditUserPaymentMethod extends PactsBaseProcessor implements PactsConstants {

    /**
     * <p>A <code>String</code> providing the name of request parameter providing the payment method provided by
     * current user.</p>
     */
    public static final String PAYMENT_METHOD_PARAM = "paymentMethod";

    protected void businessProcessing() throws Exception {
        long userId = 0;
        
        try {
            userId = getLongParameter(USER_ID);
        } catch (IllegalArgumentException iae) {
        }            

        if (userId == 0) {
            throw new IllegalArgumentException("Missing parameter " + USER_ID);
        }

        loadPaymentMethods();

        DataInterfaceBean dataBean = new DataInterfaceBean();
        if ("POST".equalsIgnoreCase(getRequest().getMethod())) {
            // POST request is treated as submission of Payment Preferences form
            saveUserPaymentMethod();
            if (!hasErrors()) {
                // There were no validation errors - do redirect after POST to "view user" page
                setIsNextPageInContext(false);
                setNextPage(Links.viewUser(userId));
            } else {
                // There were validation errors - forward to Edit User Payment Method page to display errors
                setDefault(PAYMENT_METHOD_PARAM, getRequest().getParameter(PAYMENT_METHOD_PARAM));
                getRequest().setAttribute("user", new UserProfileHeader(dataBean.getUserProfileHeader(userId)));
                setIsNextPageInContext(true);
                setNextPage(INTERNAL_EDIT_USER_PAYMENT_METHOD_JSP);
            }
        } else {
            // GET request is treated as request for displaying the Payment Preferences form
            Long paymentMethodId = dataBean.getUserPaymentMethod(userId);

            setDefault(PAYMENT_METHOD_PARAM, paymentMethodId == null ? "" : paymentMethodId.toString());
            getRequest().setAttribute("user", new UserProfileHeader(dataBean.getUserProfileHeader(userId)));
            setIsNextPageInContext(true);
            setNextPage(INTERNAL_EDIT_USER_PAYMENT_METHOD_JSP);
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
     * <p>Handles the <code>Edit User Payment Method</code> web form submission in regard to setting the
     * payment method for current user.</p>
     *
     * <p>Parses the new payment method ID value from respective request parameter and verifies that such a value
     * is provided and is numeric value.
     * Also checks that the specified payment method is not the "Not Set" one.
     * If any of those validation rules is violated then appropriate error message is bound to incoming request.
     * Otherwise the new payment preferences for current user are saved to persistent data store.</p>
     *
     * @throws RemoteException if an error is encountered while communicating to <code>PACTS Services EJB</code>
     *         remotely.
     */
    private void saveUserPaymentMethod() throws RemoteException {
        long userId = getLongParameter(USER_ID);
        String paymentMethodValue = getRequest().getParameter(PAYMENT_METHOD_PARAM);

        if (isEmpty(paymentMethodValue)) {
            addError(PAYMENT_METHOD_PARAM, "You must specify a preferred payment method");
        } else {
            try {
                long paymentMethodId = Long.parseLong(paymentMethodValue);
                if (paymentMethodId <= 0 || paymentMethodId == NOT_SET_PAYMENT_METHOD_ID) {
                    addError(PAYMENT_METHOD_PARAM, "Payment method is incorrect");
                } else {
                    DataInterfaceBean dataBean = new DataInterfaceBean();
                    dataBean.saveUserPaymentMethod(userId, paymentMethodId);
                }
            } catch (NumberFormatException e) {
                addError(PAYMENT_METHOD_PARAM, "Payment method ID must be an integer number");
            }
        }
    }

}