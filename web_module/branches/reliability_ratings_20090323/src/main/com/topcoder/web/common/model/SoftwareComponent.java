package com.topcoder.web.common.model;

import java.io.Serializable;

import com.topcoder.web.common.WebConstants;


/**
 * @author dok
 *         Date: Feb 11, 2004
 */
public interface SoftwareComponent extends Cloneable, Serializable {

    public final static int DEV_PHASE = (int)WebConstants.PHASE_DEVELOPMENT;
    public final static int DESIGN_PHASE = (int)WebConstants.PHASE_DESIGN;

    public final static int LEVEL1 = 100;
    public final static int LEVEL2 = 200;


    /**
     * Return the price that the designer/developer
     * would be paid for this component.
     *
     * @return
     */
    float getPrice();

    /**
     * Return the price that the primary reviewer
     * would be paid for reviewing this component.
     *
     * @return
     */
    float getPrimaryReviewPrice();

    /**
     * Return the price non-primary reviewers
     * will be paid for reviewing this component.
     *
     * @return
     */
    float getReviewPrice();

    Object clone() throws OutOfMemoryError;

}

