/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

/**
 * <p>This class represents the external content property (e.g. Name, URL, FileNumber), mapped to TCS catalog
 * database.</p>
 *
 * <p>Mutable and not thread-safe.</p>
 *
 * @author pvmagacho
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public class ExternalContentProperty extends Base {
    /**
     * Serial id.
     */
    private static final long serialVersionUID = -1243050201401258043L;

    /**
     * Represents the external content property id. Can be any value. It has getter and setter.
     */
    private long id;

    /**
     * Represents the external content. Can be any value. It has getter and setter.
     */
    private ExternalContent externalContent;

    /**
     * Represents the name of external content property. Can be any value. It has getter and setter.
     */
    private String name;

    /**
     * Represents the value of external content property. Can be any value. It has getter and setter.
     */
    private String value;

    /**
     * Returns id.
     *
     * @return id
     */
    public long getId() {
        return id;
    }

    /**
     * Sets id.
     *
     * @param id value to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * Returns external content.
     *
     * @return external content
     */
    public ExternalContent getExternalContent() {
        return externalContent;
    }

    /**
     * Sets external content.
     *
     * @param externalContent value to set
     */
    public void setExternalContent(ExternalContent externalContent) {
        this.externalContent = externalContent;
    }

    /**
     * Returns name
     *
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * Sets name.
     *
     * @param name value to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Returns value
     *
     * @return value
     */
    public String getValue() {
        return value;
    }

    /**
     * Sets value.
     *
     * @param value value to set
     */
    public void setValue(String value) {
        this.value = value;
    }

}
