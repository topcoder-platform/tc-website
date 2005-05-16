package com.topcoder.web.corp.controller.request.tces;

/**
 * Class to hold info about a link.
 * @author Greg Paul
 */
public class TrailItem {
    private String href;
    private String name;

    public TrailItem() {
        setHref(null);
        setName(null);
    }

    public TrailItem(String href, String name) {
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