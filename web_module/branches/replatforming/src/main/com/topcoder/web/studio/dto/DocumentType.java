/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.doc_types</code> table.</p>
 * 
 * @author isv
 * @version 1.0 (Re-platforming Studio Release 2 assembly)
 */
public class DocumentType extends Base {

    /**
     * <p>A <code>Long</code> providing the ID of this document type.</p>
     */
    private Long id;

    /**
     * <p>A <code>String</code> providing the description of this document type.</p>
     */
    private String description;

    /**
     * <p>Constructs new <code>DocumentType</code> instance. This implementation does nothing.</p>
     */
    public DocumentType() {
    }

    /**
     * <p>Gets the description of this document type.</p>
     *
     * @return a <code>String</code> providing the description of this document type.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this document type.</p>
     *
     * @param description a <code>String</code> providing the description of this document type.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the ID of this document type.</p>
     *
     * @return a <code>Long</code> providing the ID of this document type.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this document type.</p>
     *
     * @param id a <code>Long</code> providing the ID of this document type.
     */
    public void setId(Long id) {
        this.id = id;
    }
}
