package com.topcoder.web.tc.model;

/**
 * @author dok
 * Date: Feb 11, 2004
 */
public class ReviewBoardApplication {
    long userId;
    long phaseId;
    long projectId;
    String handle;
    boolean primary;
    int numSubmissions;
    int numSubmissionsPassScreening;
    int level;


    public boolean isSpotFilled() {
        return userId!=0;
    }

    public double getPrice() {
        return 0;
    }
}
