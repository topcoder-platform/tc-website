package com.topcoder.web.tc.controller.legacy.pacts.controller.request.member;

import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.CachedDataAccess;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory;
import com.topcoder.web.ejb.pacts.payments.PaymentStatusFactory.PaymentStatus;

/**
 * @author  VolodymyrK
 */
public class PaymentStatusSummary extends BaseProcessor implements PactsConstants {

    public static final String PAYMENT_STATUS_SUMMARY = "payment_status_summary";
    public static final String CODER = "cr";
    private static final int TYPE_COL = 1;
    private static final int NET_PAYMENT_COL = 2;

    protected void businessProcessing() throws TCWebException {
        try {
            // Prepare request for data retrieval
            Request r = new Request();
            r.setProperty(Constants.CODER_ID, String.valueOf(getUser().getId()));
            r.setContentHandle("payment_status_summary");

            DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

            Map m = dai.getData(r);
            ResultSetContainer summary = (ResultSetContainer) m.get("payment_status_summary");

            getRequest().setAttribute("NUM_PENDING", this.getPendingPaymentsNumber());

            getRequest().setAttribute(PAYMENT_STATUS_SUMMARY, summary);
            setNextPage(PactsConstants.PAYMENT_STATUS_SUMMARY_JSP);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private int getPendingPaymentsNumber() throws Exception {
        DataInterfaceBean dib = new DataInterfaceBean();

        Map criteria = new HashMap();
        long userId = getUser().getId();
        criteria.put(PactsConstants.USER_ID, String.valueOf(userId));

        List<BasePayment> payments = dib.findCoderPayments(criteria);

        List<BasePayment> removePayments = new ArrayList<BasePayment>();
        for (BasePayment payment : payments) {
            if (payment.getPaymentType() == 3 || payment.getPaymentType() == 5) {
                removePayments.add(payment);
            } else {
                if (payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.CANCELLED_PAYMENT_STATUS)) ||
                    payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.EXPIRED_PAYMENT_STATUS)) ||
                    payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.PAID_PAYMENT_STATUS)) ||
                    payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.DELETED_PAYMENT_STATUS))) {
                    removePayments.add(payment);
                }
            }
        }
        payments.removeAll(removePayments);

        List<BasePayment> paymentPendings = new ArrayList<BasePayment>();
        for (BasePayment payment : payments) {
            if (payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.OWED_PAYMENT_STATUS)) ||
                payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.ENTERED_INTO_PAYMENT_SYSTEM_PAYMENT_STATUS)) ||
                payment.getCurrentStatus().equals(PaymentStatusFactory.createStatus(PaymentStatus.ACCRUING_PAYMENT_STATUS))) {
                paymentPendings.add(payment);
            }
        }

        return paymentPendings.size();
    }
}
