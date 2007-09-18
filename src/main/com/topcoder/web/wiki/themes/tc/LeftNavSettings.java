package com.topcoder.web.wiki.themes.tc;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 14, 2007
 */
public class LeftNavSettings implements Serializable {
    private String space;
    private String pageTitle;
    private String navKey;


    public String getSpace() {
        return space;
    }

    public void setSpace(String space) {
        this.space = space;
    }

    public String getNavKey() {
        return navKey;
    }

    public void setNavKey(String navKey) {
        this.navKey = navKey;
    }


    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }
}
