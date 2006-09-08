package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.alerts.aol.wrapper.AOLAlertNotificationMessage;
import com.topcoder.alerts.aol.wrapper.MessagingNotificationManager;
import com.topcoder.alerts.aol.wrapper.NamedAlertRegistry;
import com.topcoder.alerts.aol.wrapper.NotificationResult;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.AOLAlertInfo;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 8, 2006
 */
public class SendAOLAlert extends ShortHibernateProcessor {
    public static final String ALERT_TYPE = "aolat";
    public static final String MESSAGE_TEXT = "mtext";

    protected void dbProcessing() throws Exception {
        if (getSessionInfo().isAdmin()) {

            String type = getRequest().getParameter(ALERT_TYPE);
            String handle = getRequest().getParameter(Constants.HANDLE);

            if (AOLAlertsDescription.AOL_GROUP_ALERT.equals(type)) {
                String text = getRequest().getParameter(MESSAGE_TEXT + type);

                log.debug("sending a group alert");
                NamedAlertRegistry registry = new NamedAlertRegistry();
                registry.addAlertIDMapping(AOLAuthReply.GROUP_ALERT, AOLAuthReply.GROUP_ALERT_ID,
                        AOLAuthReply.GROUP_VALIDATION_TOKEN, AOLAuthReply.GROUP_TOPIC, true);

                MessagingNotificationManager man = new MessagingNotificationManager(registry);
                man.setNotificationEndPoint("https://webservices.alerts.aol.com/api/services/AlertsFeedAPIService");

                AOLAlertNotificationMessage message = new AOLAlertNotificationMessage(text, text, text, text);
                NotificationResult result = man.notify(AOLAuthReply.GROUP_ALERT, message);
                if (result.getTransactionId() == null) {
                    throw new NavigationException("Send failed: " + result.getErrorCode() + " " +
                            result.getErrorReason() + " " + result.getErrorDetail());
                }
                setNextPage(getSessionInfo().getServletPath() + "?" +
                        Constants.MODULE_KEY + "=Static&d1=tournaments&d2=tccc06&d3=aol_alert_sent");
                setIsNextPageInContext(false);

            } else if (AOLAlertsDescription.AOL_INDIVIDUAL_ALERT.equals(type)) {
                String text = getRequest().getParameter(MESSAGE_TEXT + type);

                log.debug("sending a individual alert");
                NamedAlertRegistry registry = new NamedAlertRegistry();
                registry.addAlertIDMapping(AOLAuthReply.IND_ALERT, AOLAuthReply.IND_ALERT_ID,
                        AOLAuthReply.IND_VALIDATION_TOKEN, AOLAuthReply.IND_TOPIC, false);

                User u = DAOUtil.getFactory().getUserDAO().find(handle, false);
                if (u == null) {
                    addError(Constants.HANDLE, "Invalid handle");
                    setDefault(MESSAGE_TEXT + type, text);
                    setDefault(Constants.HANDLE, handle);
                    setNextPage("/tournaments/tccc06/aol_alerts_sender.jsp");
                    setIsNextPageInContext(true);
                } else {
                    AOLAlertInfo info = (AOLAlertInfo) HibernateUtils.getSession().get(AOLAlertInfo.class, u.getId());
                    if (info == null) {
                        addError(Constants.HANDLE, "This user is not signed up for individual alerts");
                        setDefault(MESSAGE_TEXT + type, text);
                        setDefault(Constants.HANDLE, handle);
                        setNextPage("/tournaments/tccc06/aol_alerts_sender.jsp");
                        setIsNextPageInContext(true);

                    } else {

                        MessagingNotificationManager man = new MessagingNotificationManager(registry);
                        man.setNotificationEndPoint("https://webservices.alerts.aol.com/api/services/AlertsFeedAPIService");

                        AOLAlertNotificationMessage message = new AOLAlertNotificationMessage(text, text, text, text);
                        NotificationResult[] results = man.notify(AOLAuthReply.IND_ALERT, new String[]{info.getAolEncryptedUserId()}, message);

                        if (results[0].getTransactionId() == null) {
                            throw new NavigationException("Send to " + u.getHandle() + " failed: " + results[0].getErrorCode() + " " +
                                    results[0].getErrorReason() + " " + results[0].getErrorDetail());
                        }
                        setNextPage(getSessionInfo().getServletPath() + "?" +
                                Constants.MODULE_KEY + "=Static&d1=tournaments&d2=tccc06&d3=aol_alert_sent");
                        setIsNextPageInContext(false);
                    }


                }

            } else {
                addError(ALERT_TYPE, "Invalid alert type specified");
                setDefault(Constants.HANDLE, handle);
                setNextPage("/tournaments/tccc06/aol_alerts_sender.jsp");
                setIsNextPageInContext(true);

            }


        } else {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

    }
}
