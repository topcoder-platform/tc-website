package com.topcoder.web.tc.model;

import com.topcoder.shared.util.logging.Logger;

/**
 * @author dok
 * Date: Apr 8, 2004
 */
public class CustomPriceComponent extends DefaultPriceComponent {

    private static Logger log = Logger.getLogger(CustomPriceComponent.class);

    private float primaryReviewerPrice;
    private float reviewerPrice;

    protected CustomPriceComponent() {
    }

    public CustomPriceComponent(float primaryReviewerPrice, float reviewerPrice, int phaseId) {
        this.primaryReviewerPrice = primaryReviewerPrice;
        this.reviewerPrice = reviewerPrice;
        this.phaseId = phaseId;
    }

    public float getPrimaryReviewPrice() {
        return primaryReviewerPrice;
    }

    public float getReviewPrice() {
        return reviewerPrice;
    }

    public Object clone() throws OutOfMemoryError {
        CustomPriceComponent ret = new CustomPriceComponent();
        ret.primaryReviewerPrice = this.primaryReviewerPrice;
        ret.reviewerPrice = this.reviewerPrice;
        ret.phaseId = this.phaseId;
        return ret;
    }


}
