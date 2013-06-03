/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>A DTO for details on registration by this member profile to a single contest.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class MemberProfileRegistration  implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of contest user is registered to.</p>
     */
    private long contestId;

    /**
     * <p>A <code>String</code> providing the name of contest user is registered to.</p>
     */
    private String contestName;

    /**
     * <p>A <code>long</code> providing the ID of a type of contest.</p>
     */
    private long contestTypeId;

    /**
     * <p>A <code>String</code> providing the name of a type of contest.</p>
     */
    private String contestTypeName;
    
    /**
     * <p>A <code>Date</code> providing the start time of contest.</p>
     */
    private Date contestStartTime;

    /**
     * <p>A <code>Date</code> providing the end time of contest.</p>
     */
    private Date contestEndTime;

    /**
     * <p>A <code>double</code> providing the prize purse for contest.</p>
     */
    private double contestPrizePurse;

    /**
     * <p>A <code>double</code> providing the amount of DR points for contest.</p>
     */
    private double drPoints;

    /**
     * <p>Constructs new <code>MemberProfileRegistration</code> instance. This implementation does nothing.</p>
     */
    public MemberProfileRegistration() {
    }

    /**
     * <p>Gets the amount of DR points for contest.</p>
     *
     * @return a <code>double</code> providing the amount of DR points for contest.
     */
    public double getDrPoints() {
        return this.drPoints;
    }

    /**
     * <p>Sets the amount of DR points for contest.</p>
     *
     * @param drPoints a <code>double</code> providing the amount of DR points for contest.
     */
    public void setDrPoints(double drPoints) {
        this.drPoints = drPoints;
    }

    /**
     * <p>Gets the prize purse for contest.</p>
     *
     * @return a <code>double</code> providing the prize purse for contest.
     */
    public double getContestPrizePurse() {
        return this.contestPrizePurse;
    }

    /**
     * <p>Sets the prize purse for contest.</p>
     *
     * @param contestPrizePurse a <code>double</code> providing the prize purse for contest.
     */
    public void setContestPrizePurse(double contestPrizePurse) {
        this.contestPrizePurse = contestPrizePurse;
    }

    /**
     * <p>Gets the end time of contest.</p>
     *
     * @return a <code>Date</code> providing the end time of contest.
     */
    public Date getContestEndTime() {
        return this.contestEndTime;
    }

    /**
     * <p>Sets the end time of contest.</p>
     *
     * @param contestEndTime a <code>Date</code> providing the end time of contest.
     */
    public void setContestEndTime(Date contestEndTime) {
        this.contestEndTime = contestEndTime;
    }

    /**
     * <p>Gets the ID of a type of contest.</p>
     *
     * @return a <code>long</code> providing the ID of a type of contest.
     */
    public long getContestTypeId() {
        return this.contestTypeId;
    }

    /**
     * <p>Sets the ID of a type of contest.</p>
     *
     * @param contestTypeId a <code>long</code> providing the ID of a type of contest.
     */
    public void setContestTypeId(long contestTypeId) {
        this.contestTypeId = contestTypeId;
    }

    /**
     * <p>Gets the name of a type of contest.</p>
     *
     * @return a <code>String</code> providing the name of a type of contest.
     */
    public String getContestTypeName() {
        return this.contestTypeName;
    }

    /**
     * <p>Sets the name of a type of contest.</p>
     *
     * @param contestTypeName a <code>String</code> providing the name of a type of contest.
     */
    public void setContestTypeName(String contestTypeName) {
        this.contestTypeName = contestTypeName;
    }
    
    /**
     * <p>Gets the name of contest user is registered to.</p>
     *
     * @return a <code>String</code> providing the name of contest user is registered to.
     */
    public String getContestName() {
        return this.contestName;
    }

    /**
     * <p>Sets the name of contest user is registered to.</p>
     *
     * @param contestName a <code>String</code> providing the name of contest user is registered to.
     */
    public void setContestName(String contestName) {
        this.contestName = contestName;
    }

    /**
     * <p>Gets the ID of contest user is registered to.</p>
     *
     * @return a <code>long</code> providing the ID of contest user is registered to.
     */
    public long getContestId() {
        return this.contestId;
    }

    /**
     * <p>Sets the ID of contest user is registered to.</p>
     *
     * @param contestId a <code>long</code> providing the ID of contest user is registered to.
     */
    public void setContestId(long contestId) {
        this.contestId = contestId;
    }

    /**
     * <p>Gets the start time of contest.</p>
     *
     * @return a <code>Date</code> providing the start time of contest.
     */
    public Date getContestStartTime() {
        return this.contestStartTime;
    }

    /**
     * <p>Sets the start time of contest.</p>
     *
     * @param contestStartTime a <code>Date</code> providing the start time of contest.
     */
    public void setContestStartTime(Date contestStartTime) {
        this.contestStartTime = contestStartTime;
    }
}
