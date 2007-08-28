package com.topcoder.web.wiki.themes.tc;

import com.atlassian.bandana.BandanaManager;
import com.atlassian.confluence.pages.PageManager;
import com.atlassian.confluence.themes.ThemeManager;
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

    private PageManager pageManager;
    private BandanaManager bandanaManager;
    private ThemeManager themeManager;


    public LeftNavVelocityHelper() {
        log.debug("called constructor");
    }

    public String renderNavigation(String spaceKey) {

        log.debug("called render navigation");
        try {

            if (log.isDebugEnabled()) {
                log.debug("url gonna be " + "http://" + ApplicationServer.DISTRIBUTED_UI_SERVER_NAME + "/distui/");
            }
            URL url = new URL("http://" + ApplicationServer.DISTRIBUTED_UI_SERVER_NAME + "/distui/");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            StringBuilder b = new StringBuilder(conn.getContentLength());
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(
                            conn.getInputStream()));
            String inputLine;

            while ((inputLine = in.readLine()) != null) {
                b.append(inputLine);
            }
            in.close();


            return b.toString();
        } catch (MalformedURLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }


    public void setPageManager(PageManager pageManager) {
        this.pageManager = pageManager;
    }

    public void setBandanaManager(BandanaManager bandanaManager) {
        this.bandanaManager = bandanaManager;
    }

    public void setThemeManager(ThemeManager themeManager) {
        this.themeManager = themeManager;
    }
}
