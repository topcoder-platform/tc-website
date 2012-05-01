/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.screening;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.util.config.ConfigManagerInterface;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.shared.util.logging.Logger;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

/**
 * <strong>Purpose</strong>:
 * Helper class that handles the communication with the Configuration Manager.
 *
 * @author pulky
 * @version 1.0.0
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
     * Submission path prefix property name.
     */
    private static final String SPECIFICATION_PATH_PREFIX = "submission_path_prefix";

    /**
     * The list of properties.
     */
    private static List props;

    /**
     * The logger to log to.
     */
    private static Logger log = Logger.getLogger(ConfigHelper.class);

    /**
     * Static initializer. Loads the configuration file.
     */
    static {
        props = new ArrayList(1);
        props.add(SPECIFICATION_PATH_PREFIX);
        try {
            ConfigManager.getInstance().refreshAll();
            ConfigManager.getInstance().add(NAMESPACE, CONFIG_FILE, ConfigManager.CONFIG_PROPERTIES_FORMAT);
            ConfigManager.getInstance().refreshAll();
        } catch (ConfigManagerException e) {
            log.error("Error while loading the business logic config file: ", e);
        }
    }

    /**
     * Constructor (inhibits outside instantiation).
     */
    private ConfigHelper() {
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
     * Get the used property names.
     *
     * @return an enumeration with the property names
     */
    public Enumeration getConfigPropNames() {
        return Collections.enumeration(props);
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
     * Get the submission path prefix.
     *
     * @return the submission path prefix
     *
     * @throws Exception propagate any exceptions
     */
    public static String getSubmissionPathPrefix() throws Exception {
        String s = ConfigManager.getInstance().getString(NAMESPACE, SPECIFICATION_PATH_PREFIX);

        // append a \ or / if it is not present
        if (s.endsWith("\\") || s.endsWith("/")) {
            return s;
        } else {
            return s + File.separatorChar;
        }
    }
}

