package com.topcoder.web.tc.controller.legacy.pacts.messaging.handler;


/**
 * PactsMessageHandler.java
 *
 * Created on October 18, 2001, 8:43 PM
 *
 * @Author Matt Murphy
 * @See UpdateResults.java
 *      DataIntefaceBean.java
 *      TCData.java
 *      PactsConstants.java
 */

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_internal.dispatch.InternalDispatchUserProfile;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;
import com.topcoder.web.tc.controller.legacy.pacts.common.UpdateResults;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfile;

import javax.jms.JMSException;
import javax.jms.ObjectMessage;

/**
 ********************************************************************************
 * The CompileMessageHandler class handles messages taken off the compileQueue.
 * <br>
 * @author
 ********************************************************************************
 */
public class PactsMessageHandler implements MessageHandler, PactsConstants {

    private static Logger log = Logger.getLogger(PactsMessageHandler.class);
    private DataInterfaceBean dib = null;
    private InternalDispatchUserProfile upb = null;

    /**
     * Initialize all the message handlers
     */
    public PactsMessageHandler() {
        this.dib = new DataInterfaceBean();
        this.upb = new InternalDispatchUserProfile(null, null);
    }

    /**
     * processMessage handles the message passed to it. On completion, a success/failure
     * status is returned.
     *
     * @param msg             The message retrieve off the queue.
     * @return boolean        Processing status (true/false)
     */
    public boolean processMessage(ObjectMessage msg) {
        boolean retVal = true;

        // Default the status flag
        boolean validMessage = true;
        long[] paymentIds = null;
        int statusId = -1;
        int updateType = 0;
        long userId = 0;
        UpdateResults results = null;
        ResultSetContainer rsc = null;
        ResultSetContainer.ResultSetRow rsr = null;
        UserProfile user = null;
        String message = "";
        String email = null;
        Object[] keys = null;

        int rowCount = 0;

        // Verify that the message contains the expected attributes
        try {
            paymentIds = (long[]) msg.getObject();

            if (paymentIds == null) {
                log.error("ERROR: message had no object");
                validMessage = false;
            }

            if (msg.propertyExists(UPDATE_TYPE_PROPERTY))
                updateType = msg.getIntProperty(UPDATE_TYPE_PROPERTY);
            else {
                log.error("ERROR: message had no " + UPDATE_TYPE_PROPERTY + " property");
                validMessage = false;
            }

            //Right now the only type of update that requires a status is batchUpdatePaymentStatus
            if (updateType == STATUS_UPDATE_TYPE) {
                if (msg.propertyExists(STATUS_PROPERTY))
                    statusId = msg.getIntProperty(STATUS_PROPERTY);
                else {
                    log.error("ERROR: message had no " + STATUS_PROPERTY + " property");
                    validMessage = false;
                }
            }

            if (msg.propertyExists(USER_PROPERTY))
                userId = msg.getLongProperty(USER_PROPERTY);
            else {
                log.error("ERROR: message had no " + USER_PROPERTY + " property");
                validMessage = false;
            }

        } catch (JMSException e) {
            log.error("ERROR: Could not access message properties.");
            e.printStackTrace();
            validMessage = false;
        }

        // Process further only if the message is valid.
        if (validMessage) {
            if (updateType == STATUS_UPDATE_TYPE) {
                try {
                    results = dib.doBatchUpdatePaymentStatus(paymentIds, statusId);
                } catch (Exception e) {
                    retVal = false;
                    log.error("ERROR: Exception Caught Trying to doBatchUpdatePaymentStatus()");
                    log.error(e.toString());
                    message += "Exception Caught Trying to doBatchUpdatePaymentStatus():\n" + e.toString();
                    results = new UpdateResults(paymentIds, statusId);
                    for (int n = 0; n < paymentIds.length; n++) results.put(paymentIds[n], e);
                }
            } else if (updateType == REVIEW_UPDATE_TYPE) {
                try {
                    //results = dib.doReviewPayments(paymentIds);
                } catch (Exception e) {
                    retVal = false;
                    log.error("ERROR: Exception Caught Trying to doReviewPayments()");
                    log.error(e.toString());
                    message += "Exception Caught Trying to doReviewPayments():\n" + e.toString();
                    results = new UpdateResults(paymentIds);
                    for (int n = 0; n < paymentIds.length; n++) results.put(paymentIds[n], e);
                }
            } else if (updateType == PAID_UPDATE_TYPE) {
                try {
                    //results = dib.doMarkPaymentsPaid(paymentIds);
                } catch (Exception e) {
                    retVal = false;
                    log.error("ERROR: Exception Caught Trying to doMarkPaymentsPaid()");
                    log.error(e.toString());
                    message += "Exception Caught Trying to doMarkPaymentsPaid():\n" + e.toString();
                    results = new UpdateResults(paymentIds, PAID_STATUS);
                    for (int n = 0; n < paymentIds.length; n++) results.put(paymentIds[n], e);
                }
            } else {
                retVal = false;
                log.error("ERROR: Unknown Update Type: " + updateType);
                message += "Unknown Update Type: " + updateType + "\n";
            }

            if (statusId >= 0) {
                try {
                    rsc = (ResultSetContainer) dib.getStatusCodes().get(STATUS_CODE_LIST);
                    rowCount = rsc.getRowCount();
                    for (int n = 0; n < rowCount; n++) {
                        rsr = rsc.getRow(n);
                        if (TCData.getTCInt(rsr, "status_id", -1, true) == statusId)
                            results.setStatusDesc(TCData.getTCString(rsr, "status_desc", null, true));
                    }
                } catch (Exception e) {
                    retVal = false;
                    log.error("ERROR: Exception Caught while trying to lookup status codes:");
                    log.error(e.toString());
                    message += "Exception Caught while trying to lookup status codes:\n" + e.toString();
                }
            }

            try {
                user = upb.get(userId);
                email = user.getEmail();
            } catch (Exception e) {
                retVal = false;
                log.error("ERROR: Exception Caught while trying to lookup email address:");
                log.error(e.toString());
                message += "Exception Caught while trying to lookup email address:\n" + e.toString();
                email = DEFAULT_STAFF_EMAIL;
            }

            keys = results.keySet().toArray();
            for (int n = 0; n < keys.length; n++) {
                message += results.get((String) keys[n]) + "\n";
            }

            log.debug("email: " + email);
            log.debug("message: " + message);

            //
            // Ready for email notification!
            // String email: the email address to the results should be mailed
            // String message: the message to send the user
            // psst: You do the email thang here.
            //

        } else {
            log.error("ERROR: Message received is invalid.");
            retVal = false;
        }

        return retVal;
    }

}
