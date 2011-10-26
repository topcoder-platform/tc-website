/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

import java.util.Date;

/**
 * <p>
 * This is a simple container class that has Summary of an ActiveContest Type.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author  kanakarajank
 * @version 1.0
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
    
    
    /**
     * Contest Date for SRM
     */
    private Date contestDate;
    

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

	/**
	 * @return the contestDate
	 */
	public Date getContestDate() {
		return contestDate;
	}

	/**
	 * @param contestDate the contestDate to set
	 */
	public void setContestDate(Date contestDate) {
		this.contestDate = contestDate;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ActiveContestsSummary [prizeTotal=" + prizeTotal + ", name="
				+ name + ", contestCount=" + contestCount + ", contestDate="
				+ contestDate + "]";
	}
}
