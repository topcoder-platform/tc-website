package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.alerts.aol.wrapper.AOLAlertNotificationMessage;
import com.topcoder.alerts.aol.wrapper.MessagingNotificationManager;
import com.topcoder.alerts.aol.wrapper.NamedAlertRegistry;
import com.topcoder.alerts.aol.wrapper.NotificationResult;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
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
    public static final String QUERY = "qtext";

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
                String query = StringUtils.checkNull(getRequest().getParameter(QUERY));

                String[] people = null;
                if ("".equals(query)) {
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
                            people = new String[]{info.getAolEncryptedUserId()};
                        }
                    }
                } else {
                    QueryRequest qr = new QueryRequest();
                    qr.addQuery("list", query);
                    ResultSetContainer rsc = (ResultSetContainer) new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(qr).get("list");
                    if (rsc.isEmpty()) {
                        addError(QUERY, "Query returned no rows");
                        setDefault(MESSAGE_TEXT + type, text);
                        setNextPage("/tournaments/tccc06/aol_alerts_sender.jsp");
                        setIsNextPageInContext(true);
                    } else {
                        people = new String[rsc.size()];
                        for (int i = 0; i < rsc.size(); i++) {
                            people[i] = rsc.getStringItem(i, 0);
                        }
                    }
                }


                if (people == null) {
                    throw new NavigationException("No recipients specified");
                } else {
                    log.debug("sending a individual alert");
                    NamedAlertRegistry registry = new NamedAlertRegistry();
                    registry.addAlertIDMapping(AOLAuthReply.IND_ALERT, AOLAuthReply.IND_ALERT_ID,
                            AOLAuthReply.IND_VALIDATION_TOKEN, AOLAuthReply.IND_TOPIC, false);

                    MessagingNotificationManager man = new MessagingNotificationManager(registry);
                    man.setNotificationEndPoint("https://webservices.alerts.aol.com/api/services/AlertsFeedAPIService");

                    AOLAlertNotificationMessage message = new AOLAlertNotificationMessage(text, text, text, text);
                    NotificationResult[] results = man.notify(AOLAuthReply.IND_ALERT, people, message);

                    StringBuffer buf = new StringBuffer(1000);
                    for (int i = 0; i < results.length; i++) {
                        if (results[i].getTransactionId() == null) {
                            buf.append("Send to ").append(people[i]).append(" failed: ").append(results[i].getErrorCode()).append(" ").append(results[i].getErrorReason()).append(" ").append(results[i].getErrorDetail());
                        }
                    }
                    if (buf.length() > 0) {
                        throw new NavigationException(buf.toString());
                    }
                    setNextPage(getSessionInfo().getServletPath() + "?" +
                            Constants.MODULE_KEY + "=Static&d1=tournaments&d2=tccc06&d3=aol_alert_sent");
                    setIsNextPageInContext(false);


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
