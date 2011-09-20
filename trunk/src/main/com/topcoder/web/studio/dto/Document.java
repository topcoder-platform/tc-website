/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>An entity class mapped to <code>tcs_catalog.comp_documentation</code> table.</p>
 * 
 * @author isv
 * @version 1.0 (Re-platforming Studio Release 2 assembly)
 */
public class Document extends Base {

    /**
     * <p>A <code>Long</code> providing the ID of this document.</p>
     */
    private Long id;

    /**
     * <p>A <code>Long</code> providing the .</p>
     */
    private Long compVersionId;

    /**
     * <p>A <code>DocumentType</code> providing the type of this document.</p>
     */
    private DocumentType type;

    /**
     * <p>A <code>String</code> providing the document name.</p>
     */
    private String name;

    /**
     * <p>A <code>String</code> providing the URL referencing the document content.</p>
     */
    private String url;

    /**
     * <p>Constructs new <code>Document</code> instance. This implementation does nothing.</p>
     */
    public Document() {
    }

    /**
     * <p>Gets the URL referencing the document content.</p>
     *
     * @return a <code>String</code> providing the URL referencing the document content.
     */
    public String getUrl() {
        return this.url;
    }

    /**
     * <p>Sets the URL referencing the document content.</p>
     *
     * @param url a <code>String</code> providing the URL referencing the document content.
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * <p>Gets the document name.</p>
     *
     * @return a <code>String</code> providing the document name.
     */
    public String getName() {
        return this.name;
    }

    /**
     * <p>Sets the document name.</p>
     *
     * @param name a <code>String</code> providing the document name.
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * <p>Gets the type of this document.</p>
     *
     * @return a <code>DocumentType</code> providing the type of this document.
     */
    public DocumentType getType() {
        return this.type;
    }

    /**
     * <p>Sets the type of this document.</p>
     *
     * @param type a <code>DocumentType</code> providing the type of this document.
     */
    public void setType(DocumentType type) {
        this.type = type;
    }

    /**
     * <p>Gets the .</p>
     *
     * @return a <code>Long</code> providing the .
     */
    public Long getCompVersionId() {
        return this.compVersionId;
    }

    /**
     * <p>Sets the .</p>
     *
     * @param compVersionId a <code>Long</code> providing the .
     */
    public void setCompVersionId(Long compVersionId) {
        this.compVersionId = compVersionId;
    }

    /**
     * <p>Gets the ID of this document.</p>
     *
     * @return a <code>Long</code> providing the ID of this document.
     */
    public Long getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this document.</p>
     *
     * @param id a <code>Long</code> providing the ID of this document.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * <p>Gets the short name for the document.</p>
     * 
     * @return a <code>String</code> providing the short name for this document.
     */
    public String getShortName() {
        if (this.url == null) {
            return null;
        } else {
            int pos = this.url.lastIndexOf("/");
            return this.url.substring(pos + 1);
        }
    }
}
