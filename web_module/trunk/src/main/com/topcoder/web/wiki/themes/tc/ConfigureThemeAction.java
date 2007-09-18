package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaManager;
import com.atlassian.confluence.pages.Page;
import com.atlassian.confluence.pages.PageManager;
import com.atlassian.confluence.spaces.Space;
import com.atlassian.confluence.spaces.SpaceType;
import com.atlassian.confluence.spaces.actions.AbstractSpaceAction;
import com.opensymphony.xwork.ActionContext;
import com.topcoder.shared.util.logging.Logger;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 14, 2007
 */
public class ConfigureThemeAction extends AbstractSpaceAction {
    private static final Logger log = Logger.getLogger(ConfigureThemeAction.class);
    private BandanaManager bandanaManager;
    private PageManager pageManager;
    private List navKeys;

    /**
     * is excecuteted when you first enter the configuration page
     *
     * @return
     * @throws Exception
     */
    public String doDefault() throws Exception {
        log.debug("doDefault called");
        ClassLoader callersLoader = Thread.currentThread().getContextClassLoader();
        try {
            // TEMPORARY HACK: until we work out a way to make the plugin class loaders available to the system correctly.
            // Without this, bandana will not be able to deserialise the LeftNavSettings object.
            Thread.currentThread().setContextClassLoader(getClass().getClassLoader());

            // First get a settings manager to read already existing values...
            SettingsManager settingsManager = new SettingsManager(bandanaManager);
            Space s;
            Page p;
            List spaces = getSpaces();
            navKeys=new ArrayList(spaces.size());
            for (Object o : spaces) {
                s = (Space)o;
                List pages = pageManager.getPages(s, true);
                for (Object page : pages) {
                    p = (Page)page;
                    LeftNavSettings setting = settingsManager.getPageThemeSettings(s.getKey(), p.getTitle());
                    if (setting!=null) {
                        navKeys.add(setting);
                    }
                }
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
        log.debug("execute called");
        // after submission of the form we will have to create a new settings manager
        SettingsManager settingsManager = new SettingsManager(bandanaManager);
        //preset the object we want to serialize with the values of the form fields.

        Map params = ActionContext.getContext().getParameters();

        Space s;
        Page p;
        String[] navKey;
        for (Object o : getSpaces()) {
            s = (Space)o;
            List pages = pageManager.getPages(s, true);
            for (Object page : pages) {
                p = (Page)page;
                navKey = (String[])params.get(s.getKey()+"_"+p.getTitle());
                LeftNavSettings settings = new LeftNavSettings();
                settings.setSpace(s.getKey());
                settings.setPageTitle(p.getTitle());
                //accessing the parameters directly because i can't figure out how to do it
                //correctly within the framework with the autowiring
                settings.setNavKey(navKey[0]);//we are assuming only 1 will be present
                settingsManager.setPageThemeSettings(settings, s.getKey(), p.getTitle());

            }
        }

        return SUCCESS;
    }

    public List getSpaces() {
        return spaceManager.getSpacesByType(SpaceType.GLOBAL);
    }

    public void setBandanaManager(BandanaManager bandanaManager) {
        this.bandanaManager = bandanaManager;
    }


    public void setPageManager(PageManager pageManager) {
        this.pageManager = pageManager;
    }

    public List getNavKeys() {
        return navKeys;
    }

    public void setNavKeys(List navKeys) {
        this.navKeys = navKeys;
    }

}
