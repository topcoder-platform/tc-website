/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.common.model;

import com.topcoder.shared.util.logging.Logger;

/**
 * <strong>Purpose</strong>:
 * Calculates and resizes Reviewers tasks costs
 *
 * @author pulky
 * @version 1.0.0
 */
public class FixedPriceComponent extends DefaultPriceComponent {
    private static Logger log = Logger.getLogger(DefaultPriceComponent.class);

    private float primaryFixedPayment = 0;

    private float secondaryFixedPayment = 0;

    private float primaryAdjustmentFactor = 0;

    protected FixedPriceComponent() {
    }

    public FixedPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId)  {
        super(levelId, submissionCount, submissionsPassedScreening, phaseId);

        log.debug("level: " + level + " submissionCount: " + submissionCount + " submissionPassedScreening: " +
                submissionsPassedScreening + " phaseId: " + phaseId);
    }

    public FixedPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId,
           float primaryFixedPayment, float secondaryFixedPayment)  {
        super(levelId, submissionCount, submissionsPassedScreening, phaseId);

        setPrimaryFixedPayment(primaryFixedPayment);
        setSecondaryFixedPayment(secondaryFixedPayment);

        log.debug("level: " + level + " submissionCount: " + submissionCount + " submissionPassedScreening: " +
                submissionsPassedScreening + " phaseId: " + phaseId + " primaryFixedPayment: " + primaryFixedPayment + " secondaryFixedPayment: " + secondaryFixedPayment);
    }

    public float getReviewPrice() {
        return Math.round(secondaryFixedPayment);
    }

    public float getAggregationCost() {
        return Math.round(super.getAggregationCost() * primaryAdjustmentFactor);
    }

    public float getScreeningCost() {
        return Math.round(super.getScreeningCost() * primaryAdjustmentFactor);
    }

    public float getFinalReviewCost() {
        return Math.round(super.getFinalReviewCost() * primaryAdjustmentFactor);
    }

    public float getCoreReviewCost() {
        return Math.round(super.getCoreReviewCost() * primaryAdjustmentFactor);
    }

    public float getPrimaryReviewPrice() {
        return Math.round(primaryFixedPayment > 0 ? primaryFixedPayment : super.getPrimaryReviewPrice());
    }

    private void setPrimaryFixedPayment(float amount) {
        this.primaryFixedPayment = amount;

        float oldTotal = super.getAggregationCost();
        oldTotal += super.getScreeningCost();
        oldTotal += super.getFinalReviewCost();
        oldTotal += super.getCoreReviewCost();

        this.primaryAdjustmentFactor = amount / oldTotal;
    }

    private void setSecondaryFixedPayment(float amount) {
        this.secondaryFixedPayment = amount;
    }

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
