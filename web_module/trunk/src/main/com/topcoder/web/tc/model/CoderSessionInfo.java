package com.topcoder.web.tc.model;

import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.util.Set;
import java.util.Map;

public class CoderSessionInfo extends SessionInfo {
    private int rating;

    //these can probably go away when we get away from the legacy controller
    //they really just support some of the xsl
    private int rank;
    private String activationCode;
    private boolean hasImage;

    private static Logger log = Logger.getLogger(CoderSessionInfo.class);

    public CoderSessionInfo() {
        super();
    }

    public CoderSessionInfo(HttpServletRequest request, WebAuthentication authentication, Set groups) throws Exception {
        super(request, authentication, groups);
        rating = 0;
        rank = 0;
        if (!authentication.getActiveUser().isAnonymous()) {
            ResultSetContainer info = getInfo(authentication.getActiveUser().getId());
            if (!info.isEmpty()) {
                rating = info.getIntItem(0, "rating");
                hasImage = info.getIntItem(0, "has_image")>0;
                activationCode = info.getStringItem(0, "activation_code");
            } else {
                log.warn("couldn't find session info for: " + authentication.getActiveUser().getId());
            }
            ResultSetContainer rsc = getDwInfo(authentication.getActiveUser().getId());
            if (!rsc.isEmpty()) {
                rank = rsc.getIntItem(0, "rank");
            } else {
                log.debug("couldn't find rank info for: " + authentication.getActiveUser().getId());
            }
        }
    }

    public int getRating() {
        return rating;
    }

    public int getRank() {
        return rank;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public boolean hasImage() {
        return hasImage;
    }

    private ResultSetContainer getInfo(long userId) throws Exception {
        DataAccessInt dAccess = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);

        Request r = new Request();
        r.setContentHandle("session_info");
        r.setProperty("cr", String.valueOf(userId));
        Map m = dAccess.getData(r);
        return (ResultSetContainer)m.get("session_info");
    }

    private ResultSetContainer getDwInfo(long userId) throws Exception {
        DataAccessInt dAccess = new CachedDataAccess(DBMS.DW_DATASOURCE_NAME);

        Request r = new Request();
        r.setContentHandle("dw_session_info");
        r.setProperty("cr", String.valueOf(userId));
        Map m = dAccess.getData(r);
        return (ResultSetContainer)m.get("session_info");
    }

}
