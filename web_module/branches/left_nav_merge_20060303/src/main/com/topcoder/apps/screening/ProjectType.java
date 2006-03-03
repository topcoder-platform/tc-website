/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

import com.topcoder.util.collection.typesafeenum.Enum;

/**
 * <strong>Purpose</strong>:
 * It holds enumeration to the project types the application will handle.
 *
 * @author WishingBone
 * @version 1.0
 */
public class ProjectType extends Enum {

    /**
     * <strong>Purpose</strong>:
     * Project type name.
     */
    private String name;

    /**
     * The type id.
     */
    private long id;

    /**
     * <strong>Purpose</strong>:
     * Enum access for Java Design.
     */
    public static final ProjectType JAVA_DESIGN = new ProjectType("java_design", 1);

    /**
     * <strong>Purpose</strong>:
     * Enum access for Java Dev.
     */
    public static final ProjectType JAVA_DEV = new ProjectType("java_dev", 2);

    /**
     * <strong>Purpose</strong>:
     * Enum access for C# Design.
     */
    public static final ProjectType CSHARP_DESIGN = new ProjectType("csharp_design", 3);

    /**
     * <strong>Purpose</strong>:
     * Enum access for C# Dev.
     */
    public static final ProjectType CSHARP_DEV = new ProjectType("csharp_dev", 4);

    /**
     * <strong>Purpose</strong>:
     * Construct with name and id.
     *
     * @param name the project type name.
     * @param id the type id.
     */
    private ProjectType(String name, long id) {
        this.name = name;
        this.id = id;
    }

    /**
     * <strong>Purpose</strong>:
     * Get the type name.
     *
     * @return the type name.
     */
    public String getName() {
        return this.name;
    }

    /**
     * Get the type id.
     *
     * @return the type id.
     */
    public long getId() {
        return this.id;
    }

    /**
     * <strong>Purpose</strong>:
     * Get the ProjectType enumeration instance from name.
     *
     * @param name the project type name.
     *
     * @return the located project type enum.
     */
    public static ProjectType getProjectType(String name) {
        if (JAVA_DESIGN.name.equals(name)) {
            return JAVA_DESIGN;
        }
        if (JAVA_DEV.name.equals(name)) {
            return JAVA_DEV;
        }
        if (CSHARP_DESIGN.name.equals(name)) {
            return CSHARP_DESIGN;
        }
        if (CSHARP_DEV.name.equals(name)) {
            return CSHARP_DEV;
        }
        return null;
    }

    /**
     * Get the ProjectType enumeration instance from id.
     *
     * @param id the type id.
     *
     * @return the located project type enum.
     */
    public static ProjectType getProjectType(long id) {
        if (JAVA_DESIGN.id == id) {
            return JAVA_DESIGN;
        }
        if (JAVA_DEV.id == id) {
            return JAVA_DEV;
        }
        if (CSHARP_DESIGN.id == id) {
            return CSHARP_DESIGN;
        }
        if (CSHARP_DEV.id == id) {
            return CSHARP_DEV;
        }
        return null;
    }

}
