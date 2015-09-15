/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.model;

/**
 * <p>
 * This class represents a direct project.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe.
 * </p>
 * 
 * <p>
 * Version 1.1 (TopCoder Security Groups Frontend - Create Update Group) change notes:
 * <ol>
 *   <li>Added field <code>directProjectId</code>.</li>
 * </ol>
 * </p>
 *
 * @author leo_lol, flexme
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly v1.0 )
 * @since 1.1
 */
public class DirectProject extends IdentifiableEntity {
    /**
     * <p>
     * Represents the id of the direct project.
     * </p>
     */
    private long directProjectId;
    
    /**
     * <p>
     * Represents the name of the direct project. It is managed with a getter and
     * setter, thus fully mutable. It may have any value
     * </p>
     */
    private String name;

    /**
     * <p>
     * Represents the group this direct project belongs to It is managed with a
     * getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private Group group;

    /**
     * <p>
     * Default constructor.
     * </p>
     */
    public DirectProject() {
    }

    /**
     * <p>
     * Getter of the name field.
     * </p>
     * 
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Setter of the name field.
     * </p>
     * 
     * @param name
     *            the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Getter of group
     * 
     * @return the group
     */
    public Group getGroup() {
        return group;
    }

    /**
     * Setter of group
     * 
     * @param group
     *            the group to set
     */
    public void setGroup(Group group) {
        this.group = group;
    }

    /**
     * Getter of directProjectId.
     * 
     * @return the directProjectId
     */
    public long getDirectProjectId() {
        return directProjectId;
    }

    /**
     * Setter of directProjectId.
     * 
     * @param directProjectId the directProjectId to set
     */
    public void setDirectProjectId(long directProjectId) {
        this.directProjectId = directProjectId;
    }
}
