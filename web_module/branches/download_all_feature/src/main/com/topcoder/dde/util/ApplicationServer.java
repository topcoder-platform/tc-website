package com.topcoder.dde.util;

import com.topcoder.util.config.*;

public class ApplicationServer {


    public static String TC_SERVER;
    public static String CORP_SERVER;
    public static String SOFTWARE_SERVER;
    public static String ONLINE_REVIEW_SERVER;

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
