/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.io.Serializable;

import com.topcoder.web.common.WebConstants;


/**
 * <p><strong>Purpose</strong>: This interface represents a software component.</p>
 *
 * <p>Note: The meaning of this interface has grown beyond software component, but it still keeps its original name.</p>
 *
 * <p>
 *   Version 1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added constants for Studio prototype, Studio Build and Studio Component competitions.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public interface SoftwareComponent extends Cloneable, Serializable {

    public final static int DEV_PHASE = (int) WebConstants.PHASE_DEVELOPMENT;
    public final static int DESIGN_PHASE = (int) WebConstants.PHASE_DESIGN;
    public final static int CONCEPTUALIZATION_PHASE = (int) WebConstants.PHASE_CONCEPTUALIZATION;
    public final static int SPECIFICATION_PHASE = (int) WebConstants.PHASE_SPECIFICATION;
    public final static int ARCHITECTURE_PHASE = (int) WebConstants.PHASE_ARCHITECTURE;
    public final static int ASSEMBLY_PHASE = (int) WebConstants.PHASE_ASSEMBLY;
    public final static int APPLICATION_TESTING_PHASE = (int) WebConstants.PHASE_APPLICATION_TESTING;

    /**
     * <p>An <code>int</code> representing studio prototype phase id.</p>
     *
     * @since 1.1
     */
    public final static int STUDIO_PROTOTYPE_PHASE = (int) WebConstants.PHASE_STUDIO_PROTOTYPE;

    /**
     * <p>An <code>int</code> representing studio build phase id.</p>
     *
     * @since 1.1
     */
    public final static int STUDIO_BUILD_PHASE = (int) WebConstants.PHASE_STUDIO_BUILD;

    /**
     * <p>An <code>int</code> representing studio component phase id.</p>
     *
     * @since 1.1
     */
    public final static int STUDIO_COMPONENT_PHASE = (int) WebConstants.PHASE_STUDIO_COMPONENT;

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

