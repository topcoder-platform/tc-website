/*
 * ResponseType.java
 *
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;


/**
 * Object representation of the type of response type of a subjective response.  Possible response types include
 * &quot;required&quot;, &quot;recommended&quot; and &quot;comment.&quot;
 *
 * @author FatClimber
 * @version 1.0
 */
public class ResponseType implements Serializable {
    private long id;
    private String name;

    /**
     *
     */
    public ResponseType(long id, String name) {
        this.id = id;
        this.name = name;
    }

    /**
     * <p>
     * Return the name of the type of response.
     * </p>
     *
     * @return a String with the name of the type of response.
     */
    public String getName() {
        return name;
    }

    /**
     * <p>
     * Return the id of this the type of response.
     * </p>
     *
     * @return the id of this the type of response.
     */
    public long getId() {
        return id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#equals(java.lang.Object)
     */
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }

        if (!(o instanceof ResponseType)) {
            return false;
        }

        ResponseType respType = (ResponseType) o;

        return respType.getId() == this.id;
    }

    /* (non-Javadoc)
     * @see java.lang.Object#hashCode()
     */
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
