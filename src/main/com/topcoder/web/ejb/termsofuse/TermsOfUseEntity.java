/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.termsofuse;

import java.io.Serializable;

/**
 * <p>Simple entity class for a Terms Of Use to be used by the Terms Of Use EJB.</p>
 *
 * @author pulky
 * @version 1.0 (Configurable Contest Terms Release Assembly v1.0)
 */
public class TermsOfUseEntity implements Serializable {

    /**
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     *
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     * @since 1.1
     */
    private static final long serialVersionUID = 1L;

    /**
     * The terms of use id.
     */
    private Long termsOfUseId;

    /**
     * The terms of use text.
     */
    private String termsText;

    /**
     * The terms of use type id.
     */
    private Integer termsOfUseTypeId;

    /**
     * The terms of use title.
     */
    private String title;

    /**
     * The terms of use electronically signable flag.
     */
    private Integer electronicallySignable;

    /**
     * The terms of use url.
     */
    private String url;

    /**
     * Default empty constructor.
     */
    public TermsOfUseEntity() {
        super();
    }

    /**
     * Constructs a <code>TermsOfUseEntity</code> using parameters.
     *
     * @param electronicallySignable The terms of use electronically signable flag.
     * @param termsOfUseId The terms of use id
     * @param termsOfUseTypeId The terms of use type id
     * @param termsText The terms of use text
     * @param title The terms of use title
     * @param url The terms of use url
     */
    public TermsOfUseEntity(Long termsOfUseId, String termsText, Integer termsOfUseTypeId,
             String title, Integer electronicallySignable, String url) {
        super();
        this.electronicallySignable = electronicallySignable;
        this.termsOfUseId = termsOfUseId;
        this.termsOfUseTypeId = termsOfUseTypeId;
        this.termsText = termsText;
        this.title = title;
        this.url = url;
    }

    /**
     * Getter for the Terms of use id
     *
     * @return the termsOfUseId
     */
    public Long getTermsOfUseId() {
        return termsOfUseId;
    }

    /**
     * Setter for the Terms of use id
     *
     * @param termsOfUseId the termsOfUseId to set
     */
    public void setTermsOfUseId(Long termsOfUseId) {
        this.termsOfUseId = termsOfUseId;
    }

    /**
     * Getter for the Terms of use text
     *
     * @return the termsText
     */
    public String getTermsText() {
        return termsText;
    }

    /**
     * Setter for the Terms of use text
     *
     * @param termsText the termsText to set
     */
    public void setTermsText(String termsText) {
        this.termsText = termsText;
    }

    /**
     * Getter for the Terms of use type id
     *
     * @return the termsOfUseTypeId
     */
    public Integer getTermsOfUseTypeId() {
        return termsOfUseTypeId;
    }

    /**
     * Setter for the Terms of use type id
     *
     * @param termsOfUseTypeId the termsOfUseTypeId to set
     */
    public void setTermsOfUseTypeId(Integer termsOfUseTypeId) {
        this.termsOfUseTypeId = termsOfUseTypeId;
    }

    /**
     * Getter for the Terms of use title
     *
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * Setter for the Terms of use title
     *
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Getter for the Terms of use electronically signable flag
     *
     * @return the electronicallySignable
     */
    public Integer getElectronicallySignable() {
        return electronicallySignable;
    }

    /**
     * Setter for the Terms of use electronically signable flag
     *
     * @param electronicallySignable the electronicallySignable to set
     */
    public void setElectronicallySignable(Integer electronicallySignable) {
        this.electronicallySignable = electronicallySignable;
    }

    /**
     * Getter for the Terms of use url
     *
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * Setter for the Terms of use url
     *
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }
}
