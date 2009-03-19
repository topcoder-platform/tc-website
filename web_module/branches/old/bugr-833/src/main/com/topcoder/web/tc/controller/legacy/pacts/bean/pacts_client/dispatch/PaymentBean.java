/**
 * this class is how the payment classes are obtained from the
 * db.  It does not do any error checking, that should be done int
 * the servlet that calls it.  It simply calls the appropriate
 * ejb methods and forms the correct objects
 *
 * @author Sam King
 */

package com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_client.dispatch;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentList;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

import java.util.HashMap;
import java.util.Map;

public class PaymentBean implements PactsConstants {
    private static Logger log = Logger.getLogger(PaymentBean.class);

    /**
     * contstuctor.  It does nothing because the class is stateless.
     */
    public PaymentBean() {
        //do nothing, stateless
    }

    /**
     * used to extract full payment details for a given payment
     *
     * @param paymentId the payment id
     * @return the payment information, or null if the payment id is bad
     */
    public Payment getPayment(long paymentId) {
        log.debug("getPayment, PaymentId = " + paymentId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getPayment(paymentId);
        } catch (Exception e1) {
            log.error("did not get affidavit in getAffidavit");
            e1.printStackTrace();
            return null;
        }

        Payment p = new Payment(reply, 0);
        return p;
    }

    /**
     * gets an array of payment headers for the given user.
     *
     * @param memberId the member id
     * @return the payment headers, or null if the payment id is bad
     */
    public PaymentHeader[] getPaymentsForUser(long memberId) {
        log.debug("getPaymentsForUser, memberId = " + memberId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getUserPaymentList(memberId);
        } catch (Exception e1) {
            log.error("did not get payment list in getPaymentsForUser");
            e1.printStackTrace();
            return null;
        }

        PaymentHeaderList plist = new PaymentHeaderList(reply);

        return plist.getHeaderList();
    }

    /**
     * Obtains an array of payment details for the given user.
     *
     * @param memberId the member id
     * @parampaymentTypes the payment type(s) to filter on
     * @param pendingOnly whether only pending/owed details should be returned
     * @return the payment details, or null if the payment id is bad
     */
    public Payment[] getPaymentDetailsForUser(long memberId, int[] paymentTypes, boolean pendingOnly) {
        log.debug("getPaymentDetailsForUser, memberId = " + memberId);
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getUserPaymentDetailsList(memberId, paymentTypes, pendingOnly);
        } catch (Exception e1) {
            //log.error("did not get payment list in getComponentDetailsForUser");
            //e1.printStackTrace();
            return null;
        }

        PaymentList plist = new PaymentList(reply);

        if (plist.getHeaderList().length == 0) {
            return null;
        }
        return plist.getHeaderList();
    }

    /**
     * Generates a map with project ID keys and component ID values from the component and review board
     * payments in the given list.
     *
     * @param paymentIds The list of payment IDs.
     * @return the map of (projectID, componentID) pairs
     */
    public Map getPaymentComponentData(long[] paymentIds) {
        DataInterfaceBean bean = new DataInterfaceBean();
        java.util.Map reply = null;
        try {
            reply = bean.getPaymentComponentData(paymentIds);
        } catch (Exception e1) {
            log.error("did not get reply in getPaymentComponentData");
            e1.printStackTrace();
        }


        Map componentIdMap = new HashMap();
        ResultSetContainer rsc = (ResultSetContainer)reply.get(COMPONENT_DATA);
        int numRows = rsc.getRowCount();
        for (int i=0; i<numRows; i++) {
            ResultSetRow row = rsc.getRow(i);
            componentIdMap.put(row.getStringItem("component_project_id"), row.getStringItem("component_id"));
        }
        return componentIdMap;
    }

    /**
     * Returns an array of dates which the given payments were created on.
     *
     * @return - String[]
     */
     public String[] getCreationDates(long[] paymentIds) throws Exception {
        if (paymentIds.length == 0) return new String[0];
        DataInterfaceBean bean = new DataInterfaceBean();
        Map results = bean.getCreationDates(paymentIds);
        ResultSetContainer rsc = (ResultSetContainer)results.get(CREATION_DATE_LIST);

        if (rsc == null) {
             log.error("There were no " + CREATION_DATE_LIST + " entries in the" +
                     " result set map sent to PaymentBean.getCreationDates()");
             return null;
         }

         // see if there are any rows of data
         int numRows = rsc.getRowCount();
         if (numRows <= 0) {
             log.debug("there were no rows of data in the result set sent\n" +
                     "to PaymentBean.getCreationDates()");
             return new String[0];
         }

         String[] creationDates = new String[numRows];
         for (int i=0; i<numRows; i++) {
            ResultSetRow rRow = rsc.getRow(i);
            creationDates[i] = TCData.getTCDate(rRow, "date_created");
         }
         return creationDates;
     }

    public Payment getEmptyPayment(long userId) throws Exception {
        log.debug("getEmptyPayment called");
        DataInterfaceBean bean = new DataInterfaceBean();
        return bean.getEmptyPayment(userId);
    }
}

