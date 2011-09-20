/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.prize_type_lu</code> table.</p>
 * 
 * @author isv
 * @version 1.0 (Re-platforming Studio Release 2 assembly)
 */
public class PrizeType extends Base {

    /**
     * <p>A <code>Long</code> providing the ID of this prize type.</p>
     */
    private Long id;

    /**
     * <p>A <code>String</code> providing the description of this prize type.</p>
     */
    private String description;

    /**
     * <p>Constructs new <code>PrizeType</code> instance. This implementation does nothing.</p>
     */
    public PrizeType() {
    }

    /**
     * <p>Gets the description of this prize type.</p>
     *
     * @return a <code>String</code> providing the description of this prize type.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this prize type.</p>
     *
     * @param description a <code>String</code> providing the description of this prize type.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the ID of this prize type.</p>
     *
     * @return a <code>Long</code> providing the ID of this prize type.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this prize type.</p>
     *
     * @param id a <code>Long</code> providing the ID of this prize type.
     */
    public void setId(Long id) {
        this.id = id;
    }
}
