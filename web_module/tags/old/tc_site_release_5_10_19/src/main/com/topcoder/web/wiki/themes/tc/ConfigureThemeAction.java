package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaManager;
import com.atlassian.confluence.spaces.actions.AbstractSpaceAction;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 14, 2007
 */
public class ConfigureThemeAction extends AbstractSpaceAction {
    private BandanaManager bandanaManager;
    private String spacekey;
    private String pagename = "Navigation";

    /**
     * is excecuteted when you first enter the configuration page
     *
     * @return
     * @throws Exception
     */
    public String doDefault() throws Exception {
        ClassLoader callersLoader = Thread.currentThread().getContextClassLoader();
        try {
            // TEMPORARY HACK: until we work out a way to make the plugin class loaders available to the system correctly.
            // Without this, bandana will not be able to deserialise the LeftNavSettings object.
            Thread.currentThread().setContextClassLoader(getClass().getClassLoader());

            // First get a settings manager to read already existing values...
            SettingsManager settingsManager = new SettingsManager(bandanaManager);
            LeftNavSettings settings;
            if (getSpace() != null)
                settings = settingsManager.getSpaceThemeSettings(getSpace().getKey());
            else
                settings = settingsManager.getGlobalThemeSettings();
            if (settings != null) {
                // ... and set the values in the view accordingly if values exist.
                setPagename(settings.getPage());
                setSpacekey(settings.getSpace());
            }
            return INPUT;
        }
        finally {
            Thread.currentThread().setContextClassLoader(callersLoader);
        }
    }

    /**
     * is excecuted after the form was submitted.
     *
     * @return
     * @throws Exception
     */
    public String execute() throws Exception {
        // after submission of the form we will have to create a new settings manager
        SettingsManager settingsManager = new SettingsManager(bandanaManager);
        //preset the object we want to serialize with the values of the form fields.
        LeftNavSettings settings = new LeftNavSettings();
        settings.setPage(pagename);
        settings.setSpace(spacekey);
        // and save the settings.
        if (getSpace() != null)
            settingsManager.setSpaceThemeSettings(settings, getSpace().getKey());
        else
            settingsManager.setGlobalThemeSettings(settings);
        return SUCCESS;
    }

    public List getSpaces() {
        return spaceManager.getSpaces();
    }

    public String getSpacekey() {
        return spacekey;
    }

    public void setSpacekey(String spacekey) {
        this.spacekey = spacekey;
    }

    public String getPagename() {
        return pagename;
    }

    public void setPagename(String pagename) {
        this.pagename = pagename;
    }

    public void setBandanaManager(BandanaManager bandanaManager) {
        this.bandanaManager = bandanaManager;
    }
}
