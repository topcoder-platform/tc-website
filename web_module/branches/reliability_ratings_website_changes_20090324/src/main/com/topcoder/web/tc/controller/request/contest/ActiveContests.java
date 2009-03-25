/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Apr 16, 2008
 */
public class ActiveContests extends ActiveContestsBase {
    public static final int[] DEFAULT_PROJECT_TYPES = new int[] {Constants.ASSEMBLY_PROJECT_TYPE,
        Constants.ARCHITECTURE_PROJECT_TYPE, Constants.APPLICATION_TESTING_PROJECT_TYPE,
        Constants.SPECIFICATION_PROJECT_TYPE, Constants.CONCEPTUALIZATION_PROJECT_TYPE};

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
