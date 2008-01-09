package com.topcoder.web.wiki.themes.tc;

import com.atlassian.confluence.user.AuthenticatedUserThreadLocal;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.WebConstants;

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

            StringBuilder buf = new StringBuilder(100);
            buf.append("http://").append(ApplicationServer.DISTRIBUTED_UI_SERVER_NAME).append("/distui/?module=Top&level1=wiki");

            long userId = getUserId(AuthenticatedUserThreadLocal.getUsername());
            if (log.isDebugEnabled()) {
                log.debug("user is : " + AuthenticatedUserThreadLocal.getUsername() + " XXX " + AuthenticatedUserThreadLocal.getUser());
            }
            if (userId!=SimpleUser.createGuest().getId()) {
                buf.append("&").append(WebConstants.USER_ID).append("=").append(userId);
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
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }



    private static long getUserId(String userName) throws Exception {
        if (userName==null) {
            return SimpleUser.createGuest().getId();
        } else {
            CachedDataAccess da = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

            Request r = new Request();
            r.setContentHandle("user_id_using_handle");
            r.setProperty(WebConstants.HANDLE, userName);
            ResultSetContainer rsc = da.getData(r).get("user_id");
            if (rsc.isEmpty())
                return SimpleUser.createGuest().getId();
            else
                return rsc.getLongItem(0, "user_id");
        }


    }

}
