package com.topcoder.web.tc.controller.request.tournament.tccc06;

import com.topcoder.alerts.aol.wrapper.MessagingRegistrationManager;
import com.topcoder.alerts.aol.wrapper.NamedAlertRegistry;
import com.topcoder.alerts.aol.wrapper.SubscriptionResult;
import com.topcoder.security.Util;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
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
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 18, 2006
 */
public class AOLAuthReply extends ShortHibernateProcessor {
    protected static final Logger log = Logger.getLogger(AOLAuthReply.class);

    private static final String GROUP_ALERT = "groupAlert";
    private static final String IND_ALERT = "indAlert";
    private static final String AUTH_TOKEN = "AuthToken";
    private static final String AOL_USER_ID = "UserId";

    private static String GROUP_ALERT_ID;
    private static String GROUP_VALIDATION_TOKEN;
    private static String GROUP_TOPIC;

    private static String IND_ALERT_ID;
    private static String IND_VALIDATION_TOKEN;
    private static String IND_TOPIC;

    static {
        if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
            GROUP_ALERT_ID = "7ba63042-e8f0-4adb-815a-f755fc768de9";
            GROUP_VALIDATION_TOKEN = "E0BF3656EBEDD16942EB8D667754FEAF878B3CAB18E7D8EC1CB9C12176A8E4A";
            GROUP_TOPIC = "TopCoder";
            IND_ALERT_ID = "268e2e1d-6d09-4c8e-a78c-f755fc768de9";
            IND_VALIDATION_TOKEN = "FA7362BC7BC7C507EE6B91BC8C22284BC06527B5DB0DD7BFB9FBBBE4C6BC867";
            IND_TOPIC = "TopCoder";
        } else {
            GROUP_ALERT_ID = "7ba606d0-e8f0-4adb-815a-f755fc768de9";
            GROUP_VALIDATION_TOKEN = "95F1C56B13A2B71E65A6CB78DD09838B92A1A017BF277C6BD19524AD1EF234";
            GROUP_TOPIC = "TopCoder-Dev";
            IND_ALERT_ID = "9244f24a-3c7c-40a9-abb2-f755fc768de9";
            IND_VALIDATION_TOKEN = "F4A96814585F89E11C132FE691A82F3F2A967C5BFEE225026A75825A3792764";
            IND_TOPIC = "TopCoder";
        }
    }

    protected void dbProcessing() throws Exception {
        Cookie[] cookies = getRequest().getCookies();

        Cookie theOneCookie = null;
        for (int i = 0; i < cookies.length; i++) {
            if (AOLAlertsDescription.AOL_COOKIE.equals(cookies[i].getName())) {
                theOneCookie = cookies[i];
                break;
            }
        }
        if (theOneCookie == null) {
            throw new NavigationException("Sorry, there was a error attempting to communicate between AOL and TopCoder.");
        } else {
            try {
                String val = Util.decodePassword(theOneCookie.getValue(), AOLAlertsDescription.AOL_ALIAS);
                long userId = Long.parseLong(val);
                boolean isGroupSignup = AOLAlertsDescription.AOL_GROUP_ALERT.equals(getRequest().getParameter("PartnerContext"));
                boolean isIndividualSignup = AOLAlertsDescription.AOL_INDIVIDUAL_ALERT.equals(getRequest().getParameter("PartnerContext"));

                if (isGroupSignup) {
                    if (log.isDebugEnabled()) {
                        log.debug("signup " + userId + " for group alert");
                    }

                    NamedAlertRegistry registry = new NamedAlertRegistry();
                    registry.addAlertIDMapping(GROUP_ALERT, GROUP_ALERT_ID, GROUP_VALIDATION_TOKEN, GROUP_TOPIC, isGroupSignup);

                    MessagingRegistrationManager man = new MessagingRegistrationManager(registry);
                    man.setSubscriptionEndPoint("https://webservices.alerts.aol.com/api/services/AlertsSubscriptionAPIService");

                    SubscriptionResult result = man.subscribe(GROUP_ALERT, getRequest().getParameter(AUTH_TOKEN));

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
                            log.info(getUser().getUserName() + " attempted to sign up for the group alert but already is signed up");
                        }
                    }

                } else if (isIndividualSignup) {
                    if (log.isDebugEnabled()) {
                        log.debug("signup " + userId + " for individual alert");
                    }


                    NamedAlertRegistry registry = new NamedAlertRegistry();
                    registry.addAlertIDMapping(IND_ALERT, IND_ALERT_ID, IND_VALIDATION_TOKEN, IND_TOPIC, isGroupSignup);

                    MessagingRegistrationManager man = new MessagingRegistrationManager(registry);
                    man.setSubscriptionEndPoint("https://webservices.alerts.aol.com/api/services/AlertsSubscriptionAPIService");

                    SubscriptionResult result = man.subscribe(IND_ALERT, getRequest().getParameter(AUTH_TOKEN));

                    if (result.getSubscriptionId() != null) {
                        //success

                        AOLAlertInfo info = new AOLAlertInfo();
                        info.setUser(DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId())));
                        info.setAolEncryptedUserId(getRequest().getParameter(AOL_USER_ID));
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
                            log.info(getUser().getUserName() + " attempted to sign up for the individual alert but already is signed up");
                        }
                    }


                } else {
                    throw new NavigationException("Request did not include the type of alert");
                }
            } catch (Exception e) {
                throw new NavigationException("Sorry, there was a error attempting to communicate between AOL and TopCoder.", e);
            }
        }

        setNextPage("/tournaments/tccc06/aol_alerts_sub_success.jsp");
        setIsNextPageInContext(true);
    }
}
