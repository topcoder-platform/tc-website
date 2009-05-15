/**
 * Copyright ?2003, TopCoder, Inc. All rights reserved
 */

package com.topcoder.apps.review;

import com.topcoder.util.config.*;

/**
 * <p>
 * Constants of the application server address.
 * </p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class ApplicationServer {
    /**
     * The Topcoder server.
     */
    public static String TC_SERVER;

    /**
     * Topcoder corporation server.
     */
    public static String CORP_SERVER;

    /**
     * Topcoder software server.
     */
    public static String SOFTWARE_SERVER;

    /**
     * Online review server.
     */
    public static String ONLINE_REVIEW_SERVER;

    /**
     * The configure namespace.
     */
    private static final String CONFIG_NAMESPACE = "com.topcoder.dde.util.ApplicationServer";

    static {
        try {

            ConfigManager config = ConfigManager.getInstance();
            if (config.existsNamespace(CONFIG_NAMESPACE)) {
                config.refresh(CONFIG_NAMESPACE);
            } else {
                config.add(CONFIG_NAMESPACE,
                        ConfigManager.CONFIG_PROPERTIES_FORMAT);
            }

            TC_SERVER = config.getString(CONFIG_NAMESPACE, "TC_SERVER");
            CORP_SERVER = config.getString(CONFIG_NAMESPACE, "CORP_SERVER");
            SOFTWARE_SERVER = config.getString(CONFIG_NAMESPACE, "SOFTWARE_SERVER");
            ONLINE_REVIEW_SERVER = config.getString(CONFIG_NAMESPACE, "ONLINE_REVIEW_SERVER");

        } catch (ConfigManagerException cme) {
            System.err.println("Could not read config" + cme);
        }
    }
}
