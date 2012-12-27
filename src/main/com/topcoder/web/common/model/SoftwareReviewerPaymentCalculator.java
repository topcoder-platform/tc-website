/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.HashMap;
import java.util.Map;

public class SoftwareReviewerPaymentCalculator extends BaseReviewerPaymentCalculator {
    private int phaseId;
    
    private final Map<Integer, Float> reviewBaseCoef = new HashMap<Integer,Float>();
    private final Map<Integer, Float> reviewIncrementalCoef = new HashMap<Integer,Float>();
    private final Map<Integer, Float> screeningIncrementalCoef = new HashMap<Integer,Float>();
    private final Map<Integer, Float> finalReviewCoef = new HashMap<Integer,Float>();
	
    public SoftwareReviewerPaymentCalculator(int phaseId, float firstPlacePrize, int submissionCount, int passedScreeningCount) {
        super(firstPlacePrize, submissionCount, passedScreeningCount);
        this.phaseId = phaseId;
                
        reviewBaseCoef.put(SoftwareComponent.DESIGN_PHASE, 0.12f);
        reviewBaseCoef.put(SoftwareComponent.DEV_PHASE, 0.2f);
        reviewBaseCoef.put(SoftwareComponent.CONCEPTUALIZATION_PHASE, 0.12f);
        reviewBaseCoef.put(SoftwareComponent.ARCHITECTURE_PHASE, 0.12f);
        reviewBaseCoef.put(SoftwareComponent.ASSEMBLY_PHASE, 0.13f);
        reviewBaseCoef.put(SoftwareComponent.TEST_SUITES_PHASE, 0.12f);
        reviewBaseCoef.put(SoftwareComponent.TEST_SCENARIOS_PHASE, 0.12f);
        
        reviewIncrementalCoef.put(SoftwareComponent.DESIGN_PHASE, 0.05f);
        reviewIncrementalCoef.put(SoftwareComponent.DEV_PHASE, 0.05f);
        reviewIncrementalCoef.put(SoftwareComponent.CONCEPTUALIZATION_PHASE, 0.03f);
        reviewIncrementalCoef.put(SoftwareComponent.ARCHITECTURE_PHASE, 0.05f);
        reviewIncrementalCoef.put(SoftwareComponent.ASSEMBLY_PHASE, 0.05f);
        reviewIncrementalCoef.put(SoftwareComponent.TEST_SUITES_PHASE, 0.05f);
        reviewIncrementalCoef.put(SoftwareComponent.TEST_SCENARIOS_PHASE, 0.05f);
        
        screeningIncrementalCoef.put(SoftwareComponent.DESIGN_PHASE, 0.01f);
        screeningIncrementalCoef.put(SoftwareComponent.DEV_PHASE, 0.02f);
        screeningIncrementalCoef.put(SoftwareComponent.CONCEPTUALIZATION_PHASE, 0.01f);
        screeningIncrementalCoef.put(SoftwareComponent.ARCHITECTURE_PHASE, 0.01f);
        screeningIncrementalCoef.put(SoftwareComponent.ASSEMBLY_PHASE, 0.01f);
        screeningIncrementalCoef.put(SoftwareComponent.TEST_SUITES_PHASE, 0.01f);
        screeningIncrementalCoef.put(SoftwareComponent.TEST_SCENARIOS_PHASE, 0.01f);

        finalReviewCoef.put(SoftwareComponent.DESIGN_PHASE, 0.05f);
        finalReviewCoef.put(SoftwareComponent.DEV_PHASE, 0.05f);
        finalReviewCoef.put(SoftwareComponent.CONCEPTUALIZATION_PHASE, 0.05f);
        finalReviewCoef.put(SoftwareComponent.ARCHITECTURE_PHASE, 0.05f);
        finalReviewCoef.put(SoftwareComponent.ASSEMBLY_PHASE, 0.05f);
        finalReviewCoef.put(SoftwareComponent.TEST_SUITES_PHASE, 0.03f);
        finalReviewCoef.put(SoftwareComponent.TEST_SCENARIOS_PHASE, 0.03f);
    }

    public float getScreeningCost() {
        return getScreeningIncrementalCoef() * getSubmissionCount() * getFirstPlacePrize();
    }

    public float getReviewCost() {
        return (getReviewBaseCoef() + getReviewIncrementalCoef() * getPassedScreeningCount()) * getFirstPlacePrize();
    }

    public float getAggregationCost() {
        return 10f;
    }

    public float getFinalReviewCost() {
        return getFinalReviewCoef() * getFirstPlacePrize();
    }
    
    private float getReviewBaseCoef() {
        if (reviewBaseCoef.containsKey(phaseId)) {
            return reviewBaseCoef.get(phaseId) ;
        } else {
            return 0.08f;
        }
    }

    private float getReviewIncrementalCoef() {
        if (reviewIncrementalCoef.containsKey(phaseId)) {
            return reviewIncrementalCoef.get(phaseId) ;
        } else {
            return 0.03f;
        }
    }

    private float getScreeningIncrementalCoef() {
        if (screeningIncrementalCoef.containsKey(phaseId)) {
            return screeningIncrementalCoef.get(phaseId) ;
        } else {
            return 0.01f;
        }
    }
   
    private float getFinalReviewCoef() {
        if (finalReviewCoef.containsKey(phaseId)) {
            return finalReviewCoef.get(phaseId) ;
        } else {
            return 0.03f;
        }
    }
}
