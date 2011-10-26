package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;

/**
 * @author dok
 * Date: Apr 8, 2004
 */
public class CustomPriceComponent extends DefaultPriceComponent {

    private static Logger log = Logger.getLogger(CustomPriceComponent.class);

    private float primaryReviewerPrice;
    private float reviewerPrice;
    private float specReviewerPrice;

    protected CustomPriceComponent() {
    }

    public CustomPriceComponent(float primaryReviewerPrice, float reviewerPrice, float specReviewerPrice, int phaseId) {
        this.primaryReviewerPrice = primaryReviewerPrice;
        this.reviewerPrice = reviewerPrice;
        this.specReviewerPrice = specReviewerPrice;
        this.phaseId = phaseId;
    }

    public float getPrimaryReviewCost() {
        return primaryReviewerPrice;
    }

    public float getReviewCost() {
        return reviewerPrice;
    }

    public float getSpecReviewCost() {
        return specReviewerPrice;
    }

    public Object clone() throws OutOfMemoryError {
        CustomPriceComponent ret = new CustomPriceComponent();
        ret.primaryReviewerPrice = this.primaryReviewerPrice;
        ret.reviewerPrice = this.reviewerPrice;
        ret.specReviewerPrice = this.specReviewerPrice;
        ret.phaseId = this.phaseId;
        return ret;
    }


}
