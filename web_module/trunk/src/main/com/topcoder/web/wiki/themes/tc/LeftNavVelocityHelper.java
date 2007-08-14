package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaManager;
import com.atlassian.confluence.pages.Page;
import com.atlassian.confluence.pages.PageManager;
import com.atlassian.confluence.renderer.PageContext;
import com.atlassian.confluence.themes.ThemeManager;
import com.atlassian.renderer.WikiStyleRenderer;
import com.opensymphony.util.TextUtils;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 14, 2007
 */
public class LeftNavVelocityHelper {
    public static final String DEFAULT_NAVIGATION_PAGE_NAME = "Navigation";

    private PageManager pageManager;
    private WikiStyleRenderer wikiStyleRenderer;
    private BandanaManager bandanaManager;
    private ThemeManager themeManager;

    public boolean hasNavigation(String spaceKey) {
        return getNavigationPage(spaceKey) != null;
    }

    public String renderNavigation(String spaceKey, String currentPageId) {
        Page page = getNavigationPage(spaceKey);

        if (page == null)
            return "";

        if (TextUtils.stringSet(currentPageId)) {
            Page currentPage = pageManager.getPage(new Long(currentPageId).longValue());
            return wikiStyleRenderer.convertWikiToXHtml(new PageContext(currentPage), page.getContent());
        } else {
            return wikiStyleRenderer.convertWikiToXHtml(new PageContext(spaceKey), page.getContent());
        }
    }

    /**
     * Determine the navigation page.
     * Function will check for space-theme settings if a spaceKey is given.
     * If no spaceKey is defined or no configuration can be found, check for the global settings.
     * If there are no global settings for the theme, take the default page defined in this class.
     *
     * @param spaceKey
     * @return
     */
    private Page getNavigationPage(String spaceKey) {
        SettingsManager settingsManager = new SettingsManager(bandanaManager);
        LeftNavSettings settings;

        if (spaceKey != null) {
            settings = getSpaceLevelSettings(spaceKey, settingsManager);
            if (settings != null)
                return pageManager.getPage(spaceKey, settings.getPage());
        }

        settings = settingsManager.getGlobalThemeSettings();
        if (settings != null) {
            String space;
            if (!TextUtils.stringSet(settings.getSpace()))
                space = spaceKey;
            else
                space = settings.getSpace();
            return pageManager.getPage(space, settings.getPage());
        }
        return pageManager.getPage(spaceKey, DEFAULT_NAVIGATION_PAGE_NAME);
    }


    /**
     * Checks whether the ActiveSpace Theme equals the current theme.
     * The themekey specified in the SettingsManager must be the same as the current theme key.
     *
     * @param spaceKey
     * @param settingsManager
     * @return LeftNavSettings if the theme is active and has saved settings. Otherwise it returns null
     */
    public LeftNavSettings getSpaceLevelSettings(String spaceKey, SettingsManager settingsManager) {
        if (themeManager.getSpaceThemeKey(spaceKey) != null) {
            // if this theme is activated, get the spaceThemeSettings
            if (themeManager.getSpaceThemeKey(spaceKey).equalsIgnoreCase(settingsManager.THEMEKEY)) {
                LeftNavSettings settings = settingsManager.getSpaceThemeSettings(spaceKey);
                return settings;
            }
        }
        return null;
    }


    public void setPageManager(PageManager pageManager) {
        this.pageManager = pageManager;
    }

    public void setWikiStyleRenderer(WikiStyleRenderer wikiStyleRenderer) {
        this.wikiStyleRenderer = wikiStyleRenderer;
    }

    public void setBandanaManager(BandanaManager bandanaManager) {
        this.bandanaManager = bandanaManager;
    }

    public void setThemeManager(ThemeManager themeManager) {
        this.themeManager = themeManager;
    }
}
