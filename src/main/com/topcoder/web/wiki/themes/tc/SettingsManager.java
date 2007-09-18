package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaManager;
import com.atlassian.confluence.setup.bandana.ConfluenceBandanaContext;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 14, 2007
 */
public class SettingsManager {
    private BandanaManager bandanaManager;
    // use the theme key as identifier
    public String THEMEKEY = "com.topcoder.web.wiki.themes.tc:tc";

    /**
     * Creates a Manager to save and load Theme settings via Bandana.
     *
     * @param bandanaManager
     */
    public SettingsManager(BandanaManager bandanaManager) {
        setBandanaManager(bandanaManager);
    }

    /**
     * returns the theme settings for the page given.
     *
     * @return LeftNavSettings
     */

    public LeftNavSettings getPageThemeSettings(String spaceKey, String pageTitle) {
        return (LeftNavSettings) bandanaManager.getValue(new ConfluenceBandanaContext(spaceKey), THEMEKEY, false);
    }


    /**
     * saves the Theme Settings via Bandana in context to the given space and page
     *
     * @param settings
     * @param spaceKey
     */
    public void setPageThemeSettings(LeftNavSettings settings, String spaceKey, String pageTitle) {
        if (spaceKey==null) {
            throw new IllegalArgumentException("spaceKey can not be null");
        }
        if (pageTitle==null) {
            throw new IllegalArgumentException("pageTitle can not be null");
        }
        bandanaManager.setValue(new ConfluenceBandanaContext(spaceKey), THEMEKEY, settings);
    }

    public void setBandanaManager(BandanaManager bandanaManager) {
        this.bandanaManager = bandanaManager;
    }
}
