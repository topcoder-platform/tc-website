package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaManager;
import com.atlassian.confluence.pages.Page;
import com.atlassian.confluence.pages.PageManager;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 14, 2007
 */
public class LeftNavVelocityHelper {
    private static final Logger log = Logger.getLogger(LeftNavVelocityHelper.class);

    private BandanaManager bandanaManager;
    private PageManager pageManager;


    public LeftNavVelocityHelper() {
        log.debug("called constructor");
    }

    public String renderNavigation(String spaceKey, String pageTitle) {

        log.debug("called render navigation");
        try {

            //figure out the appropriate node key to pass to the left nav so the the right node is highlighted.
            if (bandanaManager == null) {
                log.debug("bandana manager null");
            }
            SettingsManager settingsManager = new SettingsManager(bandanaManager);
            LeftNavSettings settings = settingsManager.getSpaceThemeSettings(spaceKey);

            String node = null;
            if (settings != null) {
                node = settings.getNavKey(pageTitle);
                if (node == null) {
                    //check if a parent page has something
                    Page p = pageManager.getPage(spaceKey, pageTitle);
                    if (p != null) {
                        Page parent = p.getParent();
                        while (parent != null && node == null) {
                            node = settings.getNavKey(parent.getTitle());
                            parent = parent.getParent();
                        }
                    }
                }
            }

            StringBuilder buf = new StringBuilder(100);
            buf.append("http://").append(ApplicationServer.DISTRIBUTED_UI_SERVER_NAME).append("/distui/?module=LeftNav");
            if (node != null && !"".equals(node)) {
                buf.append("&node=").append(node);
            }
            if (log.isDebugEnabled()) {
                log.debug("url gonna be " + buf.toString());
            }

            URL url = new URL(buf.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            StringBuilder b = new StringBuilder(10000);
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(
                            conn.getInputStream()));
            String inputLine;

            while ((inputLine = in.readLine()) != null) {
                b.append(inputLine);
                b.append("\n");
            }
            in.close();


            return b.toString();
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


    public void setBandanaManager(BandanaManager bandanaManager) {
        this.bandanaManager = bandanaManager;
    }

    public void setPageManager(PageManager pageManager) {
        this.pageManager = pageManager;
    }


}
