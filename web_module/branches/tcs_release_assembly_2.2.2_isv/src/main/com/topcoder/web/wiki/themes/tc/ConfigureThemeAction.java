package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaManager;
import com.atlassian.confluence.pages.Page;
import com.atlassian.confluence.pages.PageManager;
import com.atlassian.confluence.spaces.Space;
import com.atlassian.confluence.spaces.SpaceType;
import com.atlassian.confluence.spaces.actions.AbstractSpaceAction;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 14, 2007
 */
public class ConfigureThemeAction extends AbstractSpaceAction {
    private static final Logger log = Logger.getLogger(ConfigureThemeAction.class);
    private BandanaManager bandanaManager;
    private PageManager pageManager;
    private Iterator<Map.Entry<String,  Iterator<Map.Entry<String, String>>>> navKeys;
    private String pageTitle;
    private String navKey;
    private String spacekey;

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
            TreeMap<String,  Iterator<Map.Entry<String, String>>> temp =
                    new TreeMap<String,  Iterator<Map.Entry<String, String>>>();
            for (Object o : spaces) {
                s = (Space)o;
                LeftNavSettings setting = settingsManager.getSpaceThemeSettings(s.getKey());
                if (setting!=null && !setting.isEmpty()) {
                    temp.put(s.getKey(), setting.iterator());
                }
            }
            navKeys=temp.entrySet().iterator();
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

        if (!"".equals(StringUtils.checkNull(getPageTitle())) && !"".equals(StringUtils.checkNull(getSpacekey()))) {
            //a little lazy on the validation, we could check that the space and title actually exist
            if (spaceManager.getSpace(getSpacekey())!=null) {
              if (pageManager.getPage(getSpacekey(), getPageTitle()) !=null) {

                  SettingsManager settingsManager = new SettingsManager(bandanaManager);
                  LeftNavSettings settings = settingsManager.getSpaceThemeSettings(getSpacekey());
                  if (settings ==null) {
                      settings = new LeftNavSettings();
                      settings.setSpace(getSpacekey());
                  }
                  if ("".equals(StringUtils.checkNull(getNavKey()))) {
                      settings.removeNavKey(getPageTitle());
                  } else {
                     settings.setNavKey(getPageTitle(), getNavKey());
                  }
                  settingsManager.setSpaceThemeSettings(settings, getSpacekey());
                  return SUCCESS;
              } else {
                  addActionError("page not found " + getPageTitle());
              }
            } else {
                addActionError("space not found " + getSpacekey());
            }

        }
        if (getActionErrors().size() > 0) {
            return ERROR;
        } else {
            return SUCCESS;
        }
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

    public Iterator<Map.Entry<String,  Iterator<Map.Entry<String, String>>>> getNavKeys() {
        return navKeys;
    }


    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }

    public String getSpacekey() {
        return spacekey;
    }

    public void setSpacekey(String spacekey) {
        this.spacekey = spacekey;
    }

    public String getNavKey() {
        return navKey;
    }

    public void setNavKey(String navKey) {
        this.navKey = navKey;
    }
}
