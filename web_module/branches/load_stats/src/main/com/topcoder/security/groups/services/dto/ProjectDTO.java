/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

/**
 * <p>
 * This class represents relevant info about a project
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly v1.0 )
 * @since 1.0
 */
public class ProjectDTO {
    /**
     * <p>
     * Represents the ID of the project It is managed with a getter and setter,
     * hence fully mutable. It may have any value.
     * </p>
     */
    private long projectId;

    /**
     * <p>
     * Represents the name of the project It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private String name;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public ProjectDTO() {
    }

    /**
     * <p>
     * Getter of projectId field.
     * </p>
     * @return the projectId
     */
    public long getProjectId() {
        return projectId;
    }

    /**
     * <p>
     * Setter of projectId field.
     * </p>
     * @param projectId the projectId to set
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * <p>
     * Getter of name field.
     * </p>
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Setter of name field.
     * </p>
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
}
