/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.security.groups.services.dto;

import java.util.List;

/**
 * <p>
 * This class encapsulates results into pages.
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread safe.
 * </p>
 * 
 * @author TCSASSEMBLER
 * @version 1.0 (Topcoder Security Groups Backend Model and Authorization
 *          Assembly v1.0 )
 * @since 1.0
 */
public class PagedResult<T> {
    /**
     * <p>
     * Represents the total count of records if left unpaged. It is managed with
     * a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private int total;
    /**
     * <p>
     * Represents the current requested page. It is managed with a getter and
     * setter, hence fully mutable. It may have any value.
     * </p>
     */
    private int page;
    /**
     * <p>
     * Represents the items that exist in the requested page It is managed with
     * a getter and setter, hence fully mutable. It may have any value.
     * </p>
     */
    private List<T> values;

    /**
     * <p>
     * Default Constructor.
     * </p>
     */
    public PagedResult() {
    }

    /**
     * <p>
     * Getter of total field.
     * </p>
     * @return the total
     */
    public int getTotal() {
        return total;
    }

    /**
     * <p>
     * Setter of total field.
     * </p>
     * @param total the total to set
     */
    public void setTotal(int total) {
        this.total = total;
    }

    /**
     * <p>
     * Getter of page field.
     * </p>
     * @return the page
     */
    public int getPage() {
        return page;
    }

    /**
     * <p>
     * Setter of page field.
     * </p>
     * @param page the page to set
     */
    public void setPage(int page) {
        this.page = page;
    }

    /**
     * <p>
     * Getter of values field.
     * </p>
     * @return the values
     */
    public List<T> getValues() {
        return values;
    }

    /**
     * <p>
     * Setter of values field.
     * </p>
     * @param values the values to set
     */
    public void setValues(List<T> values) {
        this.values = values;
    }
}
