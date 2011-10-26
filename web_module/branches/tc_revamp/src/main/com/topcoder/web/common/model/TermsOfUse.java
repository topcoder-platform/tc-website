/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * <p>This class represents a Terms Of Use entity.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms-Studio Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added title, electronicallySignable and url attributes.</li>
 *   </ol>
 * </p>
 *
 * @author pulky
 * @version 1.1
 */
public class TermsOfUse extends Base {

    /**
     * Serial version UID for this class.
     *
     * Please change that number if you affect the fields in a way that will affect the
     * serialization for this object, i.e. when data members are changed.
     * @see http://java.sun.com/j2se/1.3/docs/guide/serialization/spec/version.doc7.html
     * @since 1.1
     */
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String text;
    private Integer typeId;

    /**
     * The terms of use title.
     *
     * @since 1.1
     */
    private String title;

    /**
     * A flag indicating if the terms of use is electronically signable.
     *
     * @since 1.1
     */
    private Integer electronicallySignable;

    /**
     * A URL address for a printer friendly terms of use page.
     *
     * @since 1.1
     */
    private String url;

    private Set users;

    public TermsOfUse() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    /**
     * Returns the terms of use title
     *
     * @return the title
     *
     * @since 1.1
     */
    public String getTitle() {
        return title;
    }

    /**
     * Sets the terms of use title
     *
     * @param title the title to set
     *
     * @since 1.1
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Returns the terms of use electronically signable flag
     *
     * @return 1 if the terms of use is electronically signable and 0 otherwise
     *
     * @since 1.1
     */
    public Integer getElectronicallySignable() {
        return electronicallySignable;
    }

    /**
     * Sets the terms of use electronically signable flag
     *
     * @param electronicallySignable the flag value to set
     *
     * @since 1.1
     */
    public void setElectronicallySignable(Integer electronicallySignable) {
        this.electronicallySignable = electronicallySignable;
    }

    /**
     * Returns the terms of use printer friendly version URL address
     *
     * @return the url
     *
     * @since 1.1
     */
    public String getUrl() {
        return url;
    }

    /**
     * Sets the terms of use printer friendly version URL address
     *
     * @param url the url to set
     *
     * @since 1.1
     */
    public void setUrl(String url) {
        this.url = url;
    }


    public Set getUsers() {
        return Collections.unmodifiableSet(users);
    }

    public void setUsers(Set users) {
        this.users = users;
    }


    public boolean equals(Object obj) {
        boolean ret = false;
        try {
            TermsOfUse other = (TermsOfUse) obj;
            ret = other.getId().equals(getId());
        } catch (ClassCastException e) {
            ret = false;
        }
        return ret;
    }

    public int hashCode() {
        return id.hashCode();
    }


}
