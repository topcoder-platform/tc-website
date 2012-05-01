/*
 * Copyright (C) 2008-2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;

/**
 * <p>A <code>DTO</code> class representing the collection of statistical data for the history of participation of a
 * <code>Studio</code> member in contests of a specified single type.</p>
 *
 * <p>As of this version such data includes: number of contests the member registered so far; number of submissions
 * submitted by <code>Studio</code> member for registered contests; number of submissions passed screening; number of
 * registered contests won by <code>Studio</code> member; the percentages of submissions, submissions passed screening
 * and winning submissions.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class ContestStatistics implements Serializable {

    /**
     * <p>A <code>ProjectCategory</code> referencing the type of the contests which these statistics correspond to.</p>
     */
    private ProjectCategory contestType;

    /**
     * <p>An <code>int</code> providing the number of contests of specified type which <code>Studio</code> member
     * registered to.</p>
     */
    private int contestsRegistered;

    /**
     * <p>An <code>int</code> providing the number of submissions submitted by <code>Studio</code> member for the
     * registered contests of specified type.</p>
     */
    private int numberOfSubmissions;

    /**
     * <p>An <code>int</code> providing the ratio of the contests which <code>Studio</code> member submitted submissions
     * for per total number of contests the member registered to.</p>
     */
    private int submissionPercentage;

    /**
     * <p>An <code>int</code> providing the number of submissions submitted by <code>Studio</code> member for the
     * registered contests of specified type which passed screening.</p>
     */
    private int submissionPassedScreening;

    /**
     * <p>An <code>int</code> providing the ratio of the submissions passed screening per total number of submissions
     * submitted by <code>Studio</code> member for contests of specified type.</p>
     */
    private int passedScreeningPercentage;

    /**
     * <p>An <code>int</code> providing the number of contests of specified type which have been won by
     * <code>Studio</code> member.</p>
     */
    private int numberOfWins;

    /**
     * <p>An <code>int</code> providing the ratio of the contests won by <code>Studio</code> member per total number of
     * contests of specified type the member registered to.</p>
     */
    private int winPercentage;

    /**
     * <p>Constructs new <code>ContestStatistics</code> instance. This implementation does nothing.</p>
     */
    public ContestStatistics() {
    }

    /**
     * <p>Gets the type of the contests which these statistics correspond to.</p>
     *
     * @return a <code>ContestType</code> referencing the type of the contests which these statistics correspond to.
     */
    public ProjectCategory getContestType() {
        return this.contestType;
    }

    /**
     * <p>Sets the type of the contests which these statistics correspond to.</p>
     *
     * @param contestType a <code>ProjectCategory</code> referencing the type of the contests which these statistics
     *                    correspond to.
     */
    public void setContestType(ProjectCategory contestType) {
        this.contestType = contestType;
    }

    /**
     * <p>Gets the number of contests the <code>Studio</code> member registered to.</p>
     *
     * @return an <code>int</code> providing the number of contests of specified type which <code>Studio</code> member
     *         registered to.
     */
    public int getContestsRegistered() {
        return this.contestsRegistered;
    }

    /**
     * <p>Sets the number of contests the <code>Studio</code> member registered to.</p>
     *
     * @param contestsRegistered an <code>int</code> providing the number of contests of specified type which
     *                           <code>Studio</code> member registered to.
     */
    public void setContestsRegistered(int contestsRegistered) {
        this.contestsRegistered = contestsRegistered;
    }

    /**
     * <p>Gets the total number of submissions submitted by <code>Studio</code> member for the registered contests.</p>
     *
     * @return an <code>int</code> providing the number of submissions submitted by <code>Studio</code> member for the
     *         registered contests.
     */
    public int getNumberOfSubmissions() {
        return this.numberOfSubmissions;
    }

    /**
     * <p>Sets the total number of submissions submitted by <code>Studio</code> member for the registered contests.</p>
     *
     * @param numberOfSubmissions an <code>int</code> providing the number of submissions submitted by
     *                            <code>Studio</code> member for the registered contests.
     */
    public void setNumberOfSubmissions(int numberOfSubmissions) {
        this.numberOfSubmissions = numberOfSubmissions;
    }

    /**
     * <p>Gets the percentage for the submissions submitted by <code>Studio</code> member.</p>
     *
     * @return an <code>int</code> providing the ratio of the contests which <code>Studio</code> member submitted
     *         submissions for per total number of contests the member registered to.
     */
    public int getSubmissionPercentage() {
        return this.submissionPercentage;
    }

    /**
     * <p>Sets the percentage for the submissions submitted by <code>Studio</code> member.</p>
     *
     * @param submissionPercentage an <code>int</code> providing the ratio of the contests which <code>Studio</code>
     *                             member submitted submissions for per total number of contests the member registered
     *                             to.
     */
    public void setSubmissionPercentage(int submissionPercentage) {
        this.submissionPercentage = submissionPercentage;
    }

    /**
     * <p>Gets the number of submissions which passed screening.</p>
     *
     * @return an <code>int</code> providing the number of submissions submitted by <code>Studio</code> member for the
     *         registered contests which passed screening.
     */
    public int getSubmissionPassedScreening() {
        return this.submissionPassedScreening;
    }

    /**
     * <p>Sets the number of submissions which passed screening.</p>
     *
     * @param submissionPassedScreening an <code>int</code> providing the number of submissions submitted by
     *                                  <code>Studio</code> member for the registered contests which passed screening.
     */
    public void setSubmissionPassedScreening(int submissionPassedScreening) {
        this.submissionPassedScreening = submissionPassedScreening;
    }

    /**
     * <p>Gets the percentage for the submissions passed screening.</p>
     *
     * @return an <code>int</code> providing the ratio of the submissions passed screening per total number of
     *         submissions submitted by <code>Studio</code> member for contests of specified type.
     */
    public int getPassedScreeningPercentage() {
        return this.passedScreeningPercentage;
    }

    /**
     * <p>Sets the percentage for the submissions passed screening.</p>
     *
     * @param passedScreeningPercentage an <code>int</code> providing the ratio of the submissions passed screening per
     *                                  total number of submissions submitted by <code>Studio</code> member for contests
     *                                  of specified type.
     */
    public void setPassedScreeningPercentage(int passedScreeningPercentage) {
        this.passedScreeningPercentage = passedScreeningPercentage;
    }

    /**
     * <p>Gets the total number of contests which have been won by <code>Studio</code> member.</p>
     *
     * @return an <code>int</code> providing the number of contests of specified type which have been won by
     *         <code>Studio</code> member.
     */
    public int getNumberOfWins() {
        return this.numberOfWins;
    }

    /**
     * <p>Sets the total number of contests which have been won by <code>Studio</code> member.</p>
     *
     * @param numberOfWins an <code>int</code> providing the number of contests of specified type which have been won by
     *                     <code>Studio</code> member.
     */
    public void setNumberOfWins(int numberOfWins) {
        this.numberOfWins = numberOfWins;
    }

    /**
     * <p>Gets the percentage for the contests won by the <code>Studio</code> member.</p>
     *
     * @return an <code>int</code> providing the ratio of the contests won by <code>Studio</code> member per total
     *         number of contests of specified type the member registered to.
     */
    public int getWinPercentage() {
        return this.winPercentage;
    }

    /**
     * <p>Sets the percentage for the contests won by the <code>Studio</code> member.</p>
     *
     * @param winPercentage an <code>int</code> providing the ratio of the contests won by <code>Studio</code> member
     *                      per total number of contests of specified type the member registered to.
     */
    public void setWinPercentage(int winPercentage) {
        this.winPercentage = winPercentage;
    }
}