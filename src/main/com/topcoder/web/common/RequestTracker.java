package com.topcoder.web.common;

import com.topcoder.shared.util.Queue;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.ejb.requestservices.RequestServices;

import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * User: dok
 * Date: Nov 19, 2004
 * Time: 11:12:26 AM
 */
public class RequestTracker {

    private static final User GUEST = SimpleUser.createGuest();
    private static final int BATCH_PERIOD = 60 * 1000;

    private static List q = Collections.synchronizedList(new LinkedList());

    private static Logger log = Logger.getLogger(RequestTracker.class);
    private static Thread t = null;

    static {
        t = new RequestTrackerThread();
        t.run();
    }

    public static void trackRequest(TCRequest request) {
        q.add(new UserRequest(GUEST, request));
    }

    public static void trackRequest(User u, TCRequest request) {
        q.add(new UserRequest(u, request));
    }

    private class RequestTrackerThread extends Thread {
        public void run() {
            while (true) {
                try {
                    Thread.sleep(BATCH_PERIOD);
                    loadRequests();
                } catch (InterruptedException e) {
                    log.error("Interrupted while waiting for the next batch", e);
                }
            }
        }
    }

    private void loadRequests() {
        ArrayList a = new ArrayList(q.size());
        synchronized (q) {
            log.debug("beginning move from queue to temp storage");
            while (!q.isEmpty())
                a.add(((LinkedList) q).removeLast());
            log.debug("move from queue to temp storage complete");
        }
        InitialContext ctx = null;
        try {
            ctx = TCContext.getInitial();
            RequestServices rs = (RequestServices) BaseProcessor.createEJB(ctx, RequestServices.class);
            for (Iterator it = a.iterator(); it.hasNext();) {
                UserRequest r = (UserRequest) it.next();
                if (r.u.isAnonymous()) {
                    rs.createRequest(makeUrl(r.r), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                } else {
                    rs.createRequest(r.u.getId(), makeUrl(r.r), DBMS.COMMON_OLTP_DATASOURCE_NAME);
                }
            }

        } catch (Exception e) {
            log.error("Problem inserting request" + e);
        } finally {
            BaseProcessor.close(ctx);
        }

    }

    private String makeUrl(TCRequest request) {
        StringBuffer buf = new StringBuffer(254);
        buf.append("http://");
        buf.append(request.getServerName());
        buf.append(request.getContextPath());
        buf.append(request.getServletPath());
        String query = request.getQueryString();
        buf.append((query == null) ? ("") : ("?" + query));
        return buf.toString();
    }


    private class UserRequest {
        private User u;
        private TCRequest r;

        private UserRequest(User u, TCRequest r) {
            this.u = u;
            this.r = r;
        }
    }
}
