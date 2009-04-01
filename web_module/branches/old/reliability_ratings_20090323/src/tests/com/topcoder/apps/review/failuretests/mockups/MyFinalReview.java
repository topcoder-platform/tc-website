/*
 * MyFinalReview.java 1.0 7/2/2003
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review.failuretests.mockups;

import com.topcoder.apps.review.document.FixItem;
import com.topcoder.apps.review.document.FinalReview;
import com.topcoder.apps.review.document.AggregationWorksheet;

/**
 * <p>An implementation of FinalReview used for testing.</p>
 *
 * @author kolanovic
 * @version 1.0
 */
public class MyFinalReview extends FinalReview {

    public MyFinalReview() {
        super(0, (FixItem[]) null, (AggregationWorksheet) null, false, 0, 0);
    }

    public FixItem[] getFixCheckList() {
        return (new FixItem[0]);
    }

    public void setFixCheckList(FixItem[] item) {
    }

    public AggregationWorksheet getAggregationWorkSheet() {
        return (null);
    }
}
