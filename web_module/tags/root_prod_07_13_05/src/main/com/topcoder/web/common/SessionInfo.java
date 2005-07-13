package com.topcoder.web.common;

import com.topcoder.security.RolePrincipal;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.WebAuthentication;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class SessionInfo implements Serializable {
    private static Logger log = Logger.getLogger(SessionInfo.class);

    private static final String GROUP_PREFIX = "group_";
    private String handle = null;
    private long userid = SimpleUser.createGuest().getId();
    private String serverName = null;
    private String servletPath = null;
    private String absoluteServletPath = null;
    private String queryString = null;
    private String requestString = null;
    private Date date = null;
    private boolean isLoggedIn = false;
    /** group may be:
     * 'G' guest
     * 'A' admin
     */
    private char group = 'G';

    public SessionInfo() {
        date = new Date();
    }

    public SessionInfo(TCRequest request, WebAuthentication authentication, Set groups) throws Exception {
        this();
        userid = authentication.getActiveUser().getId();
        handle = authentication.getActiveUser().getUserName();

        if (pruneGroups(groups).contains("Admin"))
            setGroup('A');
        else {
            setGroup('G');
        }

        serverName = request.getServerName();
        servletPath = request.getContextPath() + request.getServletPath();
        String query = request.getQueryString();
        queryString = (query == null) ? ("") : ("?" + query);
        StringBuffer buf = new StringBuffer(200);
        buf.append("http://");        //todo any better way than a hardcode?
        buf.append(request.getServerName());
        buf.append(servletPath);
        buf.append(queryString);
        requestString = buf.toString();

        absoluteServletPath = request.getServerName() + servletPath;

        isLoggedIn = !authentication.getUser().isAnonymous();
        //log.debug("servername: " + getServerName() + " servletpath:" + getServletPath() + " query: " +
        //        getQueryString() + " request: " + getRequestString());
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
        return userid == SimpleUser.createGuest().getId();
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

    public String getAbsoluteServletPath() {
        return "http://" + absoluteServletPath;
    }

    public String getSecureAbsoluteServletPath() {
        return "https://" + absoluteServletPath;
    }

    public String getQueryString() {
        return queryString;
    }

    public String getRequestString() {
        return requestString;
    }

    public Date getDate() {
        return date;
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
