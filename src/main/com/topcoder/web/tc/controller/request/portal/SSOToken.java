/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.portal;

import java.util.Date;

/**
 * Simple DTO for SSO token.
 *
 * @author gevak
 * @version 1.0
 */
public class SSOToken {

    /**
     * When token expires.
     */
    private Date expiresAt;

    /**
     * SSO URL which includes the token.
     */
    private String url;

    /**
     * Creates instance.
     */
    public SSOToken() {
    }

    /**
     * Gets when token expires.
     *
     * @return When token expires.
     */
    public Date getExpiresAt() {
        return expiresAt;
    }

    /**
     * Sets when token expires.
     *
     * @param expiresAt When token expires.
     */
    public void setExpiresAt(Date expiresAt) {
        this.expiresAt = expiresAt;
    }

    /**
     * Gets SSO URL which includes the token.
     *
     * @return SSO URL which includes the token.
     */
    public String getUrl() {
        return url;
    }

    /**
     * Sets SSO URL which includes the token.
     * 
     * @param url SSO URL which includes the token.
     */
    public void setUrl(String url) {
        this.url = url;
    }
    
}
