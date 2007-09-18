package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaContext;
import com.atlassian.confluence.setup.bandana.ConfluenceBandanaContext;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 18, 2007
 */
public class PageBandanaContext implements BandanaContext {
    private String pageTitle;
    public static final ConfluenceBandanaContext GLOBAL_CONTEXT = new ConfluenceBandanaContext();
    private ConfluenceBandanaContext spaceContext;

    /**
     * Create a global context
     */
    private PageBandanaContext() {
    }

    public PageBandanaContext(String spaceKey, String pageTitle) {
        spaceContext = new ConfluenceBandanaContext(spaceKey);
        this.pageTitle = pageTitle;
    }

    public String getSpaceKey() {
        return spaceContext.getSpaceKey();
    }


    public String getPageTitle() {
        return pageTitle;
    }

    public BandanaContext getParentContext() {
        return spaceContext;
    }

    public boolean hasParentContext() {
        return true;
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PageBandanaContext)) return false;

        final PageBandanaContext pageBandanaContext = (PageBandanaContext) o;

        return getParentContext().equals(pageBandanaContext.getParentContext()) &&
                pageTitle.equals(pageBandanaContext.getPageTitle());

    }

    public int hashCode() {
        String key = spaceContext.getSpaceKey() + "_" + pageTitle;
        return key.hashCode();
    }

    public String toString() {
        return "[" + super.toString() + ", pageTitle='" + pageTitle + "']";
    }

    /**
     * @return a String that identifies the particular context in Confluence. Different instances
     * that refer to the same space will have the same key.
     */
    public String getContextKey() {
        return spaceContext.getSpaceKey() + "_" + pageTitle;
    }

    public boolean isGlobal() {
        return false;
    }
}