/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

/**
 * <p><strong>Purpose</strong>: This class is used to calculate review costs for specification review projects.</p>
 *
 * <p>
 *   Version 1.0.1 (Online Review Replatforming Release 2) Change notes:
 *   <ol>
 *     <li>Added {@link #getMilestoneScreeningCost()} to calculate payment for the milestone screener.</li>
 *   </ol>
 * </p>
 * 
 * @author snow01, flexme
 * @version 1.0.1 (Specification Review Integration 1.0)
 */
public class SpecificationReviewerPaymentCalculator implements ReviewerPaymentCalculator {

	/**
     * <p>An <code>float</code> representing specification review price.</p>
     */
    private static final float STANDARD_SPECIFICATION_REVIEW_PRICE = 50f;
	
    /**
     * <p>An <code>float</code> representing design specification review price.</p>
     */
    private static final float STANDARD_DESIGN_SPECIFICATION_REVIEW_PRICE = 50f;

    /**
     * <p>An <code>float</code> representing development specification review price.</p>
     */
    private static final float STANDARD_DEVELOPMENT_SPECIFICATION_REVIEW_PRICE = 50f;

    /**
     * <p>An <code>float</code> representing conceptualization specification review price.</p>
     */
    private static final float STANDARD_CONCEPTUALIZATION_SPECIFICATION_REVIEW_PRICE = 50f;

	/**
     * <p>An <code>float</code> representing specification specification review price.</p>
     */
    private static final float STANDARD_SPECIFICATION_SPECIFICATION_REVIEW_PRICE = 50f;

    /**
     * <p>An <code>float</code> representing architecture specification review price.</p>
     */
    private static final float STANDARD_ARCHITECTURE_SPECIFICATION_REVIEW_PRICE = 50f;

    /**
     * <p>An <code>float</code> representing assembly specification review price.</p>
     */
    private static final float STANDARD_ASSEMBLY_SPECIFICATION_REVIEW_PRICE = 50f;

    /**
     * <p>An <code>float</code> representing test suite specification review price.</p>
     */
    private static final float STANDARD_TEST_SUITES_SPECIFICATION_REVIEW_PRICE = 50f;
	
	/**
     * <p>An <code>float</code> representing test scenario specification review price.</p>
     */
    private static final float STANDARD_TEST_SCENARIOS_SPECIFICATION_REVIEW_PRICE = 50f;

    /**
     * <p>An <code>float</code> representing test scenario specification review price.</p>
     */
    private static final float STANDARD_RIA_BUILD_SPECIFICATION_REVIEW_PRICE = 50f;

    /**
     * <p>An <code>float</code> representing test scenario specification review price.</p>
     */
    private static final float STANDARD_RIA_COMPONENT_SPECIFICATION_REVIEW_PRICE = 50f;

    /**
     * <p>An <code>float</code> representing test scenario specification review price.</p>
     */
    private static final float STANDARD_UI_PROTOTYPE_SPECIFICATION_REVIEW_PRICE = 50f;


    /**
     * private attribute representing phase id
     */
    private int phaseId;

    /**
     * Constructor using phase id parameter
     *
     * @param phaseId the phase id
     */
    public SpecificationReviewerPaymentCalculator(int phaseId) {
        setPhaseId(phaseId);
    }

    /**
     * Gets the phase id
     *
     * @return the phaseId
     */
    public int getPhaseId() {
        return phaseId;
    }

    /**
     * Sets the phase id
     *
     * @param phaseId the phase id to set
     * @throws IllegalArgumentException if the phase id is invalid
     */
    public void setPhaseId(int phaseId) {

        if (phaseId != SoftwareComponent.SPECIFICATION_REVIEW_PHASE
        		&& phaseId != SoftwareComponent.DESIGN_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.DEVELOPMENT_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.CONCEPTUALIZATION_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.SPECIFICATION_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.ARCHITECTURE_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.ASSEMBLY_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.TEST_SUITES_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.TEST_SCENARIOS_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.UI_PROTOTYPE_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.RIA_BUILD_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.RIA_COMPONENT_SPECIFICATION_PHASE) {

            throw new IllegalArgumentException("Invalid phaseId (" + phaseId + ")");
        }

        this.phaseId = phaseId;
    }

    /**
     * Gets the review cost
     *
     * @return the review cost
     */
    public float getReviewCost() {
        switch (phaseId) {
        	case SoftwareComponent.SPECIFICATION_REVIEW_PHASE:
        		return STANDARD_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.DESIGN_SPECIFICATION_PHASE:
                return STANDARD_DESIGN_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.DEVELOPMENT_SPECIFICATION_PHASE:
                return STANDARD_DEVELOPMENT_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.CONCEPTUALIZATION_SPECIFICATION_PHASE:
                return STANDARD_CONCEPTUALIZATION_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.SPECIFICATION_SPECIFICATION_PHASE:
                return STANDARD_SPECIFICATION_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.ARCHITECTURE_SPECIFICATION_PHASE:
                return STANDARD_ARCHITECTURE_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.ASSEMBLY_SPECIFICATION_PHASE:
                return STANDARD_ASSEMBLY_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.TEST_SUITES_SPECIFICATION_PHASE:
                return STANDARD_TEST_SUITES_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.TEST_SCENARIOS_SPECIFICATION_PHASE:
                return STANDARD_TEST_SCENARIOS_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.UI_PROTOTYPE_SPECIFICATION_PHASE:
                return STANDARD_UI_PROTOTYPE_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.RIA_BUILD_SPECIFICATION_PHASE:
                return STANDARD_RIA_BUILD_SPECIFICATION_REVIEW_PRICE;
            case SoftwareComponent.RIA_COMPONENT_SPECIFICATION_PHASE:
                return STANDARD_RIA_COMPONENT_SPECIFICATION_REVIEW_PRICE;
            default:
                return 0;
        }
    }

    /**
     * Gets the screening cost
     *
     * Note: there is no screening cost for specification review projects.
     *
     * @return the screening cost
     */
    public float getScreeningCost() {
        return 0;
    }

    /**
     * Gets the milestone screening cost
     *
     * Note: there is no milestone screening cost for specification review projects.
     *
     * @return the screening cost
     * @since 1.0.1
     */
    public float getMilestoneScreeningCost() {
        return 0;
    }

    /**
     * Gets the aggregation cost
     *
     * Note: there is no aggregation cost for specification review projects.
     *
     * @return the aggregation cost
     */
    public float getAggregationCost() {
        return 0;
    }

    /**
     * Gets the final review cost
     *
     * Note: there is no final review cost for specification review projects.
     *
     * @return the final review cost
     */
    public float getFinalReviewCost() {
        return 0;
    }

    /**
     * Gets a string representation of this object
     *
     * @return the string representation of this object
     */
    public String toString() {
        return ("[phaseId:" + phaseId + "] -> (S:" + getScreeningCost() + " R:" + getReviewCost() + " A:" +
                getAggregationCost() + " FR:" + getFinalReviewCost() + ")");
    }
}
