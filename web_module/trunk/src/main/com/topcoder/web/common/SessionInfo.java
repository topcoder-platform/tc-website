package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.security.RolePrincipal;
import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpUtils;
import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;

public class SessionInfo {
    private static Logger log = Logger.getLogger(SessionInfo.class);

    private static final String GROUP_PREFIX = "group_";
    private String handle = null;
    private long userid = -1;
    private String serverName = null;
    private String servletPath = null;
    private String queryString = null;
    private String requestString = null;
    private boolean isLoggedIn = false;
    /** group may be:
     * 'G' guest
     * 'A' admin
     */
    private char group = 'G';

    public SessionInfo() { }

    public SessionInfo(HttpServletRequest request, WebAuthentication authentication, Set groups) throws Exception {
        userid = authentication.getActiveUser().getId();
        handle = authentication.getActiveUser().getUserName();

        if (pruneGroups(groups).contains("Admin"))
            setGroup('A');
        else {
            setGroup('G');
            handle = "";  // anonymous looks nameless to the jsps
        }

        serverName = request.getServerName();
        servletPath = request.getContextPath() + request.getServletPath();
        String query = request.getQueryString();
        queryString = (query==null) ? ("") : ("?"+query);
        requestString = HttpUtils.getRequestURL(request) + queryString;

        isLoggedIn = !authentication.getUser().isAnonymous();
    }


    public String getHandle() {
        return handle;
    }

    public long getUserId() {
        return userid;
    }

    private void setGroup(char group) {
        if (0 > "GA".indexOf(group))
            throw new IllegalArgumentException("no group class '" + group + "'");
        this.group = group;
    }

    public boolean isLoggedIn() {
        return isLoggedIn;
    }

    public boolean isAnonymous() {
        return group == 'G';
    }

    public boolean isAdmin() {
        return group == 'A';
    }

    public String getServerName() {
        return serverName;
    }

    public String getServletPath() {
        return servletPath;
    }

    public String getQueryString() {
        return queryString;
    }

    public String getRequestString() {
        return requestString;
    }


    protected Set pruneGroups(Set groups) {
        Set groupnames = new HashSet();
        Iterator it = groups.iterator();
        while (it.hasNext()) {
            String rolename = ((RolePrincipal) it.next()).getName();
            if (rolename.startsWith(GROUP_PREFIX))
                groupnames.add(rolename.substring(GROUP_PREFIX.length()));
        }
        return groupnames;
    }



}
