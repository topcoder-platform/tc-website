package com.topcoder.web.tc.model;


/**
 * @author dok
 * Date: Feb 11, 2004
 */
public class SoftwareComponent {

    private static float[] DESIGN_HOUR_LOOKUP = {0f, 4f, 8f, 11f};
    private static float[] DESIGN_EFFORT_LOOKUP = {0f, .10f, .15f, .20f};
    private static float[] DESIGN_PRICE_LOOKUP = {0f, 105f, 210f};

    private static float[] DEV_HOUR_LOOKUP = {0f, 4f, 8f, 11f};
    private static float[] DEV_EFFORT_LOOKUP = {0f, .20f, .25f, .30f};
    private static float[] DEV_PRICE_LOOKUP = {0f, 96f, 144f};

//    private static float DEV_RATE = 20f;
    private static float DEV_REVIEW_RATE = 20f;
//    private static float DESIGN_RATE = 25f;
    private static float DESIGN_REVIEW_RATE = 25f;

    private static int DEV_PHASE = 113;
    private static int DESIGN_PHASE = 112;

    private int phase;
    private int level;
    private int submissionCount;
    private int submissionsPassedScreening;

    private SoftwareComponent() {}

    public SoftwareComponent(int level, int submissionCount, int submissionsPassedScreening, int phase) {
        this.phase = phase;
        this.level = level;
        this.submissionCount = submissionCount;
        this.submissionsPassedScreening = submissionsPassedScreening;
    }

    public float getCost() {
        float ret = 0.0f;
        if (phase == DEV_PHASE) {
            ret = getDevCost();
        } else if (phase == DESIGN_PHASE) {
            ret = getDesignCost();
        } else {
            throw new RuntimeException("invalid phase " + phase);
        }
        return Math.round(ret);
    }


    public float getPrimaryReviewCost() {
        float ret = 0.0f;
        if (phase == DEV_PHASE) {
            ret = getPrimaryDevReviewCost();
        } else if (phase == DESIGN_PHASE) {
            ret = getPrimaryDesignReviewCost();
        } else {
            throw new RuntimeException("invalid phase " + phase);
        }
        return Math.round(ret);
    }

    public float getReviewCost() {
        float ret = 0.0f;
        if (phase == DEV_PHASE) {
            ret = getDevReviewCost();
        } else if (phase == DESIGN_PHASE) {
            ret = getDesignReviewCost();
        } else {
            throw new RuntimeException("invalid phase " + phase);
        }
        return Math.round(ret);
    }

    /**
     * Return the price for the winning developer
     * @return
     */
    private float getDevCost() {
        return DEV_PRICE_LOOKUP[level];
    }

    /**
     * Return the price for the winning designer
     * @return
     */
    private float getDesignCost() {
        return DESIGN_PRICE_LOOKUP[level];
    }

    /**
     * Return the total payment for the primary development reviewer
     * @return
     */
    private float getPrimaryDevReviewCost() {
        float screeningCost = (1f / 3f) * (float)submissionCount * DEV_REVIEW_RATE;  //20 minutes per submission
        float aggregationCost = (1f / 3f) * DEV_REVIEW_RATE;  //20 minutes to aggregate
        float finalReviewCost = (3f / 4f) * DEV_REVIEW_RATE;  //45 minutes to do final review
        debug("screeningCost " + screeningCost);
        debug("aggregationCost " + aggregationCost);
        debug("finalReviewCost " + finalReviewCost);
        return screeningCost + aggregationCost + finalReviewCost + getCoreDevReviewCost();
    }

    /**
     * Return the base development review cost, this is a number that both
     * primary and regular reviewers start with.
     * @return
     */
    private float getCoreDevReviewCost() {
        float reviewTime = DEV_EFFORT_LOOKUP[level] * DEV_HOUR_LOOKUP[level] * (float)submissionsPassedScreening;
        if (reviewTime < 2) reviewTime = 2f;  //give them a minimum of 2 hours to review
        float reviewCost = reviewTime*DEV_REVIEW_RATE;
        float startupCost = DEV_REVIEW_RATE / 2; //30 minutes to "start up"
        debug("reviewCost " + reviewCost);
        debug("startupCost " + startupCost);
        return reviewCost + startupCost;
    }

    /**
     * Return the total payment for a development reviewer
     * @return
     */
    private float getDevReviewCost() {
        float aggregationCost = (1f / 6f) * DEV_REVIEW_RATE; //10 minutes for aggregation
        float finalReviewCost = (1f / 6f) * DEV_REVIEW_RATE; //10 minutes for final review
        debug("aggregationCost " + aggregationCost);
        debug("finalReviewCost " + finalReviewCost);
        return aggregationCost + finalReviewCost + getCoreDevReviewCost();
    }

    /**
     * Return the total payment for a design reviewer
     * @return
     */
    private float getDesignReviewCost() {
        float aggregationCost = (1f / 6f) * DESIGN_REVIEW_RATE; //10 minutes for aggregation
        float finalReviewCost = (1f / 6f) * DESIGN_REVIEW_RATE; //10 minutes for final review
        debug("aggregationCost " + aggregationCost);
        debug("finalReviewCost " + finalReviewCost);
        return aggregationCost + finalReviewCost + getCoreDesignReviewCost();
    }

    /**
     * Return the total payment for the primary design reviewer
     * @return
     */
    private float getPrimaryDesignReviewCost() {
        float screeningCost = (1f / 3f) * (float)submissionCount * DESIGN_REVIEW_RATE;  //40 minutes per submission
        float aggregationCost = (1f / 3f) * DESIGN_REVIEW_RATE;  //20 minutes to aggregate
        float finalReviewCost = (1f / 2f) * DESIGN_REVIEW_RATE;  //30 minutes to do final review
        debug("screeningCost " + screeningCost);
        debug("aggregationCost " + aggregationCost);
        debug("finalReviewCost " + finalReviewCost);
        return screeningCost + aggregationCost + finalReviewCost + getCoreDesignReviewCost();
    }

    /**
     * Return the base design review cost, this is a number that both
     * primary and regular reviewers start with.
     * @return
     */
    private float getCoreDesignReviewCost() {
        float reviewTime = DESIGN_EFFORT_LOOKUP[level] * DESIGN_HOUR_LOOKUP[level] * (float)submissionsPassedScreening;
        if (reviewTime < 1) reviewTime = 1f;  //give them a minimum of 1 hours to review
        float reviewCost = reviewTime*DESIGN_REVIEW_RATE;
        float startupCost = (1f/2f) * DESIGN_REVIEW_RATE; //30 minutes to "start up"
        debug("reviewCost " + reviewCost);
        debug("startupCost " + startupCost);
        return reviewCost + startupCost;
    }


    public static void main(String[] args) {
        if (args.length!=4) {
            System.out.println("usage: java " + SoftwareComponent.class.toString() + " " +
                    "<level> <numSubmissions> <numSubmissionPassScreening> <phase>");
            System.out.println("dev phase " + DEV_PHASE);
            System.out.println("design phase " + DESIGN_PHASE);
        } else {
            SoftwareComponent sc = new SoftwareComponent(Integer.parseInt(args[0]), Integer.parseInt(args[1]),
                    Integer.parseInt(args[2]), Integer.parseInt(args[3]));
            System.out.println("-------------------------------------------------------------");
            if (sc.phase==DEV_PHASE) {
                System.out.println("        Dev Cost:            |      " + sc.getCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("     Dev Review Cost:        |      " + sc.getReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("  Dev Primary Review Cost    |      " + sc.getPrimaryReviewCost());
            } else if (sc.phase==DESIGN_PHASE) {
                System.out.println("      Design Cost:           |      " + sc.getCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println("   Design Review Cost:       |      " + sc.getReviewCost());
                System.out.println("-----------------------------+-------------------------------");
                System.out.println(" Design Primary Review Cost: |      " + sc.getPrimaryReviewCost());
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

