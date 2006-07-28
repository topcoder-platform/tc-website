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
    protected FixedPriceComponent() {
    }

    /**
     * Constructor compatible with DefaultPriceComponent
     */
    public FixedPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId,
           float primaryFixedPayment, float secondaryFixedPayment)  {
        super(levelId, submissionCount, submissionsPassedScreening, phaseId);

        setPrimaryFixedPayment(primaryFixedPayment);
        setSecondaryFixedPayment(secondaryFixedPayment);

        log.debug("level: " + levelId + " submissionCount: " + submissionCount + " submissionPassedScreening: " +
                submissionsPassedScreening + " phaseId: " + phaseId + " primaryFixedPayment: " + primaryFixedPayment + " secondaryFixedPayment: " + secondaryFixedPayment);
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
     *
     * Delegates to super and adjusts with the primary adjustment factor calculated using the fixed amounts.
     *
     * @return resized Aggregation cost.
     * @see DefaultPriceComponent
     */
    public float getAggregationCost() {
        return Math.round(super.getAggregationCost() * primaryAdjustmentFactor);
    }

    /**
     * Gets Screening Cost
     *
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
     *
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
     *
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
     *
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
     *
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
            float primaryFixedPayment, float secondaryFixedPayment) {

        FixedPriceComponent fpc = new FixedPriceComponent(LEVEL1,
                submissionCount, submissionsPassedScreening,
                phaseId, primaryFixedPayment, secondaryFixedPayment);

        DefaultPriceComponent dpc = new DefaultPriceComponent(LEVEL1,
                submissionCount,
                submissionsPassedScreening,
                phaseId);

        System.out.println("submissionCount: " + submissionCount + " submissionPassedScreening: " +
                submissionsPassedScreening + " phaseId: " + phaseId + " primaryFixedPayment: " + primaryFixedPayment + " secondaryFixedPayment: " + secondaryFixedPayment);

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
        if (args.length != 5) {
            System.out.println("usage: java " + FixedPriceComponent.class.toString() + " " +
                    "<numSubmissions> <numSubmissionPassScreening> <phaseId> " +
                    "<primaryFixedPayment> <secondaryFixedPayment>");
            System.out.println("dev phaseId " + DEV_PHASE);
            System.out.println("design phaseId " + DESIGN_PHASE);
        } else {

            showPayments(Integer.parseInt(args[0]), Integer.parseInt(args[1]), Integer.parseInt(args[2]),
                    Float.parseFloat(args[3]), Float.parseFloat(args[4]));
        }
    }
}
