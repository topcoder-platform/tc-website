package com.topcoder.web.query.common;

/**
 * Class to hold info about a link.
 * @author Greg Paul
 */
public class Link {
    private String href;
    private String name;

    public Link() {
        setHref(null);
        setName(null);
    }

    public Link(String href, String name) {
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