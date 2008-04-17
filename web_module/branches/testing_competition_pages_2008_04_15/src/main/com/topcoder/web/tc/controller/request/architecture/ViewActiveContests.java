package com.topcoder.web.tc.controller.request.architecture;

import com.topcoder.web.tc.controller.request.contest.ActiveContestsBase;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Apr 16, 2008
 */
public class ViewActiveContests extends ActiveContestsBase {

    protected String getCommandName() {
        return "active_architecture_contests";
    }

    @Override
    protected Boolean hasDR() {
        return Boolean.FALSE;
    }
}
