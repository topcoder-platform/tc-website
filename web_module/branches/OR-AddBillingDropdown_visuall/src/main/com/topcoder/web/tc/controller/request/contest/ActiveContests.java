/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 * <p><strong>Purpose</strong>: This processor handle requests to preview active contests for a specific
 * project type.</p>
 *
 * <p>
 *   Version 1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class ActiveContests extends ActiveContestsBase {

    /**
     * <p>An <code>int[]</code> representing default valid project types. This array will be used for
     * validation if the configuration entry is not found.</p>
     */
    public static final int[] DEFAULT_PROJECT_TYPES = new int[] {Constants.ASSEMBLY_PROJECT_TYPE,
        Constants.ARCHITECTURE_PROJECT_TYPE, Constants.APPLICATION_TESTING_PROJECT_TYPE,
        Constants.SPECIFICATION_PROJECT_TYPE, Constants.CONCEPTUALIZATION_PROJECT_TYPE,
        Constants.UI_PROTOTYPE_PROJECT_TYPE, Constants.RIA_BUILD_PROJECT_TYPE,
        Constants.RIA_COMPONENT_PROJECT_TYPE};

    public static final String DEFAULT_NAMESPACE = "com.topcoder.web.tc.controller.request.contest.ActiveContests";

    @Override
    protected void developmentProcessing() throws TCWebException {
        int projectTypeId =  com.topcoder.web.tc.controller.request.development.Base.getProjectTypeId(getRequest());

        if (isValidProjectType(projectTypeId)) {
            setProjectType(projectTypeId);
        } else {
            throw new TCWebException("Invalid project type specified " + projectTypeId);
        }

        super.developmentProcessing();
    }

    @Override
    protected String getCommandName() {
        if (getProjectType()==Constants.ARCHITECTURE_PROJECT_TYPE) {
            return "active_architecture_contests";
        } else {
            return super.getCommandName();
        }
    }

    @Override
    protected Boolean hasDR() {
        return Boolean.TRUE;
    }

    private static boolean isValidProjectType(int projectType) {
        ConfigManager configManager = ConfigManager.getInstance();

        String[] projectTypes = null;
        if (configManager.existsNamespace(DEFAULT_NAMESPACE)) {
            try {
                projectTypes = configManager.getStringArray(DEFAULT_NAMESPACE, "ValidProjectTypes");
            } catch (UnknownNamespaceException e) {
                e.printStackTrace();
                projectTypes = null;
            }
        }

        if (projectTypes == null) {
            for (int i = 0; i < DEFAULT_PROJECT_TYPES.length; i++) {
                if (projectType == DEFAULT_PROJECT_TYPES[i]) {
                    return true;
                }
            }
        } else {
            for (int i = 0; i < projectTypes.length; i++) {
                String strValue = projectType + "";
                if (strValue.equals(projectTypes[i])) {
                    return true;
                }
            }
        }

        return false;
    }
}
