package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaManager;
import com.atlassian.confluence.setup.bandana.ConfluenceBandanaContext;

/**
 * @author dok
 * @version $Revision: 65357 $ Date: 2005/01/01 00:00:00
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
     * returns the theme settings for the space given.
     * If no space is give, the global settings are returned.
     *
     * @return LeftNavSettings
     */

    public LeftNavSettings getSpaceThemeSettings(String spaceKey) {
        return (LeftNavSettings) bandanaManager.getValue(new ConfluenceBandanaContext(spaceKey), THEMEKEY, false);
    }


    /**
     * saves the Theme Settings via Bandana in context to the given space.
     * If the space is null, the settings will be saved as global settings.
     *
     * @param settings
     * @param spaceKey
     */
    public void setSpaceThemeSettings(LeftNavSettings settings, String spaceKey) {
        bandanaManager.setValue(new ConfluenceBandanaContext(spaceKey), THEMEKEY, settings);
    }

    public void setBandanaManager(BandanaManager bandanaManager) {
        this.bandanaManager = bandanaManager;
    }
}
