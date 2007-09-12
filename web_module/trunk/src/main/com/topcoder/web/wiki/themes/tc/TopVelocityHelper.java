package com.topcoder.web.wiki.themes.tc;

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
 *          Create Date: Sep 12, 2007
 */
public class TopVelocityHelper {
    private static final Logger log = Logger.getLogger(LeftNavVelocityHelper.class);

    public TopVelocityHelper() {
        log.debug("called constructor");
    }

    public String renderTop() {

        log.debug("called render top");
        try {

            if (log.isDebugEnabled()) {
                log.debug("url gonna be " + "http://" + ApplicationServer.DISTRIBUTED_UI_SERVER_NAME + "/distui/");
            }
            URL url = new URL("http://" + ApplicationServer.DISTRIBUTED_UI_SERVER_NAME + "/distui/?module=Top");
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


}
