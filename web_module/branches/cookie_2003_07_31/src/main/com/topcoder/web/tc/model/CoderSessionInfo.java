package com.topcoder.web.tc.model;

import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;

import javax.servlet.http.HttpServletRequest;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.util.Set;
import java.util.Map;

public class CoderSessionInfo extends SessionInfo {
    private int rating;

    public CoderSessionInfo() {
        super();
    }

    public CoderSessionInfo(HttpServletRequest request, WebAuthentication authentication, Set groups) throws Exception {
        super(request, authentication, groups);
        rating = 0;
        if (!authentication.getActiveUser().isAnonymous()) {
            ResultSetContainer info = getInfo(authentication.getActiveUser().getId());
            if (!info.isEmpty()) {
                rating = info.getIntItem(0, "rating");
            }
        }
    }

    public int getRating() {
        return rating;
    }


    private ResultSetContainer getInfo(long userId) throws Exception {
        InitialContext context = null;
        DataSource ds = null;
        try {
            context = new InitialContext();
            ds = (DataSource)
                    PortableRemoteObject.narrow(context.lookup(DBMS.OLTP_DATASOURCE_NAME),
                            DataSource.class);
        } finally {
            BaseProcessor.close(context);
        }
        DataAccessInt dAccess = new CachedDataAccess(ds);

        Request r = new Request();
        r.setContentHandle("session_info");
        r.setProperty("cr", String.valueOf(userId));
        Map m = dAccess.getData(r);
        return (ResultSetContainer)m.get("session_info");
    }
}
