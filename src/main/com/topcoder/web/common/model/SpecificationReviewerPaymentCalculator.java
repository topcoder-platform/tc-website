/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

// since pulky

public class SpecificationReviewerPaymentCalculator implements ReviewerPaymentCalculator {

    private static final float STANDARD_DESIGN_SPECIFICATION_REVIEW_PRIZE = 10f;
    private static final float STANDARD_DEVELOPMENT_SPECIFICATION_REVIEW_PRIZE = 20f;
    private static final float STANDARD_CONCEPTUALIZATION_SPECIFICATION_REVIEW_PRIZE = 30f;
    private static final float STANDARD_SPECIFICATION_SPECIFICATION_REVIEW_PRIZE = 40f;
    private static final float STANDARD_ARCHITECTURE_SPECIFICATION_REVIEW_PRIZE = 50f;
    private static final float STANDARD_ASSEMBLY_SPECIFICATION_REVIEW_PRIZE = 60f;
    private static final float STANDARD_APPLICATION_TESTING_SPECIFICATION_REVIEW_PRIZE = 70f;

	private int phaseId;
	
    public SpecificationReviewerPaymentCalculator(int phaseId) {
        setPhaseId(phaseId);
    }

    /**
     * @return the phaseId
     */
    public int getPhaseId() {
        return phaseId;
    }

    /**
     * @param phaseId the phaseId to set
     */
    public void setPhaseId(int phaseId) {
        
        if (phaseId != SoftwareComponent.DESIGN_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.DEVELOPMENT_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.CONCEPTUALIZATION_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.SPECIFICATION_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.ARCHITECTURE_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.ASSEMBLY_SPECIFICATION_PHASE
                && phaseId != SoftwareComponent.APPLICATION_TESTING_SPECIFICATION_PHASE) {

            throw new IllegalArgumentException("Invalid phaseId (" + phaseId + ")");
        }

        this.phaseId = phaseId;
    }


    public float getReviewCost() {
        switch (phaseId) {
            case SoftwareComponent.DESIGN_SPECIFICATION_PHASE:
                return STANDARD_DESIGN_SPECIFICATION_REVIEW_PRIZE;
            case SoftwareComponent.DEVELOPMENT_SPECIFICATION_PHASE:
                return STANDARD_DEVELOPMENT_SPECIFICATION_REVIEW_PRIZE;
            case SoftwareComponent.CONCEPTUALIZATION_SPECIFICATION_PHASE:
                return STANDARD_CONCEPTUALIZATION_SPECIFICATION_REVIEW_PRIZE;
            case SoftwareComponent.SPECIFICATION_SPECIFICATION_PHASE:
                return STANDARD_SPECIFICATION_SPECIFICATION_REVIEW_PRIZE;
            case SoftwareComponent.ARCHITECTURE_SPECIFICATION_PHASE:
                return STANDARD_ARCHITECTURE_SPECIFICATION_REVIEW_PRIZE;
            case SoftwareComponent.ASSEMBLY_SPECIFICATION_PHASE:
                return STANDARD_ASSEMBLY_SPECIFICATION_REVIEW_PRIZE;
            case SoftwareComponent.APPLICATION_TESTING_SPECIFICATION_PHASE:
                return STANDARD_APPLICATION_TESTING_SPECIFICATION_REVIEW_PRIZE;
            default: 
                return 0;
        }
    }

    public float getScreeningCost() {
        return 0;
    }

    public float getAggregationCost() {
        return 0;
    }

    public float getFinalReviewCost() {
        return 0;
    }
    
    public String toString() {
        return ("[phaseId:" + phaseId + "] -> (S:" + getScreeningCost() + " R:" + getReviewCost() + " A:" + 
                getAggregationCost() + " FR:" + getFinalReviewCost() + ")");
    }
}
