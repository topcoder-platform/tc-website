package com.topcoder.web.tc.model;

import com.topcoder.shared.util.logging.Logger;

/**
 * @author dok
 * Date: Apr 8, 2004
 */
public class DefaultPriceComponent implements SoftwareComponent {
    private static Logger log = Logger.getLogger(DefaultPriceComponent.class);

    private final static float[] DESIGN_PRICE_LOOKUP = {0f, 800f, 800f};
    private final static float[] DEV_PRICE_LOOKUP = {0f, 500f, 500f};

    private final static float DEV_REVIEW_RATE = 27f;
    private final static float DESIGN_REVIEW_RATE = 32f;

    protected int phaseId;
    protected int level;

    private int submissionCount;
    private int submissionsPassedScreening;

    protected DefaultPriceComponent() {
    }

    public DefaultPriceComponent(int levelId, int submissionCount, int submissionsPassedScreening, int phaseId) {
        this();
        log.debug("level: " + level + " submissionCount: " + submissionCount + " submissionPassedScreening: " +
                submissionsPassedScreening + " phaseId: " + phaseId);
        this.phaseId = phaseId;
        if (levelId == LEVEL1) {
            this.level = 1;
        } else if (levelId == LEVEL2) {
            this.level = 2;
        } else
            throw new IllegalArgumentException("invalid level provided " + levelId);
        this.submissionCount = submissionCount;
        this.submissionsPassedScreening = submissionsPassedScreening;
    }

    public Object clone() throws OutOfMemoryError {
        DefaultPriceComponent ret = new DefaultPriceComponent();
        ret.phaseId = this.phaseId;
        ret.level = this.level;
        ret.submissionCount = this.submissionCount;
        ret.submissionsPassedScreening = this.submissionsPassedScreening;
        return ret;
    }


    public float getPrice() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = DEV_PRICE_LOOKUP[level];
        } else if (phaseId == DESIGN_PHASE) {
            ret = DESIGN_PRICE_LOOKUP[level];
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }


    public float getPrimaryReviewPrice() {
        float ret = 0.0f;
        if (phaseId == DEV_PHASE) {
            ret = getPrimaryDevReviewCost();
        } else if (phaseId == DESIGN_PHASE) {
            ret = getPrimaryDesignReviewCost();
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
        } else {
            throw new RuntimeException("invalid phaseId " + phaseId);
        }
        return Math.round(ret);
    }

    /**
     * Return the total payment for the primary development reviewer
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
        float screeningSetupCost = 1.0f * DEV_REVIEW_RATE; // 60 minutes to set up
        float screeningCost = (1f / 2f) * (float) submissionCount * DEV_REVIEW_RATE;  //30 minutes per submission
        return screeningSetupCost + screeningCost;
    }

    private float getDevAggregationCost() {
        float aggregationCost = (1f / 2f) * DEV_REVIEW_RATE;  //30 minutes to aggregate
        return aggregationCost;
    }

    private float getDevFinalReviewCost() {
        float finalReviewCost = 2f * DEV_REVIEW_RATE;  //120 minutes to do final review
        return finalReviewCost;
    }

    /**
     * Return the review cost for a primary reviewer.
     * @return
     */
    private float getDevCoreReviewCost() {
        float reviewCost = (float) (level + 1) * (float) submissionsPassedScreening * DEV_REVIEW_RATE;
        float startupCost = DEV_REVIEW_RATE * 2; //120 minutes to "start up"
        float testCaseCost = DEV_REVIEW_RATE * 5; // 5 hours to write test cases
        debug("reviewCost " + reviewCost);
        debug("startupCost " + startupCost);
        debug("testCaseCost " + testCaseCost);
        return reviewCost + startupCost + testCaseCost;
    }

    /**
     * Return the total payment for a development reviewer
     * @return
     */
    private float getDevReviewCost() {
        float aggregationReviewCost = (1f / 2f) * DEV_REVIEW_RATE; //30 minutes for aggregation review
        debug("aggregationCost " + aggregationReviewCost);
        return aggregationReviewCost + getDevCoreReviewCost();
    }

    /**
     * Return the total payment for a design reviewer
     * @return
     */
    private float getDesignReviewCost() {
        float aggregationReviewCost = (1f / 2f) * DESIGN_REVIEW_RATE; //30 minutes for aggregation review
        debug("aggregationReviewCost " + aggregationReviewCost);
        return aggregationReviewCost + getCoreDesignReviewCost();
    }

    /**
     * Return the total payment for the primary design reviewer
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
        float screeningCost = 0.75f * (float) submissionCount * DESIGN_REVIEW_RATE;  //45 minutes per submission
        return screeningCost;
    }

    private float getDesignAggregationCost() {
        float aggregationCost = (1f / 2f) * DESIGN_REVIEW_RATE;  //30 minutes to aggregate
        return aggregationCost;
    }

    private float getDesignFinalReviewCost() {
        float finalReviewCost = DESIGN_REVIEW_RATE;  //60 minutes to do final review
        return finalReviewCost;
    }


    /**
     * Return the base design review cost, this is a number that both
     * primary and regular reviewers start with.
     * @return
     */
    private float getCoreDesignReviewCost() {
        float reviewCost = (float) (level + 2) * (float) submissionsPassedScreening * DESIGN_REVIEW_RATE;
        float startupCost = 2.0f * DESIGN_REVIEW_RATE; //120 minutes to "start up"
        debug("reviewCost " + reviewCost);
        debug("startupCost " + startupCost);
        return reviewCost + startupCost;
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
        if (args.length != 4) {
            System.out.println("usage: java " + SoftwareComponent.class.toString() + " " +
                    "<level> <numSubmissions> <numSubmissionPassScreening> <phaseId>");
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
                    Integer.parseInt(args[2]), Integer.parseInt(args[3]));
            System.out.println("-------------------------------------------------------------");
            if (sc.phaseId == DEV_PHASE) {
                System.out.println("        Dev Cost:            |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("     Dev Review Cost:        |      " + sc.getReviewPrice());
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
                System.out.println("      Design Cost:           |      " + sc.getPrice());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("   Design Review Cost:       |      " + sc.getReviewPrice());
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
            } else {
                System.out.println("INVALID PHASE");
            }
            System.out.println("-------------------------------------------------------------");
        }
    }

    private void debug(String s) {
        //System.out.println(s);
    }

}
