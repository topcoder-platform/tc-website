package com.topcoder.common.web.error;


public class NavigationException extends TCException {


    private String url;
    private String errorURL;


    public NavigationException() {
    }


    public NavigationException(String message, String url, String errorURL) {
        super(message);
        this.url = url;
        this.errorURL = errorURL;
    }

    public NavigationException(String message, String url) {
        super(message);
        this.url = url;
    }

    public String getUrl() {
        return this.url;
    }

    public String getErrorURL() {
        return this.errorURL;
    }


}
