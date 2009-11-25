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
 *     <li>Added constants for UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites.</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (Specification Review Integration,
 *					copied from Specification Review Signup Pages 1.0) Change notes:
 *   <ol>
 *     <li>Added constants for Specification Review projects.</li>
 *   </ol>
 * </p>

 *
 * @author dok, pulky, snow01
 * @version 1.3
 */
public interface SoftwareComponent extends Cloneable, Serializable {

    public final static int DEV_PHASE = (int) WebConstants.PHASE_DEVELOPMENT;
    public final static int DESIGN_PHASE = (int) WebConstants.PHASE_DESIGN;
    public final static int CONCEPTUALIZATION_PHASE = (int) WebConstants.PHASE_CONCEPTUALIZATION;
    public final static int SPECIFICATION_PHASE = (int) WebConstants.PHASE_SPECIFICATION;
    public final static int ARCHITECTURE_PHASE = (int) WebConstants.PHASE_ARCHITECTURE;
    public final static int ASSEMBLY_PHASE = (int) WebConstants.PHASE_ASSEMBLY;

    /**
     * <p>An <code>int</code> representing test suites phase id.</p>
     *
     * @since 1.2
     */
    public final static int TEST_SUITES_PHASE = (int) WebConstants.PHASE_TEST_SUITES;

    /**
     * <p>An <code>int</code> representing test scenarios phase id.</p>
     *
     * @since 1.2
     */
    public final static int TEST_SCENARIOS_PHASE = (int) WebConstants.PHASE_TEST_SCENARIOS;

    /**
     * <p>An <code>int</code> representing ui prototype phase id.</p>
     *
     * @since 1.1
     */
    public final static int UI_PROTOTYPE_PHASE = (int) WebConstants.PHASE_UI_PROTOTYPE;

    /**
     * <p>An <code>int</code> representing ria build phase id.</p>
     *
     * @since 1.1
     */
    public final static int RIA_BUILD_PHASE = (int) WebConstants.PHASE_RIA_BUILD;

    /**
     * <p>An <code>int</code> representing ria component phase id.</p>
     *
     * @since 1.1
     */
    public final static int RIA_COMPONENT_PHASE = (int) WebConstants.PHASE_RIA_COMPONENT;
	
	/**
     * <p>An <code>int</code> representing design specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int DESIGN_SPECIFICATION_PHASE = (int) WebConstants.PHASE_DESIGN_SPECIFICATION;

    /**
     * <p>An <code>int</code> representing development specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int DEVELOPMENT_SPECIFICATION_PHASE = (int) WebConstants.PHASE_DEVELOPMENT_SPECIFICATION;

    /**
     * <p>An <code>int</code> representing conceptualization specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int CONCEPTUALIZATION_SPECIFICATION_PHASE =
            (int) WebConstants.PHASE_CONCEPTUALIZATION_SPECIFICATION;

    /**
     * <p>An <code>int</code> representing specification specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int SPECIFICATION_SPECIFICATION_PHASE = (int) WebConstants.PHASE_SPECIFICATION_SPECIFICATION;

    /**
     * <p>An <code>int</code> representing architecture specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int ARCHITECTURE_SPECIFICATION_PHASE = (int) WebConstants.PHASE_ARCHITECTURE_SPECIFICATION;

    /**
     * <p>An <code>int</code> representing assembly specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int ASSEMBLY_SPECIFICATION_PHASE = (int) WebConstants.PHASE_ASSEMBLY_SPECIFICATION;

    /**
     * <p>An <code>int</code> representing test suites competition specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int TEST_SUITES_SPECIFICATION_PHASE =
            (int) WebConstants.PHASE_TEST_SUITES_SPECIFICATION;
			
	/**
     * <p>An <code>int</code> representing test scenarios competition specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int TEST_SCENARIOS_SPECIFICATION_PHASE =
            (int) WebConstants.PHASE_TEST_SCENARIOS_SPECIFICATION;
            
    /**
     * <p>An <code>int</code> representing ui prototype competition specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int UI_PROTOTYPE_SPECIFICATION_PHASE =
            (int) WebConstants.PHASE_UI_PROTOTYPE_SPECIFICATION;
            
    /**
     * <p>An <code>int</code> representing ria build competition specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int RIA_BUILD_SPECIFICATION_PHASE =
            (int) WebConstants.PHASE_RIA_BUILD_SPECIFICATION;
            
    /**
     * <p>An <code>int</code> representing ria component competition specification phase id.</p>
     *
     * @since 1.3
     */
    public final static int RIA_COMPONENT_SPECIFICATION_PHASE =
            (int) WebConstants.PHASE_RIA_COMPONENT_SPECIFICATION;

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

