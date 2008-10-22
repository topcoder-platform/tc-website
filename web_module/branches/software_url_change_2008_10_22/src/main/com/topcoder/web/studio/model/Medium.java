/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

/**
 * <p>A POJO class used for representing the contest submissions intended medium. Maintains the medium ID and
 * description. A medium describes how the competitor submission will be used. For example, it might be used in a poster
 * and a brochure.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications v2 Assembly (Req# 5.1.5)
 */
public class Medium extends Base {

    /**
     * <p>An <code>Integer</code> maintaining the ID of this medium type.</p>
     */
    private Integer id = null;

    /**
     * <p>A <code>String</code> maintaining the textual description of this medium type.</p>
     */
    private String description = null;

    /**
     * <p>Constructs new <code>Medium</code> instance. This implementation does nothing.</p>
     */
    public Medium() {
    }

    /**
     * <p>Gets the ID of this medium type.</p>
     *
     * @return an <code>Integer</code> providing the ID of this medium type.
     */
    public Integer getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this medium type.</p>
     *
     * @param id an <code>Integer</code> providing the ID of this medium type.
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * <p>Gets the description of this medium type.</p>
     *
     * @return a <code>String</code> providing description ID of this medium type.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this medium type.</p>
     *
     * @param description a <code>String</code> providing description ID of this medium type.
     */
    public void setDescription(String description) {
        this.description = description;
    }
}
