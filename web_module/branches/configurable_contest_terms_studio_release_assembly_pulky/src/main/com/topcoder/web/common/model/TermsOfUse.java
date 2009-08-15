/*
 * Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class TermsOfUse extends Base {

    private Integer id;
    private String text;
    private Integer typeId;

    private String title;
    private Integer electronicallySignable;
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
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the electronicallySignable
     */
    public Integer getElectronicallySignable() {
        return electronicallySignable;
    }

    /**
     * @param electronicallySignable the electronicallySignable to set
     */
    public void setElectronicallySignable(Integer electronicallySignable) {
        this.electronicallySignable = electronicallySignable;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
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
