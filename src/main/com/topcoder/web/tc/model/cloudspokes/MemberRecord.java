/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.model.cloudspokes;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.codehaus.jackson.annotate.JsonProperty;

import java.io.Serializable;

/**
 * <p>
 * The entity model to represent the member record of a participant of the CloudSpokes challenge.
 * It has annotations to use by the jackson to deserialize json string to the instance of this class.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 1.0 (Release Assembly - TopCoder and CloudSpokes Platform Integration Phase 1)
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class MemberRecord implements Serializable {

    /**
     * The name.
     */
    @JsonProperty("name")
    private String name;

    /**
     * Gets the name.
     *
     * @return the name.
     */
    public String getName() {
        return name;
    }

    /**
     * Sets the name.
     *
     * @param name the name.
     */
    public void setName(String name) {
        this.name = name;
    }
}
