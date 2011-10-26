package com.topcoder.web.tc.model;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use only in connection with a TopCoder competition.
 *
 * Use to encapsulate summary information about active contests.  For example,
 * if we have 10 active design contests, we would have a single instance of this
 * class to describe the active contests for design.
 * 
 * @author dok
 * @version $Id$
 *          Create Date: May 30, 2008
 */
public class ActiveContestsSummary {

    /**
     * the prizes avaiable for all the contests that this object is summarizing.
     * Generally this will be a dollar amount, but i'll be using it for points as well
     * for the digital run
     */
    private Float prizeTotal=0f;

    /**
     * a description of the contests that are being summarized.  For example, it might be
     * "Component Design"
     */
    private String name;

    /**
     * How many contests are currently active
     */
    private Integer contestCount=0;

    public ActiveContestsSummary() {

    }

    public Float getPrizeTotal() {
        return prizeTotal;
    }

    public void setPrizeTotal(Float prizeTotal) {
        this.prizeTotal = prizeTotal;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getContestCount() {
        return contestCount;
    }

    public void setContestCount(Integer contestCount) {
        this.contestCount = contestCount;
    }
}
