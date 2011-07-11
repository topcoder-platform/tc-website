/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.util.HashSet;
import java.util.Set;

/**
 * <p>An entity class mapped to <code>tcs_catalog.prize</code> table.</p>
 * 
 * @author isv
 * @version 1.0 (Re-platforming Studio Release 2 assembly)
 */
public class Prize implements Comparable<Prize> {

    /**
     * <p>A <code>long</code> providing the ID for <code>Contest Prize</code> prize type.</p>
     */
    public static final long CONTEST_PRIZE_TYPE_ID = 15; 

    /**
     * <p>A <code>long</code> providing the ID for <code>Milestone Prize</code> prize type.</p>
     */
    public static final long MILESTONE_PRIZE_TYPE_ID = 14; 

    /**
     * <p>A <code>Long</code> providing the ID of this prize.</p>
     */
    private Long id;

    /**
     * <p>A <code>Integer</code> providing the place which this prize corresponds to.</p>
     */
    private Integer place;

    /**
     * <p>A <code>Float</code> providing the amount of prize.</p>
     */
    private Float amount;

    /**
     * <p>A <code>Integer</code> providing the number of submissions which may be awarded this prize..</p>
     */
    private Integer numberOfSubmissions;

    /**
     * <p>A <code>Set</code> providing the projects which this prize maps to.</p>
     */
    private Set<Project> projects = new HashSet<Project>();

    /**
     * <p>A <code>PrizeType</code> providing the type of this prize.</p>
     */
    private PrizeType type;

    /**
     * <p>Constructs new <code>Prize</code> instance. This implementation does nothing.</p>
     */
    public Prize() {
    }

    /**
     * <p>Gets the number of submissions which may be awarded this prize..</p>
     *
     * @return a <code>Integer</code> providing the number of submissions which may be awarded this prize..
     */
    public Integer getNumberOfSubmissions() {
        return this.numberOfSubmissions;
    }

    /**
     * <p>Sets the number of submissions which may be awarded this prize..</p>
     *
     * @param numberOfSubmissions a <code>Integer</code> providing the number of submissions which may be awarded this
     *        prize..
     */
    public void setNumberOfSubmissions(Integer numberOfSubmissions) {
        this.numberOfSubmissions = numberOfSubmissions;
    }

    /**
     * <p>Gets the amount of prize.</p>
     *
     * @return a <code>Float</code> providing the amount of prize.
     */
    public Float getAmount() {
        return this.amount;
    }

    /**
     * <p>Sets the amount of prize.</p>
     *
     * @param amount a <code>Float</code> providing the amount of prize.
     */
    public void setAmount(Float amount) {
        this.amount = amount;
    }

    /**
     * <p>Gets the place which this prize corresponds to.</p>
     *
     * @return a <code>Integer</code> providing the place which this prize corresponds to.
     */
    public Integer getPlace() {
        return this.place;
    }

    /**
     * <p>Sets the place which this prize corresponds to.</p>
     *
     * @param place a <code>Integer</code> providing the place which this prize corresponds to.
     */
    public void setPlace(Integer place) {
        this.place = place;
    }

    /**
     * <p>Gets the ID of this prize.</p>
     *
     * @return a <code>Long</code> providing the ID of this prize.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this prize.</p>
     *
     * @param id a <code>Long</code> providing the ID of this prize.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * <p>Gets the projects which this prize maps to.</p>
     *
     * @return a <code>Set</code> providing the projects which this prize maps to.
     */
    public Set getProjects() {
        return this.projects;
    }

    /**
     * <p>Sets the projects which this prize maps to.</p>
     *
     * @param projects a <code>Set</code> providing the projects which this prize maps to.
     */
    public void setProjects(Set projects) {
        this.projects = projects;
    }

    /**
     * <p>Compares this prize to specified prize.</p>
     * 
     * @param other a <code>Prize</code> to compare this prize to.  
     * @return an <code>int</code> coding the comparison result.
     */
    public int compareTo(Prize other) {
        PrizeType type1 = getType();
        PrizeType type2 = other.getType();
        
        if ((type1 != null) && (type2 != null) && (!type1.getId().equals(type2.getId()))) {
            return type1.getId().compareTo(type2.getId());
        } else if (getPlace() == null && other.getPlace() == null) {
            return getAmount().compareTo(other.getAmount());
        } else if (getPlace() == null) {
            return new Integer(Integer.MAX_VALUE).compareTo(other.getPlace());
        } else if (other.getPlace() == null) {
            return getPlace().compareTo(Integer.MAX_VALUE);
        } else {
            return getPlace().compareTo(other.getPlace());
        }
    }

    /**
     * <p>Gets the type of this prize.</p>
     *
     * @return a <code>PrizeType</code> providing the type of this prize.
     */
    public PrizeType getType() {
        return this.type;
    }

    /**
     * <p>Sets the type of this prize.</p>
     *
     * @param type a <code>PrizeType</code> providing the type of this prize.
     */
    public void setType(PrizeType type) {
        this.type = type;
    }
}
