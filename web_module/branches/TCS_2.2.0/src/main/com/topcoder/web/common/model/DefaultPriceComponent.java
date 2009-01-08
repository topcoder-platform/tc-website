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
 * @author dok, pulky, ivern, TCSDEVELOPER
 * @version 1.0.4
 */
public class DefaultPriceComponent implements SoftwareComponent {

    // This is a hack to add component testing review registration
    // all this should change to project categories ids
    private static final int COMPONENT_TESTING = 116;

    /**
     * <p>A <code>int</code> referencing the fictive phase type corresponding to <code>Assembly</code> competitions.</p>
     *
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private static final int ASSEMBLY_COMPETITIONS = 125;

    private static Logger log = Logger.getLogger(DefaultPriceComponent.class);

    private final static float[] DESIGN_PRICE_LOOKUP = {0f, 540f, 540f};
    private final static float[] DEV_PRICE_LOOKUP = {0f, 450f, 450f};

    /**
     * <p>A <code>float</code> array listing the prices for <code>Assembly</code> competitions per competition level.
     * </p>
     *
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private final static float[] ASSEMBLY_PRICE_LOOKUP = DEV_PRICE_LOOKUP;
    
    private final static float[] TESTING_PRICE_LOOKUP = {0f, 200f, 200f};

    private final static float[] DESIGN_DR_LOOKUP = {0f, 540f, 540f};

    private final static float[] DEV_DR_LOOKUP = {0f, 450f, 450f};

    /**
     * <p>A <code>float</code> array listing the DR points for <code>Assembly</code> competitions per competition level.
     * </p>
     *
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private final static float[] ASSEMBLY_DR_LOOKUP = DEV_DR_LOOKUP;

    private final static float DEV_REVIEW_RATE = 24f;

    /**
     * <p>A <code>float</code> providing the review rate for <code>Assembly</code> competitions.</p>
     *
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private final static float ASSEMBLY_REVIEW_RATE = DEV_REVIEW_RATE;

    private final static float DESIGN_REVIEW_RATE = 23f;
    private final static float TESTING_REVIEW_RATE = 22f;

    protected int phaseId;
    protected int level;

    private int submissionCount;
    private int submissionsPassedScreening;

    private float prize;
    private float drPoints;
    private float compensationRatio;

    @Deprecated
    public DefaultPriceComponent() {
    }

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
        } else {
            this.prize = DEV_PRICE_LOOKUP[level];
            this.drPoints = DEV_DR_LOOKUP[level];
        }

        this.compensationRatio = 1.0f;
    }

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
                                      / calculateCompensation(DESIGN_PRICE_LOOKUP[level], DESIGN_DR_LOOKUP[level]));
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(ASSEMBLY_PRICE_LOOKUP[level], ASSEMBLY_DR_LOOKUP[level]));
        } else {
            this.compensationRatio = (calculateCompensation(prize, drPoints)
                                      / calculateCompensation(DEV_PRICE_LOOKUP[level], DEV_DR_LOOKUP[level]));
        }
    }

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

    public float getPrice() {
        return this.prize;
    }

    public float getDR() {
        return this.drPoints;
    }

    // Returns the total prize purse counting the first and second place prizes.
    public float getPrizePurse() {
        return this.prize * 1.5f;
    }

    public float getInitialPurse() {
        return 0.40f * getPrizePurse();
    }

    public float getIncrementPurse() {
        return 0.15f * getPrizePurse();
    }

    public float getCompetitorCompensation() {
        return calculateCompensation(this.prize, this.drPoints);
    }

    public float getDesignReviewRate() {
        return DESIGN_REVIEW_RATE * this.compensationRatio;
    }

    public float getDevReviewRate() {
        return DEV_REVIEW_RATE * this.compensationRatio;
    }

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

    public float getPrimaryReviewPrice() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getPrimaryDevReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getPrimaryDesignReviewCost();
        } else if (phaseId == COMPONENT_TESTING) {
            ret = getPrimaryTestingReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getPrimaryAssemblyReviewCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    public float getReviewPrice() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getDevReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getDesignReviewCost();
        } else if (phaseId == COMPONENT_TESTING) {
            ret = getTestingReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyReviewCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * Return the total payment for the primary development reviewer
     *
     * @return
     */
    private float getPrimaryDevReviewCost() {
        debug("screeningCost " + getScreeningPrimaryDevReviewCost());
        debug("aggregationCost " + getDevAggregationCost());
        debug("finalReviewCost " + getDevFinalReviewCost());
        return getScreeningPrimaryDevReviewCost() + getDevAggregationCost() +
                getDevFinalReviewCost() + getDevCoreReviewCost();
    }

    private float getScreeningPrimaryDevReviewCost() {
        //float screeningSetupCost = 1.0f * getDevReviewRate(); // 60 minutes to set up
        //float screeningCost = (1f / 2f) * (float) submissionCount * getDevReviewRate();  //30 minutes per submission
        return (0.86f * getInitialPurse() + getIncrementPurse() * (submissionCount - 1)) * 0.10f;
    }

    private float getDevAggregationCost() {
        //float aggregationCost = (1f / 2f) * getDevReviewRate();  //30 minutes to aggregate
        return 0.04f * getInitialPurse();
    }

    private float getDevFinalReviewCost() {
        //float finalReviewCost = 2f * getDevReviewRate();  //120 minutes to do final review
        return 0.10f * getInitialPurse();
    }

    /**
     * Return the review cost for a primary reviewer.
     *
     * @return
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
     * Return the total payment for a development reviewer
     *
     * @return
     */
    private float getDevReviewCost() {
        //float aggregationReviewCost = (1f / 2f) * getDevReviewRate(); //30 minutes for aggregation review
        //debug("aggregationCost " + aggregationReviewCost);
        //return aggregationReviewCost + getDevCoreReviewCost();
        return getDevCoreReviewCost();
    }

    private float getPrimaryTestingReviewCost() {
        debug("screeningCost " + getScreeningPrimaryTestingReviewCost());
        debug("aggregationCost " + getTestingAggregationCost());
        debug("finalReviewCost " + getTestingFinalReviewCost());
        return getScreeningPrimaryTestingReviewCost() + getTestingAggregationCost() +
                getTestingFinalReviewCost() + getTestingCoreReviewCost();
    }

    private float getScreeningPrimaryTestingReviewCost() {
        float screeningCost = 0.2f * (float) submissionCount * getTestingReviewRate();  //12 minutes per submission
        return screeningCost;
    }

    private float getTestingAggregationCost() {
        float aggregationCost = 0.2f * getTestingReviewRate();  //12 minutes to aggregate
        return aggregationCost;
    }

    private float getTestingFinalReviewCost() {
        float finalReviewCost = 0.4f * getTestingReviewRate();  //24 minutes to do final review
        return finalReviewCost;
    }

    /**
     * Return the cost for core review.
     *
     * @return
     */
    private float getTestingCoreReviewCost() {
        float reviewCost = 0.4f * (float) submissionsPassedScreening * getTestingReviewRate(); //24 minutes per review
        float startupCost = 0.2f * getTestingReviewRate(); //12 minutes to "start up"
        debug("reviewCost " + reviewCost);
        debug("startupCost " + startupCost);
        return reviewCost + startupCost;
    }

    /**
     * Return the total payment for a testing reviewer
     *
     * @return
     */
    private float getTestingReviewCost() {
        debug("getTestingCoreReviewCost " + getTestingCoreReviewCost());
        return getTestingCoreReviewCost();
    }

    /**
     * Return the total payment for a design reviewer
     *
     * @return
     */
    private float getDesignReviewCost() {
        //float aggregationReviewCost = (1f / 2f) * getDesignReviewRate(); //30 minutes for aggregation review
        //debug("aggregationReviewCost " + aggregationReviewCost);
        //return aggregationReviewCost + getCoreDesignReviewCost();
        return getCoreDesignReviewCost();
    }

    /**
     * Return the total payment for the primary design reviewer
     *
     * @return
     */
    private float getPrimaryDesignReviewCost() {
        debug("screeningCost " + getDesignScreeningCost());
        debug("aggregationCost " + getDesignAggregationCost());
        debug("finalReviewCost " + getDesignFinalReviewCost());
        return getDesignScreeningCost() + getDesignAggregationCost() +
                getDesignFinalReviewCost() + getCoreDesignReviewCost();
    }

    private float getDesignScreeningCost() {
        //float screeningCost = 0.75f * (float) submissionCount * getDesignReviewRate();  //45 minutes per submission
        //return screeningCost;
        return (0.86f * getInitialPurse() + getIncrementPurse() * (submissionCount - 1)) * 0.10f;
    }

    private float getDesignAggregationCost() {
        //float aggregationCost = (1f / 2f) * getDesignReviewRate();  //30 minutes to aggregate
        //return aggregationCost;
        return 0.04f * getInitialPurse();
    }

    private float getDesignFinalReviewCost() {
        //float finalReviewCost = getDesignReviewRate();  //60 minutes to do final review
        //return finalReviewCost;
        return 0.10f * getInitialPurse();
    }

    /**
     * Return the base design review cost, this is a number that both
     * primary and regular reviewers start with.
     *
     * @return
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
     * Return aggregation task's cost
     *
     * @return The cost of the aggregation task
     * @since 1.0.1
     */
    public float getAggregationCost() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getDevAggregationCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getDesignAggregationCost();
        } else if (phaseId == COMPONENT_TESTING) {
            ret = getTestingAggregationCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyAggregationCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * Return screening task's cost
     *
     * @return The cost of the screening task
     * @since 1.0.1
     */
    public float getScreeningCost() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getScreeningPrimaryDevReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getDesignScreeningCost();
        } else if (phaseId == COMPONENT_TESTING) {
            ret = getScreeningPrimaryTestingReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyScreeningCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * Return final review task's cost
     *
     * @return The cost of the final review task
     * @since 1.0.1
     */
    public float getFinalReviewCost() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getDevFinalReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getDesignFinalReviewCost();
        } else if (phaseId == COMPONENT_TESTING) {
            ret = getTestingFinalReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyFinalReviewCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * Return core review cost
     *
     * @return The cost of the core review
     * @since 1.0.1
     */
    public float getCoreReviewCost() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getDevCoreReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getCoreDesignReviewCost();
        } else if (phaseId == COMPONENT_TESTING) {
            ret = getTestingCoreReviewCost();
        } else if (phaseId == ASSEMBLY_COMPETITIONS) {
            ret = getAssemblyCoreReviewCost();
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    private float calculateCompensation(float prize, float dr) {
        return prize * 1.5f * 1.5f + dr; // Winner + second place + reliability bonuses + DR
    }

    public int getPhaseId() {
        return phaseId;
    }

/*
    public int getLevel() {
        return level;
    }
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
            } else if (sc.phaseId == COMPONENT_TESTING) {
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
            } else {
                System.out.println("INVALID PHASE");
            }
            System.out.println("-------------------------------------------------------------");
        }
    }

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
     * <p>Gets the cost for review for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for review for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private float getAssemblyReviewCost() {
        return getAssemblyCoreReviewCost();
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
     * <p>Gets the cost for screening review for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for screening review for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private float getAssemblyScreeningCost() {
        return (0.86f * getInitialPurse() + getIncrementPurse() * (this.submissionCount - 1)) * 0.10f;
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
     * <p>Gets the cost for core review for <code>Assembly</code> competitions.</p>
     *
     * @return a <code>float</code> providing the cost for core review for <code>Assembly</code> competition.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    private float getAssemblyCoreReviewCost() {
        return (0.86f * getInitialPurse() + getIncrementPurse() * (this.submissionsPassedScreening - 1)) * 0.9f / 3.0f;
    }
}
