package com.topcoder.web.query.bean;

import java.io.Serializable;

/**
 * Class to hold info about a link.
 * @author Greg Paul
 */
public class LinkBean implements Serializable {
    private String href;
    private String name;

    public LinkBean() {
        setHref(null);
        setName(null);
    }

    public LinkBean(String href, String name) {
        setHref(href);
        setName(name);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

}