/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;

/**
 * This class represents the declaration item.
 *
 * Mutable and not thread-safe.
 *
 * @author Standlove, TCSDEVELOPER
 * @version 1.0
 */
public class DeclarationItem implements Serializable {
    /**
     * Represents the name. Can be any value. It has getter and setter.
     */
    private String name;

    /**
     * Represents the URL. Can be any value. It has getter and setter.
     */
    private String url;

    /**
     * Represents the file number. Can be any value. It has getter and setter.
     */
    private String fileNumber;

    /**
     * Returns name.
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
     * Returns url.
     *
     * @return url
     */
    public String getUrl() {
        return url;
    }

    /**
     * Sets url.
     *
     * @param url value to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * Returns file number.
     *
     * @return file number
     */
    public String getFileNumber() {
        return fileNumber;
    }

    /**
     * Sets file number
     *
     * @param fileNumber value to set
     */
    public void setFileNumber(String fileNumber) {
        this.fileNumber = fileNumber;
    }
}
