/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
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
 *
 *
 *   Version 1.4 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added constants for Copilot Posting projects.</li>
 *   </ol>
 * </p>
 *
 *  <p>
 *   Version 1.5 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added {@link #CONTENT_CREATION_PHASE} and {@link #CONTENT_CREATION_SPECIFICATION_PHASE} constants for
 *     Content Creation projects.</li>
 *   </ol>
 * </p>
 * 
 * <p>
 *   Version 1.6 (Online Review Replatforming Release 2) Change noets:
 *   <ol>
 *     <li>Added constants for the the phases of Studio Contests.</li>
 *   </ol>
 * </p>
 * <p>
 *   Version 1.7 (Add Reporting Contest Type) Change noets:
 *   <ol>
 *     <li>Added {@link #REPORTING_PHASE} constant for new Reporting contest type.</li>
 *   </ol>
 * </p>
 * @author dok, pulky, snow01, VolodymyrK, FireIce, flexme
 * @version 1.6
 */
public interface SoftwareComponent extends Cloneable, Serializable {

    public final static int DEV_PHASE = (int) WebConstants.PHASE_DEVELOPMENT;
    public final static int DESIGN_PHASE = (int) WebConstants.PHASE_DESIGN;
    public final static int CONCEPTUALIZATION_PHASE = (int) WebConstants.PHASE_CONCEPTUALIZATION;
    public final static int SPECIFICATION_PHASE = (int) WebConstants.PHASE_SPECIFICATION;
    public final static int ARCHITECTURE_PHASE = (int) WebConstants.PHASE_ARCHITECTURE;
    public final static int ASSEMBLY_PHASE = (int) WebConstants.PHASE_ASSEMBLY;

    /**
     * The phase id of studio icon set track.
     * @since 1.6
     */
    public final static int ICONSETS_PHASE = (int) WebConstants.PHASE_ICONSETS;
    
    /**
     * The phase id of studio storyboards track.
     * @since 1.6
     */
    public final static int STORYBOARDS_PHASE = (int) WebConstants.PHASE_STORYBOARDS;
    
    /**
     * The phase id of studio wireframes track.
     * @since 1.6
     */
    public final static int WIREFRAMES_PHASE = (int) WebConstants.PHASE_WIREFRAMES;
    
    /**
     * The phase id of studio logos track.
     * @since 1.6
     */
    public final static int LOGOS_PHASE = (int) WebConstants.PHASE_LOGOS;
    
    /**
     * The phase id of studio print track.
     * @since 1.6
     */
    public final static int PRINT_PHASE = (int) WebConstants.PHASE_PRINT;
    
    /**
     * The phase id of studio specification track.
     * @since 1.6
     */
    public final static int STUDIO_SPECIFICATION_PHASE = (int) WebConstants.PHASE_STUDIO_SPECIFICATION;
    
    /**
     * The phase id of studio widget track.
     * @since 1.6
     */
    public final static int WIDGET_PHASE = (int) WebConstants.PHASE_WIDGET;
    
    /**
     * The phase id of studio front end flash track.
     * @since 1.6
     */
    public final static int FRONTENDFLASH_PHASE = (int) WebConstants.PHASE_FRONTENDFLASH;
    
    /**
     * The phase id of studio application front end track.
     * @since 1.6
     */
    public final static int APPLICATIONFRONTEND_PHASE = (int) WebConstants.PHASE_APPLICATIONFRONTEND;
    
    /**
     * The phase id of studio other track.
     * @since 1.6
     */
    public final static int OTHER_PHASE = (int) WebConstants.PHASE_OTHER;
    
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
     * <p>An <code>int</code> representing specification review phase id.</p>
     */
    public final static int SPECIFICATION_REVIEW_PHASE = (int) WebConstants.PHASE_SPECIFICATION_REVIEW;

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

    /**
     * <p>An <code>int</code> representing copilot posting specification phase id.</p>
     *
     * @since 1.4
     */
    public final static int COPILOT_POSTING_SPECIFICATION_PHASE =
            (int) WebConstants.PHASE_COPILOT_POSTING_SPECIFICATION;

    /**
     * <p>An <code>int</code> representing copilot posting phase id.</p>
     *
     * @since 1.4
     */
    public final static int COPILOT_POSTING_PHASE =(int) WebConstants.PHASE_COPILOT_POSTING;

    /**
     * <p>An <code>int</code> representing content creation specification phase id.</p>
     *
     * @since 1.5
     */
    public final static int CONTENT_CREATION_SPECIFICATION_PHASE =
            (int) WebConstants.PHASE_CONTENT_CREATION_SPECIFICATION;

    /**
     * <p>An <code>int</code> representing content creation phase id.</p>
     *
     * @since 1.5
     */
    public final static int CONTENT_CREATION_PHASE =(int) WebConstants.PHASE_CONTENT_CREATION;
    
    /**
     * <p>An <code>int</code> representing reporting phase id.</p>
     *
     * @since 1.7
     */
    public final static int REPORTING_PHASE =
            (int) WebConstants.PHASE_REPORTING;

    public final static int LEVEL1 = 100;
    public final static int LEVEL2 = 200;


    /**
     * Return the price that the designer/developer would be paid for this component.
     *
     * @return
     */
    float getPrice();

    /**
     * Return the price that the primary reviewer would be paid for reviewing this component.
     *
     * @return
     */
    float getPrimaryReviewCost();

    /**
     * Return the price non-primary reviewers will be paid for reviewing this component.
     *
     * @return
     */
    float getReviewCost();

    /**
     * <p>Gets the cost for screening.</p>
     */
    float getScreeningCost();

    /**
     * <p>Gets the cost for aggregation.</p>
     */
    float getAggregationCost();

    /**
     * <p>Gets the cost for final review.</p>
     */
    float getFinalReviewCost();

    /**
     * <p>Gets the cost for post-mortem review.</p>
     */
    float getPostMortemCost();

    /**
     * <p>Gets the cost for specification review.</p>
     */
    float getSpecReviewCost();

    Object clone() throws OutOfMemoryError;

}

