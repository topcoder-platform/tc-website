/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.file.TCSFile;
import java.io.File;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * <strong>Purpose</strong>:
 * ScreeningTool is the access point of the application. It maintains a list of rules for each type
 * of project and initiates the screening logic for each of them. It also provides static access to
 * the query interface as well as a command line interface.
 *
 * Version 1.0.1 Change notes:
 * <ol>
 * <li>
 * screen method was modified to return a boolean indicating if the screening *process* was successful.
 * </li>
 * </ol>
 *
 * @author WishingBone, pulky
 * @version 1.0.1
 */
public class ScreeningTool {

    /**
     * The namespace for the configuration.
     */
    private static final String NAMESPACE = "com.topcoder.apps.screening.ScreeningTool";

    /**
     * The name of the property in the configuration file that contains the temp folder.
     */
    private static final String TEMP_FOLDER_PROPERTY_NAME = "temp_folder";

    /**
     * The name of the property in the configuration file that contains the rules.
     */
    private static final String RULES_PROPERTY_NAME = "rules";

    /**
     * The name of the property in the configuration file that contains the soft flag.
     */
    private static final String SOFT_PROPERTY_NAME = "soft";

    /**
     * <strong>Purpose</strong>:
     * The temp folder to extract the submission.
     */
    private File tempFolder;

    /**
     * <strong>Purpose</strong>:
     * The mapping from project type to rules.
     */
    private Map rules;

    /**
     * Indicates whether the tool is running in soft mode.
     */
    private boolean soft = false;

    /**
     * <strong>Purpose</strong>:
     * Creates a ScreeningTool class. The rules are loaded at this point.
     */
    public ScreeningTool() throws Exception {
        ConfigManager cm = ConfigManager.getInstance();
        this.tempFolder = new File(cm.getString(NAMESPACE, TEMP_FOLDER_PROPERTY_NAME));
        this.rules = new HashMap();
        String[] rules = cm.getStringArray(NAMESPACE, RULES_PROPERTY_NAME);
        for (int i = 0; i < rules.length; ++i) {
            ProjectType type = ProjectType.getProjectType(rules[i]);
            List list = new ArrayList();
            String[] classes = cm.getStringArray(NAMESPACE, rules[i] + "_rule");
            for (int j = 0; j < classes.length; ++j) {
                list.add(Class.forName(classes[j]).newInstance());
            }
            this.rules.put(type, list);
        }
        String soft = cm.getString(NAMESPACE, SOFT_PROPERTY_NAME);
        if (soft != null && soft.trim().toLowerCase().equals("on")) {
            this.soft = true;
        }
    }

    /**
     * <strong>Purpose</strong>:
     * Screen a submission with file and project type.
     *
     * @param log the logger to use.
     * @param request the request to screen.
     *
     * @return true if screening process succedeed.
     */
    public boolean screen(IScreeningRequest request, Logger log) {
        boolean retVal = true;
        if (log == null) {
            throw new NullPointerException("log should not be null.");
        }
        if (request == null) {
            throw new NullPointerException("request should not be null.");
        }

        File root = new File(tempFolder, String.valueOf(request.getProjectType().getName() + request.getArtifactId()));
        ScreeningLogger logger = new ScreeningLogger();
        logger.setRequest(request);

        try {
            boolean success = true;
            for (Iterator itr = ((List) this.rules.get(request.getProjectType())).iterator(); itr.hasNext();) {
                ScreeningRule rule = (ScreeningRule) itr.next();
                long start = System.currentTimeMillis();
                boolean result = rule.screen(new File(request.getArtifactPath()), root, logger);
                long end = System.currentTimeMillis();
                log.info(rule.getClass().getName() + ": " + (result ? "pass" : "fail") + " with " + (end - start) + "ms.");
                if (!result) {
                    success = false;
                }
            }
            if (success) {
                logger.log(new SimpleScreeningData(ResponseCode.SUCCESS));
            }
            logger.log(new SimpleScreeningResult(success || this.soft));
        } catch (DatabaseException ex) {
            ex.printStackTrace();
            log.error("Exception thrown while screening: " + ex.getMessage());
            retVal = false;
        } finally {
            try {
                new TCSFile(root).deleteTree();
            } catch (Exception ex) {
            }
        }
        return retVal;
    }

    /**
     * <strong>Purpose</strong>:
     * Get the QueryInterface used for the application.
     *
     * @return an xml query implementation.
     */
    public static QueryInterface createQuery() {
        return new XmlQuery();
    }

}
