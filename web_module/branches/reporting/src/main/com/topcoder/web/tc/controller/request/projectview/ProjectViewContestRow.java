/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.projectview;

import java.io.Serializable;

/**
 * <p>Simple bean that stores a contest row for the Project View report.</p>
 *
 * @author pulky
 * @version 1.0
 * @since Project View
 */
public class ProjectViewContestRow implements Serializable {

    /**
     * <p>
     * Represents the serial version unique id.
     * </p>
     */
    private static final long serialVersionUID = 1L;

    /**
     * <p>
     * Represents the name of the contest.
     * </p>
     */
    private String name;

    /**
     * <p>
     * Represents the category of the contest.
     * </p>
     */
    private String category;

    /**
     * <p>
     * Represents the status of the contest.
     * </p>
     */
    private String status;

    /**
     * <p>
     * Represents the fee of the contest.
     * </p>
     */
    private Double fee;

    /**
     * Default empty constructor
     */
    public ProjectViewContestRow() {
        super();
    }

    /**
     * Constructor using attributes
     *
     * @param name the name of the contest
     * @param category the category of the contest
     * @param status the status of the contest
     * @param fee the fee of the contest
     */
    public ProjectViewContestRow(String name, String category,
            String status, Double fee) {
        super();
        this.name = name;
        this.category = category;
        this.status = status;
        this.fee = fee;
    }

    /**
     * Gets the name of the contest
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the contest
     *
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the category of the contest
     *
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * Sets the category of the contest
     *
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * Gets the status of the contest
     *
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * Sets the status of the contest
     *
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * Gets the fee of the contest
     *
     * @return the fee
     */
    public Double getFee() {
        return fee;
    }

    /**
     * Sets the fee of the contest
     *
     * @param fee the fee to set
     */
    public void setFee(Double fee) {
        this.fee = fee;
    }
}
