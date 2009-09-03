/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;

/**
 * <p>This class represents a Prize Type entity.</p>
 *
 * <p>
 *   Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) Change notes:
 *   <ol>
 *     <li>Added Serial version UID.</li>
 *     <li>Added MILESTONE type constant.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class PrizeType extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     * @since 1.1
     */
    private static final long serialVersionUID = 1L;

    public static final Integer CONTEST = 1;
    public static final Integer BONUS = 2;

    /**
     * Constant to store milestone prize type
     *
     * @since 1.1
     */
    public static final Integer MILESTONE = 3;

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Override using the description as the business key
     *
     * @param o the other object
     * @return whether they are the same or not
     */
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PrizeType)) return false;
        final PrizeType that = (PrizeType) o;
        return this.getDescription().equals(that.getDescription());
    }

    /**
     * Override using the business key of this object.
     *
     * @return the hashcode
     */
    public int hashCode() {
        return getDescription().hashCode();
    }
}
