/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import java.sql.Timestamp;

import com.topcoder.web.common.model.Base;

/**
 * <p>This class represents a ContestMultiRoundInformation entity.</p>
 *
 * <p>
 *   Version 1.0 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new Contest Multi Round Information entity.
 *   </ol>
 * </p>
 *
 * @author pulky
 * @version 1.0
 * @since Studio Multi-Rounds Assembly - Studio Contest Details v1.0
 */
public class ContestMultiRoundInformation extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The Contest Multi Round Information id.
     */
    private Long id;

    /**
     * The Contest's milestone date
     */
    private Timestamp milestoneDate;

    /**
     * The Contest's "submitters locked between rounds" flag
     */
    private Boolean submittersLockedBetweenRounds;

    /**
     * The Contest's round one information
     */
    private String roundOneIntroduction;

    /**
     * The Contest's round two information
     */
    private String roundTwoIntroduction;

    /**
     * Gets the identifier
     *
     * @return the identifier
     */
    public Long getId() {
        return id;
    }

    /**
     * Sets the identifier
     *
     * @param id the identifier to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * Gets the contest's milestone date
     *
     * @return the contest's milestone date
     */
    public Timestamp getMilestoneDate() {
        return milestoneDate;
    }

    /**
     * Sets the contest's milestone date
     *
     * @param milestoneDate the contest's milestone date to set
     */
    public void setMilestoneDate(Timestamp milestoneDate) {
        this.milestoneDate = milestoneDate;
    }

    /**
     * Gets the contest's "submitters locked between rounds" flag
     *
     * @return the contest's "submitters locked between rounds" flag
     */
    public Boolean getSubmittersLockedBetweenRounds() {
        return submittersLockedBetweenRounds;
    }

    /**
     * Gets the contest's "submitters locked between rounds" flag
     *
     * @return the contest's "submitters locked between rounds" flag
     */
    public Boolean isSubmittersLockedBetweenRounds() {
        return submittersLockedBetweenRounds;
    }

    /**
     * Sets the contest's "submitters locked between rounds" flag
     *
     * @param submittersLockedBetweenRounds the contest's "submitters locked between rounds" flag to set
     */
    public void setSubmittersLockedBetweenRounds(
            Boolean submittersLockedBetweenRounds) {
        this.submittersLockedBetweenRounds = submittersLockedBetweenRounds;
    }

    /**
     * Gets the contest's round one introduction
     *
     * @return the contest's round one introduction
     */
    public String getRoundOneIntroduction() {
        return roundOneIntroduction;
    }

    /**
     * Sets the contest's round one introduction
     *
     * @param roundOneIntroduction the contest's round one introduction to set
     */
    public void setRoundOneIntroduction(String roundOneIntroduction) {
        this.roundOneIntroduction = roundOneIntroduction;
    }

    /**
     * Gets the contest's round two introduction
     *
     * @return the contest's round two introduction
     */
    public String getRoundTwoIntroduction() {
        return roundTwoIntroduction;
    }

    /**
     * Sets the contest's round two introduction
     *
     * @param roundTwoIntroduction the contest's round two introduction to set
     */
    public void setRoundTwoIntroduction(String roundTwoIntroduction) {
        this.roundTwoIntroduction = roundTwoIntroduction;
    }

    /**
     * Equals implementation for this class.
     *
     * @param obj the object to compare
     * @return true if the two objects are equal (identifiers are equal)
     *
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object obj) {
        if (obj == null || id == null || !(obj instanceof ContestMultiRoundInformation)) {
            return false;
        } else {
            ContestMultiRoundInformation other = (ContestMultiRoundInformation) obj;
            return id.equals(other.getId());
        }
    }

    /**
     * Hashcode implementation for this class.
     *
     * @return an <code>int</code> with the hashcode (identifier hashcode)
     *
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (id != null ? id.hashCode() : 0);
    }
}
