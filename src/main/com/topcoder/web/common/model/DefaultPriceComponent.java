/*
 * Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
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
 *   Version 1.0.6 (TCS Release 2.2.2) Change notes:
 *   <ol>
 *     <li>
 *          Added methods that calculate review payments for Conceptualization, Specification and
 *          Application Testing competitions.
 *     </li>
 *   </ol>
 *
 *   Version 1.1.0 Change notes:
 *   <ol>
 *     <li>
 *          Refactored the review payments system to better support all competition types.  Changed application
 *          review payment formulas.
 *     </li>
 *   </ol>
 *
 *   Version 1.1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites.</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 *
 *   Version 1.1.3 (Specification Review Integration 1.0) Change notes:
 *   <ol>
 *     <li>Added support for Specification Review projects.</li>
 *   </ol>
 *
 *   Version 1.1.4 Change notes:
 *   <ol>
 *     <li>Added support for Post-Mortem review payment.</li>
 *   </ol>
 *
 *   Version 1.1.5 Change notes:
 *   <ol>
 *     <li>Added support for specification review payment.</li>
 *   </ol>
 *
 *   Version 1.1.6 (Copilot Selection Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Added support for Copilot Posting.</li>
 *   </ol>
 *
 *   Version 1.1.7 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #getReviewerPaymentCalculator(float, int, int)} method for supporting spec review payment of
 *     content creation contests.</li>
 *     <li>Updated {@link #getSpecReviewCost()} method for setting spec review payment for content creation contests.
 *     </li>
 *     <li>Updated {@link #main(String[])} method for printing help message for content creation contests.</li>
 *   </ol>
 *   
 *   Version 1.1.8 (Online Review Replatforming Release 2) Change notes:
 *   <ol>
 *     <li>Updated {@link #getReviewerPaymentCalculator(float, int, int)} method for supporting the studio contests.</li>
 *     <li>Added {@link #getMilestoneScreeningCost()} to calculate payment for the milestone screener.</li>
 *     <li>Updated {@link #getSpecReviewCost()} method for setting spec review payment for studio contests.</li>
 *   </ol>
 * </p>
 *
 * @author dok, ivern, isv, pulky, snow01, VolodymyrK, FireIce, flexme
 * @version 1.1.8
 */

public class DefaultPriceComponent implements SoftwareComponent {

    private static final float REGULAR_POST_MORTEM_REVIEW_COST = 10f;

    /**
     * <p>A <code>Log</code> to be used for logging the events encountered while calculating the prices.</p>
     */
    private static Logger log = Logger.getLogger(DefaultPriceComponent.class);

    /**
     * <p>An <code>int</code> referencing the current phase for the project.</p>
     */
    protected int phaseId;

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
     * <p>An instance of <code>ReviewerPaymentCalculator</code> initialized for the competition we're
     * processing.</p>
     */
    private ReviewerPaymentCalculator calculator;

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
     * @param levelId an <code>int</code> referencing the difficulty level for the project (currently ignored).
     * @param submissionCount an <code>int</code> providing the number of submissions for the project.
     * @param submissionsPassedScreening an <code>int</code> providing the number of submissions for the project which
     *        passed screening.
     * @param phaseId an <code>int</code> referencing the current phase for the project.
     */
    @Deprecated
    public DefaultPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId) {
        log.debug("level: " + levelId + " submissionCount: " + submissionCount + " submissionPassedScreening: " +
                  submissionsPassedScreening + " phaseId: " + phaseId);

        this.phaseId = phaseId;
        this.submissionCount = submissionCount;
        this.submissionsPassedScreening = submissionsPassedScreening;
        // TODO: Eliminate this hardcoded "default" prize.
        this.calculator = getReviewerPaymentCalculator(750, submissionCount, submissionsPassedScreening);
    }

    /**
     * <p>Constructs new <code>DefaultPriceComponent</code> instance to be used for calculating the prices for project
     * with specified parameters.</p>
     *
     * @param levelId an <code>int</code> referencing the difficulty level for the project (currently ignored).
     * @param submissionCount an <code>int</code> providing the number of submissions for the project.
     * @param submissionsPassedScreening an <code>int</code> providing the number of submissions for the project which
     *        passed screening.
     * @param phaseId an <code>int</code> referencing the current phase for the project.
     * @param prize a <code>float</code> providing the prized for the project.
     * @param drPoints a <code>float</code> providing the amount of <code>DR</code> points for project (currently ignored).
     */
    public DefaultPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId,
                                 float prize, float drPoints) {
        log.debug("level: " + levelId + " submissionCount: " + submissionCount + " submissionPassedScreening: " +
                  submissionsPassedScreening + " phaseId: " + phaseId + " prize: " + prize + " drPoints: " + drPoints);

        this.phaseId = phaseId;
        this.prize = prize;
        this.submissionCount = submissionCount;
        this.submissionsPassedScreening = submissionsPassedScreening;
        this.calculator = getReviewerPaymentCalculator(prize, submissionCount, submissionsPassedScreening);
    }

    /**
     * <p>Creates a clone copy of this price component.</p>
     *
     * @return a clone copy of this price component.
     * @throws OutOfMemoryError if memory heap is exhausted.
     */
    public Object clone() throws OutOfMemoryError {
        return new DefaultPriceComponent(1, this.submissionCount, this.submissionsPassedScreening,
                                         this.phaseId, this.prize, 0);
    }

    /**
     * <p>Factory method that returns the correct instance of ReviewerPaymentCalculator for a given phase.</p>
     *
     * Updated for Specification Review Integration 1.0
     *		- Added specification review calculator.
     *
     * @param prize first place prize for the competition.
     * @param submissionCount number of submissions.
     * @param submissionsPassedScreening number of submissions that passed screening.
     * @return the correct <code>ReviewerPaymentCalculator</code> instance for the competition phase, initialized
     *         with the prize, submission count, and submissions that passed screening count.
     * @since 1.1.0
     */
    private ReviewerPaymentCalculator getReviewerPaymentCalculator(float prize, int submissionCount,
                                                                   int submissionsPassedScreening) {
        if (phaseId == DESIGN_PHASE || phaseId == DEV_PHASE) {
            return new ComponentReviewerPaymentCalculator(prize, submissionCount, submissionsPassedScreening);
        } else if (phaseId == ASSEMBLY_PHASE) {
            return new AssemblyReviewerPaymentCalculator(prize, submissionCount, submissionsPassedScreening);
        } else if (phaseId == CONCEPTUALIZATION_PHASE) {
            return new ConceptualizationReviewerPaymentCalculator(prize, submissionCount, submissionsPassedScreening);
        } else if (phaseId == ARCHITECTURE_PHASE) {
            return new ArchitectureReviewerPaymentCalculator(prize, submissionCount, submissionsPassedScreening);
        } else if (phaseId == SPECIFICATION_PHASE || phaseId == TEST_SUITES_PHASE ||
                   phaseId == TEST_SCENARIOS_PHASE || phaseId == COPILOT_POSTING_PHASE || phaseId == CONTENT_CREATION_PHASE) {
            return new ApplicationReviewerPaymentCalculator(prize, submissionCount, submissionsPassedScreening);
        } else if (phaseId == UI_PROTOTYPE_PHASE || phaseId == RIA_BUILD_PHASE ||
                phaseId == RIA_COMPONENT_PHASE) {
            return new StudioReviewerPaymentCalculator(prize, submissionCount, submissionsPassedScreening);
        } else if (phaseId == SPECIFICATION_REVIEW_PHASE ||
                phaseId == DESIGN_SPECIFICATION_PHASE || phaseId == DEVELOPMENT_SPECIFICATION_PHASE ||
                phaseId == CONCEPTUALIZATION_SPECIFICATION_PHASE || phaseId == SPECIFICATION_SPECIFICATION_PHASE ||
                phaseId == ARCHITECTURE_SPECIFICATION_PHASE || phaseId == ASSEMBLY_SPECIFICATION_PHASE ||
                phaseId == TEST_SUITES_SPECIFICATION_PHASE || phaseId == TEST_SCENARIOS_SPECIFICATION_PHASE ||
                phaseId == UI_PROTOTYPE_SPECIFICATION_PHASE || phaseId == RIA_BUILD_SPECIFICATION_PHASE ||
                phaseId == RIA_COMPONENT_SPECIFICATION_PHASE || phaseId == COPILOT_POSTING_SPECIFICATION_PHASE ||
                phaseId == CONTENT_CREATION_SPECIFICATION_PHASE) {
            return new SpecificationReviewerPaymentCalculator(phaseId);
        } else if (phaseId == ICONSETS_PHASE || phaseId == STORYBOARDS_PHASE || phaseId == WIREFRAMES_PHASE ||
                phaseId == LOGOS_PHASE || phaseId == PRINT_PHASE || phaseId == STUDIO_SPECIFICATION_PHASE ||
                phaseId == WIDGET_PHASE || phaseId == FRONTENDFLASH_PHASE || phaseId == APPLICATIONFRONTEND_PHASE ||
                phaseId == OTHER_PHASE){
            return new StudioConstantReviewerPaymentCalculator(prize, submissionCount, submissionsPassedScreening);
        } else {
            throw new IllegalArgumentException("Invalid phaseId (" + phaseId + ")");
        }
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
     * <p>Gets the cost for primary review.</p>
     *
     * @return a <code>float</code> providing the cost for primary review.
     * @since 1.0.1
     */
    public float getPrimaryReviewCost() {
        return Math.round(this.calculator.getScreeningCost() + this.calculator.getReviewCost()
                          + this.calculator.getAggregationCost() + this.calculator.getFinalReviewCost());
    }

    /**
     * <p>Gets the cost for review.</p>
     *
     * @return a <code>float</code> providing the cost for review.
     * @since 1.0.1
     */
    public float getReviewCost() {
        return Math.round(this.calculator.getReviewCost());
    }

    /**
     * <p>Gets the cost for final review.</p>
     *
     * @return a <code>float</code> providing the cost for final review.
     * @since 1.0.1
     */
    public float getFinalReviewCost() {
        float finalReviewCost = Math.round(this.calculator.getFinalReviewCost());

        // Development final reviewers get paid the build payment upfront.
        if (phaseId == DEV_PHASE) {
            finalReviewCost += 15.0f;
        }
        return finalReviewCost;
    }

    /**
     * <p>Gets the cost for aggregation.</p>
     *
     * @return a <code>float</code> providing the cost for aggregation.
     * @since 1.0.1
     */
    public float getAggregationCost() {
        return Math.round(this.calculator.getAggregationCost());
    }

    /**
     * <p>Gets the cost for screening.</p>
     *
     * @return a <code>float</code> providing the cost for screening.
     * @since 1.0.1
     */
    public float getScreeningCost() {
        return Math.round(this.calculator.getScreeningCost());
    }

    /**
     * Calculate the payment cost for milestone screener.
     * 
     * @return the payment cost for milestone screener.
     * @since 1.1.8
     */
    public float getMilestoneScreeningCost() {
        return Math.round(this.calculator.getMilestoneScreeningCost());
    }

    /**
     * <p>Gets the cost for core review.  This is the review without a "ramp-up" cost, and used to represent
     * the payment the primary reviewer got for the Review phase.  Currently, this is unused.</p>
     *
     * @return a <code>float</code> providing the cost for core review.
     * @since 1.0.1
     */
    @Deprecated
    public float getCoreReviewCost() {
        return Math.round(this.calculator.getReviewCost());
    }

    /**
     * <p>Gets the cost for post-mortem review.</p>
     *
     * @return a <code>float</code> providing the cost for post-mortem review.
     * @since 1.1.4
     */
    public float getPostMortemCost() {
        return REGULAR_POST_MORTEM_REVIEW_COST;
    }

    /**
     * <p>Gets the cost for specification review.</p>
     *
     * @return a <code>float</code> providing the cost for specification review.
     * @since 1.1.5
     */
    public float getSpecReviewCost() {
        switch (phaseId) {
            case DESIGN_PHASE: return 30;
            case DEV_PHASE: return 30;
            case ARCHITECTURE_PHASE: return 50;
            case ASSEMBLY_PHASE: return 100;
            case CONCEPTUALIZATION_PHASE: return 30;
            case SPECIFICATION_PHASE: return 40;
            case TEST_SUITES_PHASE: return 50;
            case TEST_SCENARIOS_PHASE: return 50;
            case UI_PROTOTYPE_PHASE: return 50;
            case RIA_BUILD_PHASE: return 50;
            case RIA_COMPONENT_PHASE: return 50;
            case COPILOT_POSTING_PHASE: return 50;
            case CONTENT_CREATION_PHASE: return 50;
            case ICONSETS_PHASE : return 75;
            case STORYBOARDS_PHASE : return 75;
            case WIREFRAMES_PHASE : return 75;
            case LOGOS_PHASE : return 75;
            case PRINT_PHASE : return 75;
            case STUDIO_SPECIFICATION_PHASE : return 75;
            case WIDGET_PHASE : return 75;
            case FRONTENDFLASH_PHASE : return 75;
            case APPLICATIONFRONTEND_PHASE : return 75;
            case OTHER_PHASE : return 75;
            default: return 50;
        }
    }

    /**
     * <p>Gets the project phase.</p>
     *
     * @return an <code>int</code> referencing the current project phase.
     */
    public int getPhaseId() {
        return phaseId;
    }

    /**
     * <p>A command line interface to be used for calculating the prices for the projects with parameters passed as
     * command line arguments.</p>
     *
     * Updated for Specification Review Integration 1.0
     *
     * @param args a <code>String</code> array providing the command line arguments.
     */
    public static void main(String[] args) {
        if (args.length != 4) {
            System.out.println("usage: java " + SoftwareComponent.class.toString() + " " +
                    "<numSubmissions> <numSubmissionPassScreening> <phaseId> <prize>");
            System.out.println("Component Design phaseId                : " + DEV_PHASE);
            System.out.println("Component Development phaseId           : " + DESIGN_PHASE);
            System.out.println("Conceptualization phaseId               : " + CONCEPTUALIZATION_PHASE);
            System.out.println("Specification phaseId                   : " + SPECIFICATION_PHASE);
            System.out.println("Architecture phaseId                    : " + ARCHITECTURE_PHASE);
            System.out.println("Assembly phaseId                        : " + ASSEMBLY_PHASE);
            System.out.println("Test Suites phaseId                     : " + TEST_SUITES_PHASE);
            System.out.println("Test Scenarios phaseId                  : " + TEST_SCENARIOS_PHASE);
            System.out.println("UI Prototype phaseId                    : " + UI_PROTOTYPE_PHASE);
            System.out.println("RIA Build phaseId                       : " + RIA_BUILD_PHASE);
            System.out.println("RIA Component phaseId                   : " + RIA_COMPONENT_PHASE);
            System.out.println("Copilot Posting phaseId                 : " + COPILOT_POSTING_PHASE);
            System.out.println("Content Creation phaseId                : " + CONTENT_CREATION_PHASE);
            System.out.println("Specification Review phaseId            : " + SPECIFICATION_REVIEW_PHASE);
            System.out.println("Design Specification phaseId            : " + DESIGN_SPECIFICATION_PHASE);
            System.out.println("Development Specification phaseId       : " + DEVELOPMENT_SPECIFICATION_PHASE);
            System.out.println("Conceptualization Specification phaseId : " + CONCEPTUALIZATION_SPECIFICATION_PHASE);
            System.out.println("Specification Specification phaseId     : " + SPECIFICATION_SPECIFICATION_PHASE);
            System.out.println("Architecture Specification phaseId      : " + ARCHITECTURE_SPECIFICATION_PHASE);
            System.out.println("Test Suites Specification phaseId       : " + TEST_SUITES_SPECIFICATION_PHASE);
            System.out.println("Test Scenarios Specification phaseId    : " + TEST_SCENARIOS_SPECIFICATION_PHASE);
            System.out.println("UI Prototype Specification phaseId      : " + UI_PROTOTYPE_SPECIFICATION_PHASE);
            System.out.println("RIA Build Specification phaseId         : " + RIA_BUILD_SPECIFICATION_PHASE);
            System.out.println("RIA Component Specification phaseId     : " + RIA_COMPONENT_SPECIFICATION_PHASE);
            System.out.println("Copilot Posting Specification phaseId   : " + COPILOT_POSTING_SPECIFICATION_PHASE);
            System.out.println("Content Creation Specification phaseId   : " + CONTENT_CREATION_SPECIFICATION_PHASE);
        } else {
            DefaultPriceComponent sc = new DefaultPriceComponent(1, Integer.parseInt(args[0]),
                                                                 Integer.parseInt(args[1]), Integer.parseInt(args[2]),
                                                                 Float.parseFloat(args[3]), 0);

            System.out.println("---------------------------------------------------------");
            System.out.println("         Prize           |      " + sc.getPrice());
            System.out.println("-------------------------+-------------------------------");
            System.out.println("      Review Cost        |      " + sc.getReviewCost());
            System.out.println("-------------------------+-------------------------------");
            System.out.println("   Primary Review Cost   |      " + sc.getPrimaryReviewCost());
            System.out.println("-------------------------+-------------------------------");
            System.out.println("   Primary Screen Cost   |      " + sc.getScreeningCost());
            System.out.println("-------------------------+-------------------------------");
            System.out.println("    Primary Agg Cost     |      " + sc.getAggregationCost());
            System.out.println("-------------------------+-------------------------------");
            System.out.println("  Primary Final Rev Cost |      " + sc.getFinalReviewCost());
            System.out.println("-------------------------+-------------------------------");
            System.out.println("    Core Review Cost     |      " + sc.getCoreReviewCost());
            System.out.println("---------------------------------------------------------");
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
}
