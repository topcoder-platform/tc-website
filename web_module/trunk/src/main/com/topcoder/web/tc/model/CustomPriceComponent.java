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

    protected CustomPriceComponent() {}

    public CustomPriceComponent(float primaryReviewerPrice, float reviewerPrice) {
        this.primaryReviewerPrice = primaryReviewerPrice;
        this.reviewerPrice = reviewerPrice;
    }

    public float getPrimaryReviewPrice() {
        return primaryReviewerPrice;
    }

    public float getReviewPrice() {
        return reviewerPrice;
    }



}
