/*
 * Copyright (c) 2006, 2009 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;

/**
 * <p><strong>Purpose</strong>: Calculates Reviewers tasks costs.</p>
 *
 * <p>
 *   Version 1.0.1 Change notes:
 *   <ol>
 *     <li>Added some overloads to for design and development task costs.</li>
 *   </ol>
 *
 *   Version 1.0.2 Change notes:
 *   <ol>
 *     <li>Changed the development formula to remove payment for tests, adjusted base rates for both design and dev.
 *     Testing project formulas added.</li>
 *   </ol>
 *
 *   Version 1.0.3 Change notes:
 *   <ol>
 *     <li>Introduced scaling of reviewer payments based on prize and DR points.</li>
 *   </ol>
 *
 *   Version 1.0.4 Change notes:
 *   <ol>
 *     <li>Added methods for calculating the review payments for <code>Assembly</code> competitions.</li>
 *   </ol>
 *
 *   Version 1.0.5 Change notes:
 *   <ol>
 *     <li>Added methods for calculating the review payments for <code>Architecture</code> competitions.</li>
 *   </ol>
 *
 *   Version 1.0.6 Change notes:
 *   <ol>
 *     <li>Added methods for calculating the review payments for <code>Conceptualization</code>,
 *     <code>Specification</code>, and <code>Testing</code> competitions.</li>
 *   </ol>
 *
 * @author dok, pulky, ivern, isv, TCSDEVELOPER
 * @version 1.0.6
 */
public class DefaultPriceComponent implements SoftwareComponent {

    /**
     * <p>A <code>int</code> referencing the fictive phase type corresponding to <code>Assembly</code> competitions.</p>
     *
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private static final int ASSEMBLY_COMPETITIONS = 125;

    /**
     * <p>A <code>int</code> referencing the fictive phase type corresponding to <code>Architecture</code> competitions.
     * </p>
     *
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private static final int ARCHITECTURE_COMPETITIONS = 118;

    /**
     * <p>A <code>int</code> referencing the fictive phase type corresponding to <code>Conceptualization</code>
     * competitions.</p>
     *
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private static final int CONCEPTUALIZATION_COMPETITIONS = 134;

    /**
     * <p>A <code>int</code> referencing the fictive phase type corresponding to <code>Specification</code>
     * competitions.</p>
     *
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private static final int SPECIFICATION_COMPETITIONS = 117;

    /**
     * <p>A <code>int</code> referencing the fictive phase type corresponding to <code>Testing</code> competitions.
     * </p>
     *
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private static final int TESTING_COMPETITIONS = 124;

    /**
     * <p>A <code>Log</code> to be used for logging the events encountered while calculating the prices.</p>
     */
    private static Logger log = Logger.getLogger(DefaultPriceComponent.class);

    /**
     * <p>A <code>float</code> array listing the prices for <code>Design</code> competitions per competition level.
     * </p>
     */
    private final static float[] DESIGN_PRICE_LOOKUP = {0f, 540f, 540f};

    /**
     * <p>A <code>float</code> array listing the prices for <code>Development</code> competitions per competition level.
     * </p>
     */
    private final static float[] DEV_PRICE_LOOKUP = {0f, 450f, 450f};

    /**
     * <p>A <code>float</code> array listing the prices for <code>Assembly</code> competitions per competition level.
     * </p>
     *
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private final static float[] ASSEMBLY_PRICE_LOOKUP = DEV_PRICE_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the prices for <code>Architecture</code> competitions per competition
     * level.</p>
     *
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private final static float[] ARCHITECTURE_PRICE_LOOKUP = DEV_PRICE_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the prices for <code>Conceptualization</code> competitions per competition
     * level.</p>
     *
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private final static float[] CONCEPTUALIZATION_PRICE_LOOKUP = ARCHITECTURE_PRICE_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the prices for <code>Specification</code> competitions per competition
     * level.</p>
     *
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private final static float[] SPECIFICATION_PRICE_LOOKUP = ARCHITECTURE_PRICE_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the prices for <code>Testing</code> competitions per competition level.
     * </p>
     *
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private final static float[] TESTING_PRICE_LOOKUP = DEV_PRICE_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the DR points for <code>Design</code> competitions per competition level.
     * </p>
     */
    private final static float[] DESIGN_DR_LOOKUP = {0f, 540f, 540f};

    /**
     * <p>A <code>float</code> array listing the DR points for <code>Development</code> competitions per competition
     * level.</p>
     */
    private final static float[] DEV_DR_LOOKUP = {0f, 450f, 450f};

    /**
     * <p>A <code>float</code> array listing the DR points for <code>Assembly</code> competitions per competition level.
     * </p>
     *
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private final static float[] ASSEMBLY_DR_LOOKUP = DEV_DR_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the DR points for <code>Architecture</code> competitions per competition
     * level.</p>
     *
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private final static float[] ARCHITECTURE_DR_LOOKUP = DEV_DR_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the DR points for <code>Conceptualization</code> competitions per
     * competition level.</p>
     *
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private final static float[] CONCEPTUALIZATION_DR_LOOKUP = ARCHITECTURE_DR_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the DR points for <code>Specification</code> competitions per
     * competition level.</p>
     *
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private final static float[] SPECIFICATION_DR_LOOKUP = ARCHITECTURE_DR_LOOKUP;

    /**
     * <p>A <code>float</code> array listing the DR points for <code>Testing</code> competitions per
     * competition level.</p>
     *
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private final static float[] TESTING_DR_LOOKUP = DEV_DR_LOOKUP;

    /**
     * <p>A <code>float</code> providing the review rate for <code>Development</code> competitions (in hours).</p>
     */
    private final static float DEV_REVIEW_RATE = 24f;

    /**
     * <p>A <code>float</code> providing the review rate for <code>Assembly</code> competitions.</p>
     *
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private final static float ASSEMBLY_REVIEW_RATE = DEV_REVIEW_RATE;

    /**
     * <p>A <code>float</code> providing the review rate for <code>Design</code> competitions (in hours).</p>
     */
    private final static float DESIGN_REVIEW_RATE = 23f;

    /**
     * <p>A <code>float</code> providing the review rate for <code>Architecture</code> competitions.</p>
     *
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private final static float ARCHITECTURE_REVIEW_RATE = DESIGN_REVIEW_RATE;

    /**
     * <p>A <code>float</code> providing the review rate for <code>Conceptualization</code> competitions.</p>
     *
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private final static float CONCEPTUALIZATION_REVIEW_RATE = ARCHITECTURE_REVIEW_RATE;

    /**
     * <p>A <code>float</code> providing the review rate for <code>Conceptualization</code> competitions.</p>
     *
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private final static float SPECIFICATION_REVIEW_RATE = ARCHITECTURE_REVIEW_RATE;

    /**
     * <p>A <code>float</code> providing the review rate for <code>Testing</code> competitions.</p>
     *
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private final static float TESTING_REVIEW_RATE = DEV_REVIEW_RATE;

    /**
     * <p>An <code>int</code> referencing the current phase for the project.</p>
     */
    protected int phaseId;

    /**
     * <p>An <code>int</code> referencing the difficulty level for the project.</p>
     */
    protected int level;

    /**
     * <p>An <code>int</code> providing the number of submissions for the project.</p>
     */
    private int submissionCount;

    /**
     * <p>An <code>int</code> providing the number of submissions for the project which passed the screening.</p>
     */
    private int submissionsPassedScreening;

    /**
     * <p>A <code>float</code> providing the prize for the competition.</p>
     */
    private float prize;

    /**
     * <p>A <code>float</code> providing the amount of <code>DR</code> points for the competition.</p>
     */
    private float drPoints;

    /**
     * <p>A <code>float</code> providing the compensation ratio for the competition.</p>
     */
    private float compensationRatio;

    /**
     * <p>Constructs new <code>DefaultPriceComponent</code> instance. This implementation does nothing.</p>
     */
    @Deprecated
    public DefaultPriceComponent() {
    }

    /**
     * <p>Constructs new <code>DefaultPriceComponent</code> instance to be used for calculating the prices for project
     * with specified parameters.</p>
     *
     * @param levelId an <code>int</code> referencing the difficulty level for the project.
     * @param submissionCount an <code>int</code> providing the number of submissions for the project.
     * @param submissionsPassedScreening an <code>int</code> providing the number of submissions for the project which
     *        passed screening.
     * @param phaseId an <code>int</code> referencing the current phase for the project.
     */
    @Deprecated
    public DefaultPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId) {
        log.debug("level: " + levelId + " submissionCount: " + submissionCount + " submissionPassedScreening: " +
                  submissionsPassedScreening + " phaseId: " + phaseId + " prize: " + prize + " drPoints: " + drPoints);

        this.phaseId = phaseId;

        if (levelId == LEVEL1) {
            this.level = 1;
        } else if (levelId == LEVEL2) {
            this.level = 2;
        } else {
            throw new IllegalArgumentException("invalid level provided " + levelId);
        }

        this.submissionCount = submissionCount;
        this.submissionsPassedScreening = submissionsPassedScreening;

        if (phaseId == DESIGN_PHASE) {
            this.prize = DESIGN_PRICE_LOOKUP[level];
            this.drPoints = DESIGN_DR_LOOKUP[level];
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            this.prize = ASSEMBLY_PRICE_LOOKUP[level];
            this.drPoints = ASSEMBLY_DR_LOOKUP[level];
        } else if (phaseId == ARCHITECTURE_COMPETITIONS) {
            this.prize = ARCHITECTURE_PRICE_LOOKUP[level];
            this.drPoints = ARCHITECTURE_DR_LOOKUP[level];
        } else {
            this.prize = DEV_PRICE_LOOKUP[level];
            this.drPoints = DEV_DR_LOOKUP[level];
        }

        this.compensationRatio = 1.0f;
    }

    /**
     * <p>Constructs new <code>DefaultPriceComponent</code> instance to be used for calculating the prices for project
     * with specified parameters.</p>
     *
     * @param levelId an <code>int</code> referencing the difficulty level for the project.
     * @param submissionCount an <code>int</code> providing the number of submissions for the project.
     * @param submissionsPassedScreening an <code>int</code> providing the number of submissions for the project which
     *        passed screening.
     * @param phaseId an <code>int</code> referencing the current phase for the project.
     * @param prize a <code>float</code> providing the prized for the project.
     * @param drPoints a <code>float</code> providing the amount of <code>DR</code> points for project.
     * @since TCS Release 2.2.2 (TCS-60, TCS-63, TCS-74)
     */
    public DefaultPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId,
                                 float prize, float drPoints) {
        log.debug("level: " + levelId + " submissionCount: " + submissionCount + " submissionPassedScreening: " +
                  submissionsPassedScreening + " phaseId: " + phaseId + " prize: " + prize + " drPoints: " + drPoints);

        this.phaseId = phaseId;

        if (levelId == LEVEL1) {
            this.level = 1;
        } else if (levelId == LEVEL2) {
            this.level = 2;
        } else {
            throw new IllegalArgumentException("invalid level provided " + levelId);
        }

        this.submissionCount = submissionCount;
        this.submissionsPassedScreening = submissionsPassedScreening;

        this.prize = prize;
        this.drPoints = drPoints;

        if (phaseId == DESIGN_PHASE) {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(DESIGN_PRICE_LOOKUP[level],
                                                              DESIGN_DR_LOOKUP[level]));
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(ASSEMBLY_PRICE_LOOKUP[level],
                                                              ASSEMBLY_DR_LOOKUP[level]));
        } else if (phaseId == ARCHITECTURE_COMPETITIONS) {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(ARCHITECTURE_PRICE_LOOKUP[level],
                                                              ARCHITECTURE_DR_LOOKUP[level]));
        } else if (phaseId == CONCEPTUALIZATION_COMPETITIONS) {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(CONCEPTUALIZATION_PRICE_LOOKUP[level],
                                                              CONCEPTUALIZATION_DR_LOOKUP[level]));
        } else if (phaseId == SPECIFICATION_COMPETITIONS) {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(SPECIFICATION_PRICE_LOOKUP[level],
                                                              SPECIFICATION_DR_LOOKUP[level]));
        } else if (phaseId == TESTING_COMPETITIONS) {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(TESTING_PRICE_LOOKUP[level],
                                                              TESTING_DR_LOOKUP[level]));
        } else if (phaseId == DEV_PHASE) {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(DEV_PRICE_LOOKUP[level],
                                                              DEV_DR_LOOKUP[level]));
        } else {
            throw new RuntimeException("Invalid phaseId : " + phaseId);
        }
    }

    /**
     * <p>Creates a clone copy of this price component.</p>
     *
     * @return a clone copy of this price component.
     * @throws OutOfMemoryError if memory heap is exhausted.
     */
    public Object clone() throws OutOfMemoryError {
        DefaultPriceComponent ret = new DefaultPriceComponent();
        ret.phaseId = this.phaseId;
        ret.level = this.level;
        ret.submissionCount = this.submissionCount;
        ret.submissionsPassedScreening = this.submissionsPassedScreening;
        ret.prize = this.prize;
        ret.drPoints = this.drPoints;
        ret.compensationRatio = this.compensationRatio;
        return ret;
    }

    /**
     * <p>Gets the price for the project.</p>
     *
     * @return a <code>float</code> providing the price for the project.
     */
    public float getPrice() {
        return this.prize;
    }

    /**
     * <p>Gets the amount of <code>Digital Run</code> points for the project.</p>
     *
     * @return a <code>float</code> providing the amount of <code>DR</code>  for the project.
     */
    public float getDR() {
        return this.drPoints;
    }

    /**
     * <p>Gets the prize purse for the project combining the prizes for first and second place.</p>
     *
     * @return a <code>float</code> providing the prize purse for the project.
     */
    public float getPrizePurse() {
        return this.prize * 1.5f;
    }

    /**
     * <p>Gets the initial prize purse for the project.</p>
     *
     * @return a <code>float</code> providing the initial prize purse for the project.
     */
    public float getInitialPurse() {
        return 0.40f * getPrizePurse();
    }

    /**
     * <p>Gets the increment for prize purse for the project.</p>
     *
     * @return a <code>float</code> providing the increment for prize purse for the project.
     */
    public float getIncrementPurse() {
        return 0.15f * getPrizePurse();
    }

    public float getCompetitorCompensation() {
        return calculateCompensation(this.prize, this.drPoints);
    }

    /**
     * <p>Gets the review rate for <code>Design</code> competitions.</p>
     *
     * @return a <code>float</code> providing the review rate for <code>Design</code> competitions.
     */
    public float getDesignReviewRate() {
        return DESIGN_REVIEW_RATE * this.compensationRatio;
    }

    /**
     * <p>Gets the review rate for <code>Development</code> competitions.</p>
     *
     * @return a <code>float</code> providing the review rate for <code>Development</code> competitions.
     */
    public float getDevReviewRate() {
        return DEV_REVIEW_RATE * this.compensationRatio;
    }

    /**
     * <p>Gets the review rate for <code>Testing</code> competitions.</p>
     *
     * @return a <code>float</code> providing the review rate for <code>Testing</code> competitions.
     * @since TCS Release 2.2.2 (TCS-74)
     */
    public float getTestingReviewRate() {
        return TESTING_REVIEW_RATE * this.compensationRatio;
    }

    /**
     * <p>Gets the review rate for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the review rate for <code>Assembly</code> competitions.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    public float getAssemblyReviewRate() {
        return ASSEMBLY_REVIEW_RATE * this.compensationRatio;
    }

    /**
     * <p>Gets the review rate for <code>Architecture</code> competitions.</p>
     *
     * @return a <code>float</code> providing the review rate for <code>Architecture</code> competitions.
     * @since TCS Release 2.2.1 (TCS-57)
     */
    public float getArchitectureReviewRate() {
        return ARCHITECTURE_REVIEW_RATE * this.compensationRatio;
    }

    /**
     * <p>Gets the review rate for <code>Conceptualization</code> competitions.</p>
     *
     * @return a <code>float</code> providing the review rate for <code>Conceptualization</code> competitions.
     * @since TCS Release 2.2.2 (TCS-63)
     */
    public float getConceptualizationReviewRate() {
        return CONCEPTUALIZATION_REVIEW_RATE * this.compensationRatio;
    }

    /**
     * <p>Gets the review rate for <code>Specification</code> competitions.</p>
     *
     * @return a <code>float</code> providing the review rate for <code>Specification</code> competitions.
     * @since TCS Release 2.2.2 (TCS-60)
     */
    public float getSpecificationReviewRate() {
        return SPECIFICATION_REVIEW_RATE * this.compensationRatio;
    }

    /**
     * <p>Gets the cost for primary review.</p>
     *
     * @return a <code>float</code> providing the cost for primary review.
     * @since TCS Release 2.2.2 (TCS-60, TCS-63, TCS-74)
     */
    public float getPrimaryReviewPrice() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getPrimaryDevReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getPrimaryDesignReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getPrimaryAssemblyReviewCost();
        } else if (phaseId == ARCHITECTURE_COMPETITIONS) {
            ret = getPrimaryArchitectureReviewCost();
        } else if (phaseId == CONCEPTUALIZATION_COMPETITIONS) {
            ret = getPrimaryConceptualizationReviewCost();
        } else if (phaseId == SPECIFICATION_COMPETITIONS) {
            ret = getPrimarySpecificationReviewCost();
        } else if (phaseId == TESTING_COMPETITIONS) {
            ret = getPrimaryTestingReviewCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * <p>Gets the cost for review.</p>
     *
     * @return a <code>float</code> providing the cost for review.
     * @since TCS Release 2.2.2 (TCS-60, TCS-63, TCS-74)
     */
    public float getReviewPrice() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getDevReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getDesignReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyReviewCost();
        } else if (phaseId == ARCHITECTURE_COMPETITIONS) {
            ret = getArchitectureReviewCost();
        } else if (phaseId == CONCEPTUALIZATION_COMPETITIONS) {
            ret = getConceptualizationReviewCost();
        } else if (phaseId == SPECIFICATION_COMPETITIONS) {
            ret = getSpecificationReviewCost();
        } else if (phaseId == TESTING_COMPETITIONS) {
            ret = getTestingReviewCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * <p>Gets the cost for primary review for <code>Development</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for primary review for <code>Development</code> competition.
     */
    private float getPrimaryDevReviewCost() {
        debug("screeningCost " + getScreeningPrimaryDevReviewCost());
        debug("aggregationCost " + getDevAggregationCost());
        debug("finalReviewCost " + getDevFinalReviewCost());
        return getScreeningPrimaryDevReviewCost() + getDevAggregationCost() +
                getDevFinalReviewCost() + getDevCoreReviewCost();
    }

    /**
     * <p>Gets the cost for screening review for <code>Development</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Development</code> competition.
     */
    private float getScreeningPrimaryDevReviewCost() {
        //float screeningSetupCost = 1.0f * getDevReviewRate(); // 60 minutes to set up
        //float screeningCost = (1f / 2f) * (float) submissionCount * getDevReviewRate();  //30 minutes per submission
        return (0.86f * getInitialPurse() + getIncrementPurse() * (submissionCount - 1)) * 0.10f;
    }

    /**
     * <p>Gets the cost for review aggregation for <code>Development</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review aggregation for <code>Development</code> competition.
     */
    private float getDevAggregationCost() {
        //float aggregationCost = (1f / 2f) * getDevReviewRate();  //30 minutes to aggregate
        return 0.04f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for final review for <code>Development</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for final review for <code>Development</code> competition.
     */
    private float getDevFinalReviewCost() {
        //float finalReviewCost = 2f * getDevReviewRate();  //120 minutes to do final review
        return 0.10f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for core review for <code>Development</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for core review for <code>Development</code> competition.
     */
    private float getDevCoreReviewCost() {
        //float reviewCost = (float) (level + 1) * (float) submissionsPassedScreening * getDevReviewRate();
        //float startupCost = getDevReviewRate() * 2; //120 minutes to "start up"
        //float testCaseCost = getDevReviewRate() * 5; // 5 hours to write test cases
        //debug("reviewCost " + reviewCost);
        //debug("startupCost " + startupCost);
        //debug("testCaseCost " + testCaseCost);
        //return reviewCost + startupCost + testCaseCost;

        return (0.86f * getInitialPurse() + getIncrementPurse() * (submissionsPassedScreening - 1)) * 0.9f / 3.0f;
    }

    /**
     * <p>Gets the cost for review for <code>Development</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review for <code>Development</code> competition.
     */
    private float getDevReviewCost() {
        //float aggregationReviewCost = (1f / 2f) * getDevReviewRate(); //30 minutes for aggregation review
        //debug("aggregationCost " + aggregationReviewCost);
        //return aggregationReviewCost + getDevCoreReviewCost();
        return getDevCoreReviewCost();
    }

    /**
     * <p>Gets the cost for primary review for <code>Testing</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for primary review for <code>Testing</code> competition.
     */
    private float getPrimaryTestingReviewCost() {
        debug("screeningCost " + getScreeningPrimaryTestingReviewCost());
        debug("aggregationCost " + getTestingAggregationCost());
        debug("finalReviewCost " + getTestingFinalReviewCost());
        return getScreeningPrimaryTestingReviewCost() + getTestingAggregationCost() +
                getTestingFinalReviewCost() + getTestingCoreReviewCost();
    }

    /**
     * <p>Gets the cost for screening review for <code>Testing</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Testing</code> competition.
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private float getScreeningPrimaryTestingReviewCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionCount - 1)) * 0.10f;
    }

    /**
     * <p>Gets the cost for review aggregation for <code>Testing</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review aggregation for <code>Testing</code> competition.
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private float getTestingAggregationCost() {
        return 0.04f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for final review for <code>Testing</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for final review for <code>Testing</code> competition.
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private float getTestingFinalReviewCost() {
        return 0.10f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for core review for <code>Testing</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for core review for <code>Testing</code> competition.
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private float getTestingCoreReviewCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionsPassedScreening - 1)) * 0.9f / 3.0f;
    }

    /**
     * <p>Gets the cost for review for <code>Testing</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review for <code>Testing</code> competition.
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private float getTestingReviewCost() {
        debug("getTestingCoreReviewCost " + getTestingCoreReviewCost());
        return getTestingCoreReviewCost();
    }

    /**
     * <p>Gets the cost for review for <code>Design</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review for <code>Design</code> competition.
     */
    private float getDesignReviewCost() {
        //float aggregationReviewCost = (1f / 2f) * getDesignReviewRate(); //30 minutes for aggregation review
        //debug("aggregationReviewCost " + aggregationReviewCost);
        //return aggregationReviewCost + getCoreDesignReviewCost();
        return getCoreDesignReviewCost();
    }

    /**
     * <p>Gets the cost for primary review for <code>Desgin</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for primary review for <code>Design</code> competition.
     */
    private float getPrimaryDesignReviewCost() {
        debug("screeningCost " + getDesignScreeningCost());
        debug("aggregationCost " + getDesignAggregationCost());
        debug("finalReviewCost " + getDesignFinalReviewCost());
        return getDesignScreeningCost() + getDesignAggregationCost() +
                getDesignFinalReviewCost() + getCoreDesignReviewCost();
    }

    /**
     * <p>Gets the cost for screening review for <code>Design</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Design</code> competition.
     */
    private float getDesignScreeningCost() {
        //float screeningCost = 0.75f * (float) submissionCount * getDesignReviewRate();  //45 minutes per submission
        //return screeningCost;
        return (0.86f * getInitialPurse() + getIncrementPurse() * (submissionCount - 1)) * 0.10f;
    }

    /**
     * <p>Gets the cost for review aggregation for <code>Design</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review aggregation for <code>Design</code> competition.
     */
    private float getDesignAggregationCost() {
        //float aggregationCost = (1f / 2f) * getDesignReviewRate();  //30 minutes to aggregate
        //return aggregationCost;
        return 0.04f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for final review for <code>Design</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for final review for <code>Design</code> competition.
     */
    private float getDesignFinalReviewCost() {
        //float finalReviewCost = getDesignReviewRate();  //60 minutes to do final review
        //return finalReviewCost;
        return 0.10f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for base review for <code>Design</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for base review for <code>Design</code> competition.
     */
    private float getCoreDesignReviewCost() {
        //float reviewCost = (float) (level + 2) * (float) submissionsPassedScreening * getDesignReviewRate();
        //float startupCost = 2.0f * getDesignReviewRate(); //120 minutes to "start up"
        //debug("reviewCost " + reviewCost);
        //debug("startupCost " + startupCost);
        //return reviewCost + startupCost;
        return (0.86f * getInitialPurse() + getIncrementPurse() * (submissionsPassedScreening - 1)) * 0.9f / 3.0f;
    }

    /**
     * <p>Gets the cost for review aggregation.</p>
     *
     * @return a <code>float</code> providing the cost for review aggregation.
     * @since TCS Release 2.2.2 (TCS-60, TCS-63, TCS-74)
     */
    public float getAggregationCost() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getDevAggregationCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getDesignAggregationCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyAggregationCost();
        } else if (phaseId == ARCHITECTURE_COMPETITIONS) {
            ret = getArchitectureAggregationCost();
        } else if (phaseId == CONCEPTUALIZATION_COMPETITIONS) {
            ret = getConceptualizationAggregationCost();
        } else if (phaseId == SPECIFICATION_COMPETITIONS) {
            ret = getSpecificationAggregationCost();
        } else if (phaseId == TESTING_COMPETITIONS) {
            ret = getTestingAggregationCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * <p>Gets the cost for screening review.</p>
     *
     * @return a <code>float</code> providing the cost for screening review.
     * @since TCS Release 2.2.2 (TCS-60, TCS-63, TCS-74)
     */
    public float getScreeningCost() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getScreeningPrimaryDevReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getDesignScreeningCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyScreeningCost();
        } else if (phaseId == ARCHITECTURE_COMPETITIONS) {
            ret = getArchitectureScreeningCost();
        } else if (phaseId == CONCEPTUALIZATION_COMPETITIONS) {
            ret = getConceptualizationScreeningCost();
        } else if (phaseId == SPECIFICATION_COMPETITIONS) {
            ret = getSpecificationScreeningCost();
        } else if (phaseId == TESTING_COMPETITIONS) {
            ret = getTestingScreeningCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * <p>Gets the cost for final review.</p>
     *
     * @return a <code>float</code> providing the cost for final review.
     * @since TCS Release 2.2.2 (TCS-60, TCS-63, TCS-74)
     */
    public float getFinalReviewCost() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getDevFinalReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getDesignFinalReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyFinalReviewCost();
        } else if (phaseId == ARCHITECTURE_COMPETITIONS) {
            ret = getArchitectureFinalReviewCost();
        } else if (phaseId == CONCEPTUALIZATION_COMPETITIONS) {
            ret = getConceptualizationFinalReviewCost();
        } else if (phaseId == SPECIFICATION_COMPETITIONS) {
            ret = getSpecificationFinalReviewCost();
        } else if (phaseId == TESTING_COMPETITIONS) {
            ret = getTestingFinalReviewCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * <p>Gets the cost for core review.</p>
     *
     * @return a <code>float</code> providing the cost for core review.
     * @since TCS Release 2.2.2 (TCS-60, TCS-63, TCS-74)
     */
    public float getCoreReviewCost() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getDevCoreReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getCoreDesignReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyCoreReviewCost();
        } else if (phaseId == ARCHITECTURE_COMPETITIONS) {
            ret = getArchitectureCoreReviewCost();
        } else if (phaseId == CONCEPTUALIZATION_COMPETITIONS) {
            ret = getConceptualizationCoreReviewCost();
        } else if (phaseId == SPECIFICATION_COMPETITIONS) {
            ret = getSpecificationCoreReviewCost();
        } else if (phaseId == TESTING_COMPETITIONS) {
            ret = getTestingCoreReviewCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * <p>Calculates the total compensation for the project which includes prize purse, reliability bonuses, DR points.
     * </p>
     *
     * @param prize a <code>float</code> providing the prize for the project.
     * @param dr a <code>float</code> providing the amount of <code>Digital Run</code> points for the project.
     * @return a <code>float</code> providing the total compensation for the project.
     */
    private float calculateCompensation(float prize, float dr) {
        return prize * 1.5f * 1.5f + dr; // Winner + second place + reliability bonuses + DR
    }

    /**
     * <p>Gets the project phase.</p>
     *
     * @return an <code>int</code> referencing the current project phase.
     */
    public int getPhaseId() {
        return phaseId;
    }

/*
    public int getLevel() {
        return level;
    }
*/

    /**
     * <p>A command line interface to be used for calculating the prices for the projects with parameters passed as
     * command line arguments.</p>
     *
     * @param args a <code>String</code> array providing the command line arguments.
     * @since TCS Release 2.2.2 (TCS-60, TCS-63, TCS-74)
     */
    public static void main(String[] args) {
        if (args.length != 6) {
            System.out.println("usage: java " + SoftwareComponent.class.toString() + " " +
                    "<level> <numSubmissions> <numSubmissionPassScreening> <phaseId> <prize> <drPoints>");
            System.out.println("dev phaseId " + DEV_PHASE);
            System.out.println("design phaseId " + DESIGN_PHASE);
        } else {
            int level = 1;
            if (args[0].equals("1")) {
                level = LEVEL1;
            } else if (args[0].equals("2")) {
                level = LEVEL2;
            }
            DefaultPriceComponent sc = new DefaultPriceComponent(level, Integer.parseInt(args[1]),
                                                                 Integer.parseInt(args[2]), Integer.parseInt(args[3]),
                                                                 Float.parseFloat(args[4]), Float.parseFloat(args[5]));
            System.out.println("-------------------------------------------------------------");
            if (sc.phaseId == DEV_PHASE) {
                System.out.println("        Dev Prize            |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("         Dev DR              |      " + sc.getDR());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("   Total Dev Compensation    |      " + sc.getCompetitorCompensation());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("     Dev Review Cost         |      " + sc.getReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Dev Primary Review Cost    |      " + sc.getPrimaryReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Dev Primary Screen Cost    |      " + sc.getScreeningPrimaryDevReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Dev Primary Agg Cost     |      " + sc.getDevAggregationCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Dev Primary Final Rev Cost  |      " + sc.getDevFinalReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("     Dev Core Review Cost    |      " + sc.getDevCoreReviewCost());
            } else if (sc.phaseId == DESIGN_PHASE) {
                System.out.println("      Design Cost            |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("       Design DR             |      " + sc.getDR());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Total Design Compensation  |      " + sc.getCompetitorCompensation());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Design Review Cost       |      " + sc.getReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Design Primary Review Cost: |      " + sc.getPrimaryReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Design Primary Screen Cost |      " + sc.getDesignScreeningCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Design Primary Agg Cost  |      " + sc.getDesignAggregationCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("Design Primary Final Rev Cost|      " + sc.getDesignFinalReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("   Design Core Review Cost   |      " + sc.getCoreDesignReviewCost());
            } else if (sc.phaseId == TESTING_COMPETITIONS) {
                System.out.println("      Testing Cost           |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("       Testing DR            |      " + sc.getDR());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Total Testing Compensation  |      " + sc.getCompetitorCompensation());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("   Testing Review Cost       |      " + sc.getReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Testing Primary Review Cost |      " + sc.getPrimaryReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Testing Primary Screen Cost |      " + sc.getScreeningPrimaryTestingReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("   Testing Primary Agg Cost  |      " + sc.getTestingAggregationCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("Testing Primary Final Rev Cost|      " + sc.getTestingFinalReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("   Testing Core Review Cost  |      " + sc.getTestingCoreReviewCost());
            } else if (sc.phaseId == ASSEMBLY_COMPETITIONS) {
                System.out.println("      Assembly Prize         |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("       Assembly DR           |      " + sc.getDR());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Total Assembly Compensation |      " + sc.getCompetitorCompensation());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Assembly Review Cost     |      " + sc.getReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("Assembly Primary Review Cost |      " + sc.getPrimaryReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("Assembly Primary Screen Cost |      " + sc.getAssemblyScreeningCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Assembly Primary Agg Cost   |      " + sc.getAssemblyAggregationCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Assembly Primary Final Rev Cost  |      " + sc.getAssemblyFinalReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Assembly Core Review Cost  |      " + sc.getAssemblyCoreReviewCost());
            } else if (sc.phaseId == ARCHITECTURE_COMPETITIONS) {
                System.out.println("         Architecture Prize           |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("          Architecture DR             |      " + sc.getDR());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Total Architecture Compensation   |      " + sc.getCompetitorCompensation());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("       Architecture Review Cost       |      " + sc.getReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Architecture Primary Review Cost    |      " + sc.getPrimaryReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Architecture Primary Screen Cost    |      "
                                   + sc.getArchitectureScreeningCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Architecture Primary Agg Cost     |      "
                                   + sc.getArchitectureAggregationCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Architecture Primary Final Rev Cost  |      "
                                   + sc.getArchitectureFinalReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Architecture Core Review Cost     |      "
                                   + sc.getArchitectureCoreReviewCost());
            } else if (sc.phaseId == CONCEPTUALIZATION_COMPETITIONS) {
                System.out.println("         Conceptualization Prize           |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("          Conceptualization DR             |      " + sc.getDR());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Total Conceptualization Compensation   |      "
                                   + sc.getCompetitorCompensation());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("       Conceptualization Review Cost       |      " + sc.getReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Conceptualization Primary Review Cost    |      " + sc.getPrimaryReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Conceptualization Primary Screen Cost    |      "
                                   + sc.getConceptualizationScreeningCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Conceptualization Primary Agg Cost     |      "
                                   + sc.getConceptualizationAggregationCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Conceptualization Primary Final Rev Cost  |      "
                                   + sc.getConceptualizationFinalReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Conceptualization Core Review Cost     |      "
                                   + sc.getConceptualizationCoreReviewCost());
            } else if (sc.phaseId == SPECIFICATION_COMPETITIONS) {
                System.out.println("         Specification Prize           |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("          Specification DR             |      " + sc.getDR());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Total Specification Compensation   |      " + sc.getCompetitorCompensation());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("       Specification Review Cost       |      " + sc.getReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Specification Primary Review Cost    |      " + sc.getPrimaryReviewPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Specification Primary Screen Cost    |      "
                                   + sc.getSpecificationScreeningCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Specification Primary Agg Cost     |      "
                                   + sc.getSpecificationAggregationCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Specification Primary Final Rev Cost  |      "
                                   + sc.getSpecificationFinalReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("    Specification Core Review Cost     |      "
                                   + sc.getSpecificationCoreReviewCost());
            } else {
                System.out.println("INVALID PHASE");
            }
            System.out.println("-------------------------------------------------------------");
        }
    }

    /**
     * <p>Logs the specified message.</p>
     *
     * @param s a <code>String</code> providing the debug message.
     */
    private void debug(String s) {
        //System.out.println(s);
    }

    /**
     * <p>Gets the cost for primary review for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for primary review for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private float getPrimaryAssemblyReviewCost() {
        float screeningCost = getAssemblyScreeningCost();
        float aggregationCost = getAssemblyAggregationCost();
        float finalReviewCost = getAssemblyFinalReviewCost();
        float coreReviewCost = getAssemblyCoreReviewCost();

        debug("Assembly screeningCost  = " + screeningCost);
        debug("Assembly aggregationCost = " + aggregationCost);
        debug("Assembly finalReviewCost = " + finalReviewCost);
        debug("Assembly coreReviewCost = " + coreReviewCost);

        return screeningCost + aggregationCost + finalReviewCost + coreReviewCost;
    }

    /**
     * <p>Gets the cost for primary review for <code>Architecture</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for primary review for <code>Architecture</code> competition.
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private float getPrimaryArchitectureReviewCost() {
        float screeningCost = getArchitectureScreeningCost();
        float aggregationCost = getArchitectureAggregationCost();
        float finalReviewCost = getArchitectureFinalReviewCost();
        float coreReviewCost = getArchitectureCoreReviewCost();

        debug("Architecture screeningCost  = " + screeningCost);
        debug("Architecture aggregationCost = " + aggregationCost);
        debug("Architecture finalReviewCost = " + finalReviewCost);
        debug("Architecture coreReviewCost = " + coreReviewCost);

        return screeningCost + aggregationCost + finalReviewCost + coreReviewCost;
    }

    /**
     * <p>Gets the cost for primary review for <code>Conceptualization</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for primary review for <code>Conceptualization</code>
     *         competition.
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private float getPrimaryConceptualizationReviewCost() {
        float screeningCost = getConceptualizationScreeningCost();
        float aggregationCost = getConceptualizationAggregationCost();
        float finalReviewCost = getConceptualizationFinalReviewCost();
        float coreReviewCost = getConceptualizationCoreReviewCost();

        debug("Conceptualization screeningCost  = " + screeningCost);
        debug("Conceptualization aggregationCost = " + aggregationCost);
        debug("Conceptualization finalReviewCost = " + finalReviewCost);
        debug("Conceptualization coreReviewCost = " + coreReviewCost);

        return screeningCost + aggregationCost + finalReviewCost + coreReviewCost;
    }

    /**
     * <p>Gets the cost for primary review for <code>Specification</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for primary review for <code>Specification</code>
     *         competition.
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private float getPrimarySpecificationReviewCost() {
        float screeningCost = getSpecificationScreeningCost();
        float aggregationCost = getSpecificationAggregationCost();
        float finalReviewCost = getSpecificationFinalReviewCost();
        float coreReviewCost = getSpecificationCoreReviewCost();

        debug("Specification screeningCost  = " + screeningCost);
        debug("Specification aggregationCost = " + aggregationCost);
        debug("Specification finalReviewCost = " + finalReviewCost);
        debug("Specification coreReviewCost = " + coreReviewCost);

        return screeningCost + aggregationCost + finalReviewCost + coreReviewCost;
    }

    /**
     * <p>Gets the cost for review for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private float getAssemblyReviewCost() {
        return getAssemblyCoreReviewCost();
    }

    /**
     * <p>Gets the cost for review for <code>Architecture</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review for <code>Architecture</code> competition.
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private float getArchitectureReviewCost() {
        return getArchitectureCoreReviewCost();
    }

    /**
     * <p>Gets the cost for review for <code>Conceptualization</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review for <code>Conceptualization</code> competition.
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private float getConceptualizationReviewCost() {
        return getConceptualizationCoreReviewCost();
    }

    /**
     * <p>Gets the cost for review for <code>Specification</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review for <code>Specification</code> competition.
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private float getSpecificationReviewCost() {
        return getSpecificationCoreReviewCost();
    }

    /**
     * <p>Gets the cost for review aggregation for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review aggregation for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private float getAssemblyAggregationCost() {
        return 0.04f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for review aggregation for <code>Architecture</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review aggregation for <code>Architecture</code> competition.
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private float getArchitectureAggregationCost() {
        return 0.04f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for review aggregation for <code>Conceptualization</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review aggregation for <code>Conceptualization</code>
     *         competition.
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private float getConceptualizationAggregationCost() {
        return 0.04f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for review aggregation for <code>Specification</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review aggregation for <code>Specification</code>
     *         competition.
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private float getSpecificationAggregationCost() {
        return 0.04f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for screening review for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     * [scamp] changed .86 modifier to 0.70
     */
    private float getAssemblyScreeningCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionCount - 1)) * 0.10f;
    }

    /**
     * <p>Gets the cost for screening review for <code>Architecture</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Architecture</code> competition.
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private float getArchitectureScreeningCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionCount - 1)) * 0.10f;
    }

    /**
     * <p>Gets the cost for screening review for <code>Conceptualization</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Conceptualization</code>
     *         competition.
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private float getConceptualizationScreeningCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionCount - 1)) * 0.10f;
    }

    /**
     * <p>Gets the cost for screening review for <code>Specification</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Specification</code>
     *         competition.
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private float getSpecificationScreeningCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionCount - 1)) * 0.10f;
    }

    /**
     * <p>Gets the cost for screening review for <code>Testing</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Testing</code>
     *         competition.
     * @since TCS Release 2.2.2 (TCS-74)
     */
    private float getTestingScreeningCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionCount - 1)) * 0.10f;
    }

    /**
     * <p>Gets the cost for final review for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for final review for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private float getAssemblyFinalReviewCost() {
        return 0.10f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for final review for <code>Architecture</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for final review for <code>Architecture</code> competition.
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private float getArchitectureFinalReviewCost() {
        return 0.10f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for final review for <code>Conceptualization</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for final review for <code>Conceptualization</code> competition.
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private float getConceptualizationFinalReviewCost() {
        return 0.10f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for final review for <code>Specification</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for final review for <code>Specification</code> competition.
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private float getSpecificationFinalReviewCost() {
        return 0.10f * getInitialPurse();
    }

    /**
     * <p>Gets the cost for core review for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for core review for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     * [scamp] changed .86 modifier to 0.70
     */
    private float getAssemblyCoreReviewCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionsPassedScreening - 1)) * 0.9f / 3.0f;
    }

    /**
     * <p>Gets the cost for core review for <code>Architecture</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for core review for <code>Architecture</code> competition.
     * @since TCS Release 2.2.1 (TCS-57)
     */
    private float getArchitectureCoreReviewCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionsPassedScreening - 1)) * 0.9f / 3.0f;
    }

    /**
     * <p>Gets the cost for core review for <code>Conceptualization</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for core review for <code>Conceptualization</code> competition.
     * @since TCS Release 2.2.2 (TCS-63)
     */
    private float getConceptualizationCoreReviewCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionsPassedScreening - 1)) * 0.9f / 3.0f;
    }

    /**
     * <p>Gets the cost for core review for <code>Specification</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for core review for <code>Specification</code> competition.
     * @since TCS Release 2.2.2 (TCS-60)
     */
    private float getSpecificationCoreReviewCost() {
        return (0.70f * getInitialPurse() + getIncrementPurse() * (this.submissionsPassedScreening - 1)) * 0.9f / 3.0f;
    }
}
