package com.topcoder.web.tc.controller.request.development.assembly;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.contest.ActiveContestsBase;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id: ViewActiveContests.java 70034 2008-04-23 20:41:12Z pulky $
 * Create Date: Apr 16, 2008
 */
public class ViewActiveContests extends ActiveContestsBase {

    protected void developmentProcessing() throws TCWebException {
        setProjectType(Constants.ASSEMBLY_PROJECT_TYPE);
        super.developmentProcessing();
    }

    @Override
    protected Boolean hasDR() {
        return Boolean.TRUE;
    }
}
