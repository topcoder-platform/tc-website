/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.config.ConfigManagerInterface;
import com.topcoder.util.config.UnknownNamespaceException;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

/**
 * Helper class that handles the communication with the Configuration Manager.
 *
 * @author adic
 * @version 1.0
 */
public class ConfigHelper implements ConfigManagerInterface {

    /**
     * Location of the configuration file.
     */
    static final String CONFIG_FILE = "com/topcoder/apps/review/business_logic_config.properties";

    /**
     * Namespace of the component.
     */
    private static final String NAMESPACE = "com.topcoder.apps.review";

    /**
     * Submission URL prefix property name.
     */
    //private static final String SUBMISSION_URL_PREFIX = "submission_url_prefix";

    /**
     * Submission path prefix property name.
     */
    private static final String SUBMISSION_PATH_PREFIX = "submission_path_prefix";

    /**
     * Weekly notifications weekday property name.
     */
    private static final String WEEKLY_NOTIFICATIONS_WEEKDAY = "weekly_notifications_weekday";

    /**
     * Weekly notifications time property name.
     */
    private static final String WEEKLY_NOTIFICATIONS_TIME = "weekly_notifications_time";

    /**
     * Weekly notifications user property name.
     */
    private static final String WEEKLY_NOTIFICATIONS_USER = "weekly_notifications_user";

    /**
     * Weekly notifications password property name.
     */
    private static final String WEEKLY_NOTIFICATIONS_PASSWORD = "weekly_notifications_password";

    /**
     * Project change mail xsl file property name.
     */
    private static final String PROJECT_CHANGE_XSL = "project_change_xsl";

    /**
     * Weekly notifications mail xsl file property name.
     */
    private static final String WEEKLY_NOTIFICATION_XSL = "weekly_notification_xsl";

    /**
     * The minimum score required for a winning submission.
     */
    private static final String MINIMUM_SCORE = "minimum_score";

    static final String SCREEN_FAIL_XSL = "_screen_fail_xsl";
    static final String WINNER_XSL = "_winner_xsl";
    static final String LOOSER_XSL = "_looser_xsl";
    static final String MINSCORE_XSL = "_minscore_xsl";

    /**
     * Appeal creation mail xsl file property name.
     */
    private static final String APPEAL_CREATED_XSL = "appeal_created_xsl";
    /**
     * Appeal resolved mail xsl file property name.
     */
    private static final String APPEAL_RESOLVED_XSL = "appeal_resolved_xsl";

    /**
     * The list of properties.
     */
    private static List props;

    /**
     * Static initializer. Loads the configuration file.
     */
    static {
        props = new ArrayList(2);
        props.add(SUBMISSION_PATH_PREFIX);
        //props.add(SUBMISSION_URL_PREFIX);
        props.add(WEEKLY_NOTIFICATIONS_WEEKDAY);
        props.add(WEEKLY_NOTIFICATIONS_TIME);
        props.add(WEEKLY_NOTIFICATIONS_USER);
        props.add(WEEKLY_NOTIFICATIONS_PASSWORD);
        props.add(PROJECT_CHANGE_XSL);
        props.add(WEEKLY_NOTIFICATION_XSL);
        try {
            ConfigManager.getInstance().refreshAll();
            ConfigManager.getInstance().add(NAMESPACE, CONFIG_FILE, ConfigManager.CONFIG_PROPERTIES_FORMAT);
            ConfigManager.getInstance().refreshAll();
        } catch (ConfigManagerException e) {
            LogHelper.log("Error while loading the business logic config file: ", e);
        }
    }

    /**
     * Constructor (inhibits outside instantiation).
     */
    private ConfigHelper() {
    }

    /**
     * Get the submission URL prefix.
     *
     * @return the submission URL prefix
     *
     * @throws Exception propagate any exceptions
     */
    //static String getSubmissionURLPrefix() throws Exception {
    //    String sufix = EJBHelper.isTestMode() ? "_test" : "";
    //    return ConfigManager.getInstance().getString(NAMESPACE, SUBMISSION_URL_PREFIX + sufix);
    //}

    /**
     * Get the submission path prefix.
     *
     * @return the submission path prefix
     *
     * @throws Exception propagate any exceptions
     */
    static String getSubmissionPathPrefix() throws Exception {
        String sufix = EJBHelper.isTestMode() ? "_test" : "";
        String s = ConfigManager.getInstance().getString(NAMESPACE, SUBMISSION_PATH_PREFIX + sufix);

        // append a \ or / if it is not present
        if (s.endsWith("\\") || s.endsWith("/")) {
            return s;
        } else {
            return s + File.separatorChar;
        }
    }

    /**
     * Get the weekly notifications weekday.
     *
     * @return the weekly notifications weekday
     *
     * @throws Exception propagate any exceptions
     */
    static String getWeeklyNotificationsWeekday() throws Exception {
        return ConfigManager.getInstance().getString(NAMESPACE, WEEKLY_NOTIFICATIONS_WEEKDAY);
    }

    /**
     * Get the weekly notifications time.
     *
     * @return the weekly notifications time
     *
     * @throws Exception propagate any exceptions
     */
    static String getWeeklyNotificationsTime() throws Exception {
        return ConfigManager.getInstance().getString(NAMESPACE, WEEKLY_NOTIFICATIONS_TIME);
    }

    /**
     * Get the weekly notifications user.
     *
     * @return the weekly notifications user
     *
     * @throws Exception propagate any exceptions
     */
    static String getWeeklyNotificationsUser() throws Exception {
        return ConfigManager.getInstance().getString(NAMESPACE, WEEKLY_NOTIFICATIONS_USER);
    }

    /**
     * Get the weekly notifications password.
     *
     * @return the weekly notifications time
     *
     * @throws Exception propagate any exceptions
     */
    static String getWeeklyNotificationsPassword() throws Exception {
        return ConfigManager.getInstance().getString(NAMESPACE, WEEKLY_NOTIFICATIONS_PASSWORD);
    }

    /**
     * Get the xsl mail template file for project changes.
     *
     * @return the name of the xsl file
     *
     * @throws Exception propagate any exceptions
     */
    static String getProjectChangeXSL() throws Exception {
        return ConfigManager.getInstance().getString(NAMESPACE, PROJECT_CHANGE_XSL);
    }

    /**
     * Get the xsl mail template file for weekly notifications.
     *
     * @return the name of the xsl file
     *
     * @throws Exception propagate any exceptions
     */
    static String getWeeklyNotificationXSL() throws Exception {
        return ConfigManager.getInstance().getString(NAMESPACE, WEEKLY_NOTIFICATION_XSL);
    }

    /**
     * Get the the minimum score required for a winning submission.
     *
     * @return the name of the xsl file
     *
     * @throws Exception propagate any exceptions
     */
    static double getMinimumScore() throws Exception {
        return Double.parseDouble(ConfigManager.getInstance().getString(NAMESPACE, MINIMUM_SCORE));
    }

    static String getXSL(String xsl) throws Exception {
        return ConfigManager.getInstance().getString(NAMESPACE, xsl);
    }

    /**
     * Get the namespace.
     *
     * @return the namespace
     */
    static String getConfigNamespace() {
        return NAMESPACE;
    }

    /**
     * Get the namespace.
     *
     * @return the namespace
     */
    public String getNamespace() {
        return NAMESPACE;
    }

    /**
     * Get the used property names.
     *
     * @return an enumeration with the property names
     */
    public Enumeration getConfigPropNames() {
        return Collections.enumeration(props);
    }

    /**
     * Get the xsl mail template file for appeal creation.
     *
     * @return the name of the xsl file
     * @return
     */
    public static String getAppealCreatedXSL() throws UnknownNamespaceException {
        return ConfigManager.getInstance().getString(NAMESPACE, APPEAL_CREATED_XSL);
    }

    /**
     * Get the xsl mail template file for appeal creation.
     *
     * @return the name of the xsl file
     * @return
     */
    public static String getAppealResolvedXSL() throws UnknownNamespaceException {
        return ConfigManager.getInstance().getString(NAMESPACE, APPEAL_RESOLVED_XSL);
    }

}

