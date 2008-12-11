package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.alerts.aol.wrapper.AlertData;
import com.topcoder.alerts.aol.wrapper.MessagingRegistrationManager;
import com.topcoder.alerts.aol.wrapper.SubscriptionResult;
import com.topcoder.security.Util;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.tc.model.AOLAlertInfo;

import javax.servlet.http.Cookie;

/**
 * This processor will receieve a request from the AOL servers.  That request
 * will contain an auth token and an "Encrypted User ID".  The processor
 * will use those two pieces of data to make a subscription request via
 * the AOL alerts API.  We will make that request using a component
 * built for that purpose.
 * <p/>
 * We will get a response via that same API.  At that point we will provide
 * results to the user.  Either, it will be a successful subscription, or not.
 * We should be sure to log important information like
 * <ul>
 * <li>handle<li>
 * <li>success/failure</li>
 * <li>failure message</li>
 * <li>aol screen name</li>
 * <li>user guid</li>
 * <li>subscription id</li>
 * </ul>
 *
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 18, 2006
 */
public class AOLAuthReply extends ShortHibernateProcessor {
    protected static final Logger log = Logger.getLogger(AOLAuthReply.class);


    protected void dbProcessing() throws Exception {
        Cookie[] cookies = getRequest().getCookies();

        Cookie theOneCookie = null;
        for (int i = 0; i < cookies.length; i++) {
            if (AOLHelper.AOL_COOKIE.equals(cookies[i].getName())) {
                theOneCookie = cookies[i];
                break;
            }
        }
        if (theOneCookie == null) {
            throw new NavigationException("Sorry, there was a error attempting to communicate between AOL and TopCoder.");
        } else {
            try {
                String val = Util.decodePassword(theOneCookie.getValue(), AOLHelper.AOL_ALIAS);
                long userId = Long.parseLong(val);
                String requestedAlertId = getRequest().getParameter(AOLHelper.AOL_ALERT_ID);

                String[] alerts = AOLHelper.subscriptionRegistry.getAllAlertNames();

                boolean found = false;
                AlertData curr;
                AlertData individual = AOLHelper.subscriptionRegistry.getMappedAlertData(AOLHelper.INDIVIDUAL);
                for (int i = 0; i < alerts.length; i++) {
                    curr = AOLHelper.subscriptionRegistry.getMappedAlertData(alerts[i]);
                    if (curr.getAlertId().equals(requestedAlertId)) {
                        found = true;
                        if (log.isDebugEnabled()) {
                            log.debug("signup " + userId + " for " + alerts[i]);
                        }
                        MessagingRegistrationManager man = new MessagingRegistrationManager(AOLHelper.subscriptionRegistry);
                        man.setSubscriptionEndPoint("https://webservices.alerts.aol.com/api/services/AlertsSubscriptionAPIService");

                        SubscriptionResult result = man.subscribe(alerts[i], getRequest().getParameter(AOLHelper.AUTH_TOKEN));
                        if (curr.getAlertId().equals(individual.getAlertId())) {

                            if (result.getSubscriptionId() != null) {
                                //success

                                AOLAlertInfo info = (AOLAlertInfo) HibernateUtils.getSession().get(AOLAlertInfo.class, new Long(getUser().getId()));
                                if (info == null) {
                                    info = new AOLAlertInfo();
                                    info.setUser(DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId())));
                                }
                                info.setAolEncryptedUserId(getRequest().getParameter(AOLHelper.AOL_USER_ID));
                                HibernateUtils.getSession().saveOrUpdate(info);

                                log.info(getUser().getUserName() + " signed up for individual alert " + result.getSubscriptionId() +
                                        " " + result.getUserGuid());
                            } else {
                                if (!"AlertsAPIExceptions.DuplicateSubscription(-20)".equals(result.getErrorCode())) {
                                    log.error(getUser().getUserName() + " failed to sign up for individual alert " +
                                            result.getUserGuid() + " " + result.getErrorCode() + " " + result.getErrorReason());
                                    throw new NavigationException("Subscription failed: " + result.getErrorCode() + " " +
                                            result.getErrorReason() + " " + result.getErrorDetail());
                                } else {
                                    log.info(getUser().getUserName() + " attempted to sign up for " + alerts[i] + " but already is signed up");
                                }
                            }

                        } else {
                            if (result.getSubscriptionId() != null) {
                                //success
                                log.info(getUser().getUserName() + " signed up for group alert " + result.getSubscriptionId() +
                                        " " + result.getUserGuid());
                            } else {
                                if (!"AlertsAPIExceptions.DuplicateSubscription(-20)".equals(result.getErrorCode())) {
                                    log.error(getUser().getUserName() + " failed to sign up for group alert " +
                                            result.getUserGuid() + " " + result.getErrorCode() + " " + result.getErrorReason());
                                    throw new NavigationException("Subscription failed: " + result.getErrorCode() + " " +
                                            result.getErrorReason() + " " + result.getErrorDetail());
                                } else {
                                    log.info(getUser().getUserName() + " attempted to sign up for " + alerts[i] + " but already is signed up");
                                }
                            }
                        }
                    }
                }
                if (!found) {
                    throw new TCWebException("Unrecognized alert id " + requestedAlertId);
                }

            } catch (Exception e) {
                throw new NavigationException("Sorry, there was a error attempting to communicate between AOL and TopCoder.", e);
            }
        }

        setNextPage("/tournaments/tccc06/aol_alerts_sub_success.jsp");
        setIsNextPageInContext(true);
    }
}
