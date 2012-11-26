/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.mime_type_lu</code> table.</p>
 * 
 * @author pvmagacho
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public class MimeType extends Base {
    /**
     * <p>A <code>Long</code> providing the ID of this mime type.</p>
     */
    private Long id;
    
    /**
     * <p>A <code>String</code> providing the description of this mime type.</p>
     */
    private String description;
    
    /**
     * <p>A <code>FileType</code> instance file type associated with this mime type.</p>
     */
    private FileType fileType;

    /**
     * <p>Gets the ID of this mime type.</p>
     *
     * @return a <code>Long</code> providing the ID of this mime type.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this mime type.</p>
     *
     * @param id a <code>Long</code> providing the ID of this mime type.
     */
    public void setId(Long id) {
        this.id = id;
    }
    
    /**
     * <p>Gets the description of mime type.</p>
     *
     * @return a <code>String</code> providing the description of mime type.
     */
    public String getDescription() {
        return this.description;
    }

    /**
     * <p>Sets the description of this mime type.</p>
     *
     * @param description a <code>String</code> providing the description of mime type.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * <p>Gets the <code>FileType</code> instance file type associated with this mime type.</p>
     *
     * @return the <code>FileType</code> instance file type associated with this mime type
     */
    public FileType getFileType() {
        return fileType;
    }

    /**
     * <p>Sets the <code>FileType</code> instance file type associated with this mime type.</p>
     * 
     * @param fileType the <code>FileType</code> instance file type associated with this mime type
     */
    public void setFileType(FileType fileType) {
        this.fileType = fileType;
    }

}
