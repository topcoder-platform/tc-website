package com.topcoder.web.tc.controller.request.architecture;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.contest.ActiveContestsBase;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id: ViewActiveContests.java 71417 2008-06-30 14:42:08Z pwolfus $
 * Create Date: Apr 16, 2008
 */
public class ViewActiveContests extends ActiveContestsBase {

    protected String getCommandName() {
        return "active_architecture_contests";
    }

    protected void developmentProcessing() throws TCWebException {
        setProjectType(Constants.ARCHITECTURE_PROJECT_TYPE);
        super.developmentProcessing();
    }
    
    @Override
    protected Boolean hasDR() {
        return Boolean.TRUE;
    }
}
