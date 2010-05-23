/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import java.sql.Timestamp;

import com.topcoder.web.common.model.Base;

/**
 * <p>This class represents a ContestMilestonePrize entity.</p>
 *
 * <p>
 *   Version 1.0 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *       This class was created to support the new Contest Milestone Prize entity.
 *   </ol>
 * </p>
 *
 * @author pulky
 * @version 1.0
 * @since Studio Multi-Rounds Assembly - Studio Contest Details v1.0
 */
public class ContestMilestonePrize extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     */
    private static final long serialVersionUID = 1L;

    /**
     * The Contest Milestone Prize id.
     */
    private Long id;

    /**
     * The Contest milestone prize type
     */
    private PrizeType type;

    /**
     * The Contest milestone prize amount
     */
    private Float amount;

    /**
     * The Contest milestone prize number of submissions
     */
    private Integer numberOfSubmissions;

    /**
     * The Contest milestone prize creation date
     */
    private Timestamp createDate;

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
     * Gets the type
     *
     * @return the type
     */
    public PrizeType getType() {
        return type;
    }

    /**
     * Sets the type
     *
     * @param type the type to set
     */
    public void setType(PrizeType type) {
        this.type = type;
    }

    /**
     * Gets the amount
     *
     * @return the amount
     */
    public Float getAmount() {
        return amount;
    }

    /**
     * Sets the amount
     *
     * @param amount the amount to set
     */
    public void setAmount(Float amount) {
        this.amount = amount;
    }

    /**
     * Gets the number of submissions
     *
     * @return the numberOfSubmissions
     */
    public Integer getNumberOfSubmissions() {
        return numberOfSubmissions;
    }

    /**
     * Sets the number of submissions
     *
     * @param numberOfSubmissions the number of submissions to set
     */
    public void setNumberOfSubmissions(Integer numberOfSubmissions) {
        this.numberOfSubmissions = numberOfSubmissions;
    }

    /**
     * Gets the creation date
     *
     * @return the createDate
     */
    public Timestamp getCreateDate() {
        return createDate;
    }

    /**
     * Sets the creation date
     *
     * @param createDate the creation date to set
     */
    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
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
        if (obj == null || id == null || !(obj instanceof ContestMilestonePrize)) {
            return false;
        } else {
            ContestMilestonePrize other = (ContestMilestonePrize) obj;
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
