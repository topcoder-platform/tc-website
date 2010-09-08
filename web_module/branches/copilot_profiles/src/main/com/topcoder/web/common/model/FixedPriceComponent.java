/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;

/**
 * <strong>Purpose</strong>:
 * Calculates and resizes Reviewers tasks costs based on default values
 * adjusted with fixed values.
 *
 * @author pulky
 * @version 1.0.0
 */
public class FixedPriceComponent extends DefaultPriceComponent {
    /**
     * The logger to log to.
     */
    private static Logger log = Logger.getLogger(FixedPriceComponent.class);

    /**
     * Stores the primary fixed payment used to resize primary payments.
     */
    private float primaryFixedPayment = 0;

    /**
     * Stores the secondary fixed payment used to resize secondary payments.
     */
    private float secondaryFixedPayment = 0;

    /**
     * Stores the adjustment factor for primary payments.
     */
    private float primaryAdjustmentFactor = 1;

    /**
     * Default constructor
     */
    public FixedPriceComponent() {
    }

    /**
     * Constructor compatible with DefaultPriceComponent
     */
    @Deprecated
    public FixedPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId,
                               float primaryFixedPayment, float secondaryFixedPayment) {
        super(levelId, submissionCount, submissionsPassedScreening, phaseId);

        setPrimaryFixedPayment(primaryFixedPayment);
        setSecondaryFixedPayment(secondaryFixedPayment);

        log.debug("level: " + levelId + " submissionCount: " + submissionCount + " submissionPassedScreening: "
                  + submissionsPassedScreening + " phaseId: " + phaseId + " primaryFixedPayment: "
                  + primaryFixedPayment + " secondaryFixedPayment: " + secondaryFixedPayment);
    }

    /**
     * Constructor compatible with DefaultPriceComponent
     */
    public FixedPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId,
                               float primaryFixedPayment, float secondaryFixedPayment, float prize, float drPoints) {
        super(levelId, submissionCount, submissionsPassedScreening, phaseId, prize, drPoints);

        setPrimaryFixedPayment(primaryFixedPayment);
        setSecondaryFixedPayment(secondaryFixedPayment);

        log.debug("level: " + levelId + " submissionCount: " + submissionCount
                  + " submissionPassedScreening: " + submissionsPassedScreening
                  + " phaseId: " + phaseId + " primaryFixedPayment: " + primaryFixedPayment
                  + " secondaryFixedPayment: " + secondaryFixedPayment
                  + " prize: " + prize + " drPoints: " + drPoints);
    }

    /**
     * Gets Review Price
     *
     * @return The fixed value if exists or delegates to super.
     * @see DefaultPriceComponent
     */
    public float getReviewPrice() {
        return Math.round(secondaryFixedPayment > 0 ? secondaryFixedPayment : super.getReviewPrice());
    }

    /**
     * Gets Aggregation Cost
     * <p/>
     * Delegates to super and adjusts with the primary adjustment factor calculated using the fixed amounts.
     *
     * @return resized Aggregation cost.
     * @see DefaultPriceComponent
     */
    public float getAggregationCost() {
        return Math.round(super.getAggregationCost() * primaryAdjustmentFactor);
    }

    /**
     * Gets Post-Mortem Review Cost
     * <p/>
     * Delegates to super. The value is not multiplied because the post-mortem review payment is always a fixed amount.
     *
     * @return Post-Mortem cost.
     * @see DefaultPriceComponent
     */
    public float getPostMortemCost() {
        return Math.round(super.getPostMortemCost());
    }

    /**
     * Gets Screening Cost
     * <p/>
     * Delegates to super and adjusts with the primary adjustment factor calculated using the fixed amounts.
     *
     * @return resized Screening cost.
     * @see DefaultPriceComponent
     */
    public float getScreeningCost() {
        return Math.round(super.getScreeningCost() * primaryAdjustmentFactor);
    }

    /**
     * Gets Final Review Cost
     * <p/>
     * Delegates to super and adjusts with the primary adjustment factor calculated using the fixed amounts.
     *
     * @return resized Final Review cost.
     * @see DefaultPriceComponent
     */
    public float getFinalReviewCost() {
        return Math.round(super.getFinalReviewCost() * primaryAdjustmentFactor);
    }

    /**
     * Gets Core Review Cost
     * <p/>
     * Delegates to super and adjusts with the primary adjustment factor calculated using the fixed amounts.
     *
     * @return resized Core Review cost.
     * @see DefaultPriceComponent
     */
    public float getCoreReviewCost() {
        return Math.round(super.getCoreReviewCost() * primaryAdjustmentFactor);
    }

    /**
     * Gets Primary Review Cost
     * <p/>
     * Delegates to super and adjusts with the primary adjustment factor calculated using the fixed amounts.
     *
     * @return resized Primary Review cost.
     * @see DefaultPriceComponent
     */
    public float getPrimaryReviewPrice() {
        return Math.round(primaryFixedPayment > 0 ? primaryFixedPayment : super.getPrimaryReviewPrice());
    }

    /**
     * Setter for Primary payment fixed amount
     * <p/>
     * Also calculates the adjustmente factor.
     *
     * @param amount The primary payment fixed amount
     */
    private void setPrimaryFixedPayment(float amount) {
        this.primaryFixedPayment = amount;

        float oldTotal = super.getAggregationCost();
        oldTotal += super.getScreeningCost();
        oldTotal += super.getFinalReviewCost();
        oldTotal += super.getCoreReviewCost();

        this.primaryAdjustmentFactor = amount > 0 ? (amount / oldTotal) : 1;
    }

    /**
     * Setter for Secondary payment fixed amount
     *
     * @param amount The Secondary payment fixed amount
     */
    private void setSecondaryFixedPayment(float amount) {
        this.secondaryFixedPayment = amount;
    }

    /**
     * Command line utility
     */
    private static void showPayments(int submissionCount, int submissionsPassedScreening, int phaseId,
                                     float primaryFixedPayment, float secondaryFixedPayment,
                                     float prize, float drPoints) {

        FixedPriceComponent fpc = new FixedPriceComponent(LEVEL1, submissionCount, submissionsPassedScreening,
                                                          phaseId, primaryFixedPayment, secondaryFixedPayment,
                                                          prize, drPoints);

        DefaultPriceComponent dpc = new DefaultPriceComponent(LEVEL1, submissionCount, submissionsPassedScreening,
                                                              phaseId, prize, drPoints);

        System.out.println("submissionCount: " + submissionCount
                           + " submissionPassedScreening: " + submissionsPassedScreening
                           + " phaseId: " + phaseId
                           + " primaryFixedPayment: " + primaryFixedPayment
                           + " secondaryFixedPayment: " + secondaryFixedPayment
                           + " prize: " + prize
                           + " drPoints: " + drPoints);

        System.out.println("Item ; Old ; new:");
        System.out.println("Aggregation ; " + dpc.getAggregationCost() + " ; " + fpc.getAggregationCost());
        System.out.println("Screening ; " + dpc.getScreeningCost() + " ; " + fpc.getScreeningCost());
        System.out.println("Final review ; " + dpc.getFinalReviewCost() + " ; " + fpc.getFinalReviewCost());
        System.out.println("review primary ; " + dpc.getCoreReviewCost() + " ; " + fpc.getCoreReviewCost());
        System.out.println("review secondary ; " + dpc.getReviewPrice() + " ; " + fpc.getReviewPrice());

        System.out.println("------------------------------------------------------------");
    }

    /**
     * Command line utility
     */
    public static void main(String[] args) {
        if (args.length != 7) {
            System.out.println("usage: java " + FixedPriceComponent.class.toString() + " " +
                    "<numSubmissions> <numSubmissionPassScreening> <phaseId> " +
                    "<primaryFixedPayment> <secondaryFixedPayment> <prize> <dr_points>");
            System.out.println("dev phaseId " + DEV_PHASE);
            System.out.println("design phaseId " + DESIGN_PHASE);
        } else {

            showPayments(Integer.parseInt(args[0]), Integer.parseInt(args[1]), Integer.parseInt(args[2]),
                         Float.parseFloat(args[3]), Float.parseFloat(args[4]),
                         Float.parseFloat(args[5]), Float.parseFloat(args[6]));
        }
    }
}
