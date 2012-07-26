/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development.assembly;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.contest.ActiveContestsBase;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * <p>
 * Version 1.1 (Release Assembly - TopCoder Assembly Track Subtypes Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for Assembly track contest subtypes.</li>
 *   </ol>
 * </p>
 *
 * @author pulky, isv
 * @version $Id$
 * Create Date: Apr 16, 2008
 */
public class ViewActiveContests extends ActiveContestsBase {
    
    protected void developmentProcessing() throws TCWebException {
        setProjectTypeIds(WebConstants.ASSEMBLY_TRACK_SUBTYPES);
        super.developmentProcessing();
    }

    @Override
    protected int getProjectType() {
        return Constants.MODULE_ASSEMBLY_PROJECT_TYPE;
    }

    @Override
    protected Boolean hasDR() {
        return Boolean.TRUE;
    }
}
