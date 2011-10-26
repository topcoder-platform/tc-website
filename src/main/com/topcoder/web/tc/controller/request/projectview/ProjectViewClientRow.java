/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.projectview;

import java.io.Serializable;
import java.util.List;

/**
 * <p>Simple bean that stores an aggregated Client row for the Project View report.</p>
 *
 * @author pulky
 * @version 1.0
 * @since Project View
 */
public class ProjectViewClientRow implements Serializable {

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
     * Represents the total contest fee associated to the client.
     * </p>
     */
    private Double totalFee;

    /**
     * <p>
     * Represents a list of projects associated to the client
     * </p>
     */
    private List<ProjectViewProjectRow> projects;

    /**
     * Default empty constructor
     */
    public ProjectViewClientRow() {
        super();

    }

    /**
     * Constructor using attributes
     *
     * @param name the name of the client
     * @param projects the projects of the client
     * @param totalFee the total fee amount of the client
     */
    public ProjectViewClientRow(String name, List<ProjectViewProjectRow> projects, Double totalFee) {
        super();
        this.name = name;
        this.projects = projects;
        this.totalFee = totalFee;
    }

    /**
     * Gets the name of the client
     *
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name of the client
     *
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Gets the total fee associated to the client
     *
     * @return the total fee
     */
    public Double getTotalFee() {
        return totalFee;
    }

    /**
     * Sets the total fee associated to the client
     *
     * @param totalFee the total fee to set
     */
    public void setTotalFee(Double totalFee) {
        this.totalFee = totalFee;
    }

    /**
     * Gets the projects associated to the client
     *
     * @return the projects
     */
    public List<ProjectViewProjectRow> getProjects() {
        return projects;
    }

    /**
     * Sets the projects associated to the client
     *
     * @param projects the projects to set
     */
    public void setProjects(List<ProjectViewProjectRow> projects) {
        this.projects = projects;
    }
}
