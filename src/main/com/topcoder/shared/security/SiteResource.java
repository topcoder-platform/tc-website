package com.topcoder.shared.security;

public class SiteResource implements Resource {
    private String name;

    public SiteResource() {
        this.name="";
    }

    public SiteResource(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
