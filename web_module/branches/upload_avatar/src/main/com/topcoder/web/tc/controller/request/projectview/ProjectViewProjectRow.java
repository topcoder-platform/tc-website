/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.projectview;

import java.io.Serializable;
import java.util.List;

/**
 * <p>Simple bean that stores an aggregated Project row for the Project View report.</p>
 *
 * @author pulky
 * @version 1.0
 * @since Project View
 */
public class ProjectViewProjectRow implements Serializable {

    /**
     * <p>
     * Represents the serial version unique id.
     * </p>
     */
    private static final long serialVersionUID = 1L;

    /**
     * <p>
     * Represents the name of the client.
     * </p>
     */
    private String name;

    /**
     * <p>
     * Represents the total contest fee associated to the project.
     * </p>
     */
    private Double totalFee;

    /**
     * <p>
     * Represents a list of contests associated to the project
     * </p>
     */
    private List<ProjectViewContestRow> contests;

    /**
     * Default empty constructor
     */
    public ProjectViewProjectRow() {
        super();
    }

    /**
     * Constructor using attributes
     *
     * @param name the name of the project
     * @param contests the contests of the project
     * @param totalFee the total fee amount of the project
     */
    public ProjectViewProjectRow(String name, List<ProjectViewContestRow> contests, Double totalFee) {
        super();
        this.name = name;
        this.contests = contests;
        this.totalFee = totalFee;
    }

    /**
     * Gets the name of the project
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the project
     *
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the total fee associated to the project
     *
     * @return the total fee
     */
    public Double getTotalFee() {
        return totalFee;
    }

    /**
     * Sets the total fee associated to the project
     *
     * @param totalFee the total fee to set
     */
    public void setTotalFee(Double totalFee) {
        this.totalFee = totalFee;
    }

    /**
     * Gets the contests associated to the project
     *
     * @return the contests
     */
    public List<ProjectViewContestRow> getContests() {
        return contests;
    }

    /**
     * Sets the contests associated to the project
     *
     * @param contests the contests to set
     */
    public void setContests(List<ProjectViewContestRow> contests) {
        this.contests = contests;
    }
}
