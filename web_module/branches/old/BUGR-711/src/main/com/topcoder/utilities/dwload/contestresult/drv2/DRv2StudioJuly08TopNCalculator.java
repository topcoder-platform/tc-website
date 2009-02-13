/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.utilities.dwload.contestresult.drv2;

import java.util.List;

import com.topcoder.utilities.dwload.contestresult.ContestResult;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Jul 15, 2008
 */
public class DRv2StudioJuly08TopNCalculator extends DRv2July08TopNCalculator {

    protected double getTopNPrizePool(List<ContestResult> crl) {
        double totalPoints = getTotalPrizePool(crl);
        return ((totalPoints < 5000) ? 5000 : totalPoints) / 2;
    }

}
