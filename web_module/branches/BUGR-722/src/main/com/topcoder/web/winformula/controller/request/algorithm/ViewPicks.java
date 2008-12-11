/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.Constants;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id: ViewPicks.java 72590 2008-08-26 20:11:53Z pwolfus $
 * Create Date: Aug 19, 2008
 */
public class ViewPicks extends ViewLastPredictions {

    protected void longContestProcessing() throws Exception {
        try {
            String selectedRound = StringUtils.checkNull(getRequest().getParameter(Constants.ROUND_ID));
            try {
                roundId = Integer.parseInt(selectedRound);
            } catch (Exception e) {
            }
            super.longContestProcessing();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
