/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.util.Set;

/**
 * <p>An entity class mapped to <code>tcs_catalog.project_category_lu</code> table.</p>
 * 
 * @author isv
 * @version 1.0 (Re-platforming Studio Release 2 assembly)
 */
public class ProjectCategory extends Base {

    /**
     * <p>A <code>Integer</code> providing the ID of this project category.</p>
     */
    private Integer id;

    /**
     * <p>A <code>String</code> providing the name of this project category.</p>
     */
    private String name;

    /**
     * <p>Constructs new <code>ProjectCategory</code> instance. This implementation does nothing.</p>
     */
    public ProjectCategory() {
    }

    /**
     * <p>Gets the name of this project category.</p>
     *
     * @return a <code>String</code> providing the name of this project category.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Sets the name of this project category.</p>
     *
     * @param name a <code>String</code> providing the name of this project category.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>Gets the ID of this project category.</p>
     *
     * @return a <code>Integer</code> providing the ID of this project category.
     */
    public Integer getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this project category.</p>
     *
     * @param id a <code>Integer</code> providing the ID of this project category.
     */
    public void setId(Integer id) {
        this.id = id;
    }
}
