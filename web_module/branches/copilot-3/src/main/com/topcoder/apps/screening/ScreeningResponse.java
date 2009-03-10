/*
 * Copyright (c) 2005 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.apps.screening;

/**
 * A screening response bean. 
 *
 * @author WishingBone
 * @version 1.0
 */
public class ScreeningResponse {

    private String severity = null;
    private String code = null;
    private String response = null;
    private String[] text = null;

    public String getSeverity() {
        return this.severity;
    }
    public void setSeverity(String severity) {
        this.severity = severity;
    }

    public String getCode() {
        return this.code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    public String getResponse() {
        return this.response;
    }
    public void setResponse(String response) {
        this.response = response;
    }

    public String[] getText() {
        return this.text;
    }
    public void setText(String[] text) {
        this.text = text;
    }

}
